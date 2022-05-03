import 'dart:async';
import 'dart:math';

import 'package:esnya/domain/user_data/user_diet_preferences_repository.dart';
import 'package:esnya/presentation/core/widgets/bucket_date_title_list_item.dart';
import 'package:esnya/presentation/core/widgets/dashboard_header/dashboard_header.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry_list_tile.dart';
import 'package:esnya/presentation/core/widgets/no_entries_yet_list_item.dart';
import 'package:esnya/presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart';
import 'package:esnya_shared_resources/esnya_shared_resources.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:esnya/application/food_data/input/food_input_bloc.dart';
import 'package:esnya/application/home_screen/bloc/dashboard_bloc.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/constants.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:esnya/presentation/core/design_components/esnya_design_utils.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/widgets/food_input_bar/food_input_bar.dart';
import 'package:esnya/presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardTabView extends StatefulWidget {
  const DashboardTabView({Key? key}) : super(key: key);

  @override
  State<DashboardTabView> createState() => _DashboardTabViewState();
}

class _DashboardTabViewState extends State<DashboardTabView>
    with AutomaticKeepAliveClientMixin {
  late DashboardInputState _dashboardInputState;
  late ScrollController _scrollController;
  late FocusNode _foodInputBarFocusNode;
  late StreamSubscription<bool> _keyboardSubscription;
  NutrientType _nutrientTypeForBadges = NutrientType.energy;
  List<double> _bucketDistancesFromScrollEnd = [];
  FoodItemEntryBucket? _headerBucket;

  set dashboardInputState(DashboardInputState target) {
    final before = _dashboardInputState;
    if (target == before) return;
    setState(() {
      _dashboardInputState = target;
    });
    print("target: $target");
    if (target == DashboardInputState.text) {
      _requestFocusUntilItsGranted();
    }
  }

  DashboardInputState get dashboardInputState => _dashboardInputState;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _dashboardInputState = DashboardInputState.closed;
    _scrollController = ScrollController();
    _foodInputBarFocusNode = FocusNode();
    var keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      _handleKeyBoardVisibilityChange(visible);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _foodInputBarFocusNode.dispose();
    _keyboardSubscription.cancel();
    super.dispose();
  }

  void _handleKeyBoardVisibilityChange(bool visible) {
    if (!visible && dashboardInputState == DashboardInputState.text) {
      dashboardInputState = DashboardInputState.closed;
    }
  }

  /// requests focus multiple times. Necessary, because due to crossfade animations, the food input bar may not be focussable right away.
  /// returns, wether the food input bar was ultimatily focussable or not.
  Future<bool> _requestFocusUntilItsGranted(
      {Duration requestInterval = const Duration(milliseconds: 5),
      int maxRequests = 100}) async {
    for (var i = 0; i < maxRequests; i++) {
      if (_foodInputBarFocusNode.canRequestFocus) {
        _foodInputBarFocusNode.requestFocus();
        _scrollToEndInListView(animated: true);
        return true;
      }
      await Future.delayed(requestInterval);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<FoodInputBloc>(
      create: (context) => getIt<FoodInputBloc>(),
      child: BlocBuilder<FoodInputBloc, FoodInputState>(
          builder: (context, foodInputState) {
        return BlocConsumer<DashboardBloc, DashboardState>(
            listener: (context, dashboardState) {
          /// recalculate _bucketDistancesFromScrollEnd
          _recalculateBucketDistancesFromScrollEnd(dashboardState.buckets.iter);
        }, builder: (context, dashboardState) {
          return Stack(children: [
            // the body of the page
            _buildBody(context, dashboardState),
            // the bottom floating action icons / the voice input panel
            _buildBottomWidgets(context),
            // the text input bar clinging to the keyboard
            _buildFoodInputBar(context),
          ]);
        });
      }),
    );
  }

  Widget _buildBody(BuildContext context, DashboardState dashboardState) {
    ////////////////////////////////////////////////////////////
    ///  CACHING VARIABLES
    ////////////////////////////////////////////////////////////
    final buckets = dashboardState.buckets;

    ////////////////////////////////////////////////////////////
    ///  DEFINE WIDGET FUNCTIONS
    ////////////////////////////////////////////////////////////

    Widget _buildBodyHeader() {
      // TODO: put in bucket
      return DashboardHeader(
        bucket: _headerBucket ?? TestObjects.foodItemEntryBucket, // TODO!!
        onCalendarTap: () {
          // TODO
        },
        onCardTap: () {
          // TODO
        },
        onSettingsTap: () {
          // TODO
        },
      );
    }

    Widget _buildListItem(FoodItemEntry foodItemEntry, {UniqueId? bucketId}) {
      return Padding(
        padding: const EdgeInsets.only(
            bottom: EsnyaSizes.kFoodItemEntryListTilePaddingBelow),
        child: FoodItemEntryListTile(
          foodItemEntry: foodItemEntry,
          onBadgeTap: () {
            // TODO:
            _switchBadgeNutrients();
          },
          onTap: () {
            // TODO:
            _scrollToEndInListView();
          },
          badgeNutrient: _nutrientTypeForBadges,
        ),
      );
    }

    Widget _buildBodyFoodLogList() {
      Widget _buildBucket(FoodItemEntryBucket bucket) {
        final isEmpty = bucket.entries.isEmpty();
        final noVolatileItems =
            dashboardState.entriesBetweenBlocAndRepo.isEmpty() &&
                dashboardState.entriesFoodInputBloc.isEmpty();
        return Padding(
          padding: const EdgeInsets.only(
            top: EsnyaSizes.kDashboardPaddingBetweenBucketsInListView,
            left: EsnyaSizes.base,
            right: EsnyaSizes.base,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BucketDateTitleListItem(bucket: bucket),
              if (isEmpty && noVolatileItems)
                NoEntriesYetListItem()
              else
                ...bucket.entries.iter
                    .map((e) => _buildListItem(e, bucketId: bucket.id)),
            ],
          ),
        );
      }

      Widget _buildUnsafeEntries() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: EsnyaSizes.base),
          child: Column(
            children: [
              ...dashboardState.entriesBetweenBlocAndRepo.iter
                  .map((e) => _buildListItem(e)),
              ...dashboardState.entriesFoodInputBloc.iter
                  .map((e) => _buildListItem(e)),
            ],
          ),
        );
      }

      /// this complicated calculation is relevant because we need this space at the end of the listview such that the title of the last food item bucket (today) appears right below the header panel.
      Widget _buildContainerForScrollUp() {
        final mediaQuery = MediaQuery.of(context);
        double height = mediaQuery.size.height;
        height -= mediaQuery.padding.top +
            EsnyaSizes.kDashboardHeaderheightWithoutUnsafeArea +
            0 +
            _heightOfContainerBelowListView(context) +
            EsnyaSizes.kEsnyaBottomNavigationBarHeight;

        int entryCount = (dashboardState.entriesBetweenBlocAndRepo.size +
            dashboardState.entriesFoodInputBloc.size);

        if (!buckets.isEmpty()) {
          final lastBucket = buckets[0];
          height -= EsnyaSizes.kBucketDateTitleListItemHeight;
          if (entryCount == 0 && lastBucket.entries.isEmpty()) {
            height -= EsnyaSizes.kNoEntriesYetListItemHeight;
          }
          entryCount += lastBucket.entries.size;
        }

        height -= entryCount *
            (EsnyaSizes.kFoodItemEntryListTileHeight +
                EsnyaSizes.kFoodItemEntryListTilePaddingBelow);

        height = max(height, 0);

        return SizedBox(
          height: height,
        );

        /// just for debugging:
        // return Container(
        //     alignment: Alignment.topCenter,
        //     height: height,
        //     width: double.infinity,
        //     color: Colors.green,
        //     child: SizedBox(
        //       height: 20,
        //       width: 20,
        //       child: Container(color: Colors.black),
        //     ));
      }

      return ListView.builder(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        reverse: true,
        // +1 for the unsafe items, +1 for a container allowing more scroll up than usual, such that "Today" can be displayed right beneath the header
        itemCount: buckets.size + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildContainerForScrollUp();
          }
          if (index == 1) {
            /// because of `reverse: true` this will be the downmost widget: a column for the entries not yet stored in firestore.
            return _buildUnsafeEntries();
          } else {
            return _buildBucket(buckets[index - 2]);
          }
        },
      );
    }

    /// below list view, so that scrolling over the floating action buttons is prohibited
    Widget _buildPlaceKeeperContainer() {
      final height = _heightOfContainerBelowListView(context);
      // (so no gradient when keyboard is open)
      final double gradientHeight = height > 200 ? 0 : 40;
      final colorScheme = getColorScheme(context);
      return Container(
        color: colorScheme.background,
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: height,
        child: Transform.translate(
          offset: Offset(0, -gradientHeight),
          child: SizedBox(
            height: gradientHeight,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.background.withAlpha(0),
                  colorScheme.background,
                ],
              )),
            ),
          ),
        ),
      );
    }

    ////////////////////////////////////////////////////////////
    ///  RETURN THE ACTUAL WIDGET:
    ////////////////////////////////////////////////////////////

    return Column(
      children: [
        _buildBodyHeader(),
        Expanded(child: _buildBodyFoodLogList()),
        _buildPlaceKeeperContainer(),
      ],
    );
  }

  /// the bottom floating action icons / the voice input panel
  Widget _buildBottomWidgets(BuildContext context) {
    Widget _buildFloatingActionButtons() {
      return Padding(
        padding: EdgeInsets.all(EsnyaSizes.base),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EsnyaIconButton.surface(
              EsnyaIcons.write,
              shadowSize: ShadowSize.small,
              onPressed: () {
                if (dashboardInputState == DashboardInputState.closed) {
                  dashboardInputState = DashboardInputState.text;
                }
              },
              floatingActionStyle: true,
            ),
            EsnyaSizes.spaceBaseWidth,
            EsnyaIconButton.surface(
              EsnyaIcons.microphone,
              shadowSize: ShadowSize.small,
              onPressed: () {
                if (dashboardInputState == DashboardInputState.closed) {
                  dashboardInputState = DashboardInputState.voice;
                }
              },
              floatingActionStyle: true,
            ),
          ],
        ),
      );
    }

    Widget _buildVoiceInputSheet() {
      return BlocProvider<VoiceInputSheetCubit>(
        create: (context) => getIt<VoiceInputSheetCubit>(),
        child: VoiceInputSheet(
          onChanged: (value) => _onChanged(context, value),
          onSubmitted: (value) => _onSubmitted(context, value),
          onClosed: (value) => _onClosed(context, value),
        ),
      );
    }

    return Positioned(
      child: AnimatedCrossFade(
          firstChild: _buildFloatingActionButtons(),
          secondChild: _buildVoiceInputSheet(),
          crossFadeState: dashboardInputState == DashboardInputState.voice
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: kCrossFadeAnimationDuration),
      bottom: 0,
      left: 0,
      right: 0,
    );
  }

  /// text input for food
  Widget _buildFoodInputBar(BuildContext context) {
    final visible = dashboardInputState == DashboardInputState.text;
    return KeyboardAligned(
      child: AnimatedCrossFade(
        crossFadeState:
            visible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: kCrossFadeAnimationDuration,
        secondChild: SizedBox.shrink(),
        firstChild: FoodInputBar(
          focusNode: _foodInputBarFocusNode,
          onChanged: (value) => _onChanged(context, value),
          onSubmitted: (value) => _onSubmitted(context, value),
          onClosed: (value) => _onClosed(context, value),
        ),
      ),
    );
  }

  _onClosed(BuildContext context, String value) {
    context.read<FoodInputBloc>().add(const FoodInputEvent.saveVolatileText());
    dashboardInputState = DashboardInputState.closed;
  }

  _onSubmitted(BuildContext context, String value) {
    context.read<FoodInputBloc>().add(const FoodInputEvent.saveVolatileText());
  }

  _onChanged(BuildContext context, String value) {
    context.read<FoodInputBloc>().add(FoodInputEvent.setVolatileText(value));
    _scrollToEndInListView();
  }

  void _scrollToEndInListView({bool animated = false}) {
    final target = _scrollController.position.minScrollExtent;
    if (!animated) {
      _scrollController.jumpTo(target);
    } else {
      _scrollController.animateTo(target,
          duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
    }
  }

  double _heightOfContainerBelowListView(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return max(bottomInset, EsnyaSizes.kDashboardContainerBelowListViewHeight);
  }

  void _switchBadgeNutrients() {
    final dietRepo = getIt<UserDietPreferencesRepository>();
    final preferredNutrients = dietRepo.preferredNutrients;
    setState(() {
      _nutrientTypeForBadges =
          preferredNutrients.where((e) => e != _nutrientTypeForBadges).first;
    });
  }

  void _recalculateBucketDistancesFromScrollEnd(
      Iterable<FoodItemEntryBucket> buckets) {
    const hurdleToScrollOverIntoBucket = 20.0;
    final List<double> result = [0, hurdleToScrollOverIntoBucket];
    double _heightOfBucket(FoodItemEntryBucket bucket) {
      final length = bucket.entries.size;
      return EsnyaSizes.kBucketDateTitleListItemHeight +
          length *
              (EsnyaSizes.kFoodItemEntryListTileHeight +
                  EsnyaSizes.kFoodItemEntryListTilePaddingBelow) +
          (length == 0 ? EsnyaSizes.kNoEntriesYetListItemHeight : 0.00);
    }

    for (var b in buckets.skip(1).take(buckets.length - 2)) {
      result.add(_heightOfBucket(b) + hurdleToScrollOverIntoBucket);
    }

    setState(() {
      _bucketDistancesFromScrollEnd = result;
    });
  }

  void _recalculateHeaderBucket(BuildContext context) {
    int _bucketIdFromScrollPosition() {
      // _bucketDistancesFromScrollEnd;
      final scrollDistFromEnd = _scrollController.position.pixels;
      //_scrollController.position.minScrollExtent;
      return 0;
    }

    final bucket = context
        .read<DashboardBloc>()
        .getBucketByIndex(_bucketIdFromScrollPosition());
    if (bucket != null) {
      setState(() {
        _headerBucket = bucket;
      });
    }
  }
}

enum DashboardInputState { closed, text, voice }
