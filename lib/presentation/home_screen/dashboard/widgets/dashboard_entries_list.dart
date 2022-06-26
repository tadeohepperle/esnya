import 'dart:math';

import 'package:dartz/dartz.dart' hide State;
import 'package:esnya/infrastructure/user_data/utils/food_item_entry_bucket_utils.dart';
import 'package:esnya/presentation/core/design_components/utils/show_padded_dialog.dart';
import 'package:esnya/presentation/core/widgets/food_item_entry/amount_picker.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';

import '../../../../application/food_data/input/food_input_bloc.dart';
import '../../../../application/food_data/input/models/food_item_entry_wrapper.dart';
import '../../../../application/home_screen/bloc/dashboard_bloc.dart';
import '../../../../domain/user_data/day_bucket_repository.dart';
import '../../../../domain/user_data/user_diet_preferences_repository.dart';
import '../../../../injection.dart';
import '../../../core/core.dart';

class DashboardEntriesList extends StatefulWidget {
  final double availableRenderHeight;
  const DashboardEntriesList({Key? key, required this.availableRenderHeight})
      : super(key: key);

  @override
  State<DashboardEntriesList> createState() => _DashboardEntriesListState();
}

class _DashboardEntriesListState extends State<DashboardEntriesList> {
  //////////////////////////////////////////////////////////////////////
  /// State
  //////////////////////////////////////////////////////////////////////

  late final ScrollController _scrollController;
  late NutrientType _nutrientTypeForBadges;
  List<double> _bucketDistancesFromScrollEnd = [];

  @override
  void initState() {
    super.initState();
    _nutrientTypeForBadges =
        getIt<UserDietPreferencesRepository>().preferredNutrientPrimary;
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _recalculateHeaderBucket();
    });
  }

  //////////////////////////////////////////////////////////////////////
  /// Build
  //////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodInputBloc, FoodInputState>(
      listener: (context, foodInputState) {
        // TODO: implement listener
      },
      builder: (context, foodInputState) {
        return BlocConsumer<DashboardBloc, DashboardState>(
          listener: (context, dashboardState) {
            _recalculateBucketDistancesFromScrollEnd(dashboardState.buckets);
          },
          builder: (context, dashboardState) {
            return Column(
              children: [
                Expanded(child: _buildBodyFoodLogList(dashboardState)),
                _buildPlaceKeeperContainer(),
              ],
            );
          },
        );
      },
    );
  }

  //////////////////////////////////////////////////////////////////////
  /// Rendering Functions
  //////////////////////////////////////////////////////////////////////

  /// below list view, so that scrolling over the floating action buttons is prohibited
  Widget _buildPlaceKeeperContainer() {
    final height = _heightOfContainerBelowListView(context);
    // (so no gradient when keyboard is open)
    final double gradientHeight = height > 200 ? 0 : 40; // 40
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

  Widget _buildBodyFoodLogList(DashboardState dashboardState) {
    final buckets = dashboardState.buckets;

    /// this complicated calculation is relevant because we need this space at the end of the listview such that the title of the last food item bucket (today) appears right below the header panel.

    return ListView.builder(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      reverse: true,
      // +1 for the unsafe items, +1 for a container allowing more scroll up than usual, such that "Today" can be displayed right beneath the header
      itemCount: buckets.size + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildContainerForScrollUp(dashboardState);
        } else {
          return _buildBucket(buckets[index - 1],
              mostRecentBucket: index == 1,
              mostDistantBucket: index == buckets.size + 1,
              dashboardState: dashboardState);
        }
      },
    );
  }

  Widget _buildContainerForScrollUp(DashboardState dashboardState) {
    double height = widget.availableRenderHeight;
    height -= _heightOfContainerBelowListView(context);

    int entryCount = (dashboardState.foodInputBlocOutgoingEntries.size +
        dashboardState.foodInputBlocEntries.size);

    if (!dashboardState.buckets.isEmpty()) {
      final lastBucket = dashboardState.buckets[0];
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
      width: double.infinity,
      height: height,
    );
  }

  Widget _buildBucket(DayBucket bucket,
      {required bool mostRecentBucket,
      required bool mostDistantBucket,
      required DashboardState dashboardState}) {
    final isEmpty = bucket.entries.isEmpty();
    final noVolatileItems =
        dashboardState.foodInputBlocOutgoingEntries.isEmpty() &&
            dashboardState.foodInputBlocEntries.isEmpty();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mostDistantBucket
                ? 0
                : EsnyaSizes.kDashboardPaddingBetweenBuckets,
          ),
          BucketDateTitleListItem(bucket: bucket),
          if (isEmpty && noVolatileItems)
            const NoEntriesYetListItem()
          else if (mostRecentBucket)
            ..._buildItemsOfTodaysBucket(
                bucket: bucket, dashboardState: dashboardState)
          else
            ...bucket.entries.iter.map(
              (e) => _buildFoodItemEntryListTile(
                context,
                foodItemEntry: e,
                bucketId: bucket.id,
              ),
            ),
        ],
      ),
    );
  }

  Iterable<Widget> _buildItemsOfTodaysBucket(
      {required DayBucket bucket, required DashboardState dashboardState}) {
    List<Tuple2<DateTime, Widget>> items = bucket.entries.iter
        .map(
          (e) => Tuple2(
            e.dateTime,
            _buildFoodItemEntryListTile(context,
                foodItemEntry: e, bucketId: bucket.id),
          ),
        )
        .toList();
    items.addAll(
      dashboardState.foodInputBlocOutgoingEntries.iter.map(
        (e) => Tuple2(
          e.dateTime,
          _buildFoodItemEntryListTile(context, foodItemEntry: e),
        ),
      ),
    );

    DateTime _dtFromWrapper(FoodItemEntryWrapper w) {
      return w.map(
          success: (_) => _.entry.dateTime,
          processing: (_) => _.dateTime,
          failed: (_) => _.dateTime);
    }

    items.addAll(dashboardState.foodInputBlocEntries.iter.map(
      (e) => Tuple2(
        _dtFromWrapper(e),
        e.map(
          success: (success) => _buildFoodItemEntryListTile(
            context,
            foodItemEntry: success.entry,
          ),
          processing: (_) => _buildFoodItemEntryProcessingListTile(_),
          failed: (_) => _buildFoodItemEntryFailedListTile(_),
        ),
      ),
    ));

    items.sort(((a, b) => a.value1.compareTo(b.value1)));
    return items.map((e) => e.value2);
  }

  Widget _buildFoodItemEntryListTile(BuildContext context,
      {required FoodItemEntry foodItemEntry, UniqueId? bucketId}) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: EsnyaSizes.kFoodItemEntryListTilePaddingBelow),
      child: FoodItemEntryListTile(
        foodItemEntry: foodItemEntry,
        badgeNutrient: _nutrientTypeForBadges,
        onBadgeTap: () {
          // TODO:
          _switchBadgeNutrients();
        },
        onTap: () {
          // TODO:
          if (bucketId != null) {
            showPaddedDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return FoodItemEntryCard(
                    foodItemEntry: foodItemEntry,
                    onDeleteEntry: (_) {
                      getIt<DayBucketsRepository>()
                          .deleteEntry(bucketId, foodItemEntry);
                    },
                    onUpdateEntry: (FoodItemEntry updatedEntry) {
                      final newBucketId =
                          bucketIdForFoodItemEntry(updatedEntry);

                      // for possible bucket changes, we need to supply old and new bucketID computed from entry time.
                      // This is necessary because then we delete entry in old bucket and add/update in new bucket at the same time.
                      getIt<DayBucketsRepository>().updateEntry(
                          newBucketId, updatedEntry,
                          bucketIdEntryHadBefore: bucketId);
                    },
                  );
                });
          }
        },
      ),
    );
  }

  Widget _buildFoodItemEntryFailedListTile(
      FoodItemEntryFailed foodItemEntryFailed) {
    return FoodItemEntryFailedListTile(
        failed: foodItemEntryFailed,
        onTap: () {
          // TODO!!
        });
  }

  Widget _buildFoodItemEntryProcessingListTile(
      FoodItemEntryProcessing foodItemEntryProcessing) {
    return FoodItemEntryProcessingListTile(
        processing: foodItemEntryProcessing,
        onTap: () {
          // TODO!!
        });
  }

  //////////////////////////////////////////////////////////////////////
  /// Other Functions
  //////////////////////////////////////////////////////////////////////

  double _heightOfContainerBelowListView(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return max(bottomInset, EsnyaSizes.kDashboardContainerBelowListViewHeight);
  }

  void _switchBadgeNutrients() {
    final dietRepo = getIt<UserDietPreferencesRepository>();
    setState(() {
      _nutrientTypeForBadges = [
        dietRepo.preferredNutrientPrimary,
        dietRepo.preferredNutrientSecondary
      ].where((e) => e != _nutrientTypeForBadges).first;
    });
  }

  void _recalculateBucketDistancesFromScrollEnd(KtList<DayBucket> buckets) {
    const hurdleToScrollOverIntoBucket = 80.0;
    final List<double> result = [0];
    if (buckets.size > 1) {
      result.add(hurdleToScrollOverIntoBucket);
    }

    double _heightOfBucket(DayBucket bucket) {
      final length = bucket.entries.size;
      return EsnyaSizes.kBucketDateTitleListItemHeight +
          EsnyaSizes.kDashboardPaddingBetweenBuckets +
          length *
              (EsnyaSizes.kFoodItemEntryListTileHeight +
                  EsnyaSizes.kFoodItemEntryListTilePaddingBelow) +
          (length == 0 ? EsnyaSizes.kNoEntriesYetListItemHeight : 0.00);
    }

    for (var i = 2; i < buckets.size; i++) {
      result.add(result.last + _heightOfBucket(buckets[i - 1]));
    }
    // setState not necessary, because does not affect rendering directly.
    _bucketDistancesFromScrollEnd = result;
  }

  void _recalculateHeaderBucket() {
    int _bucketIndexFromScrollPosition() {
      // _bucketDistancesFromScrollEnd;
      final pos = _scrollController.position.pixels;
      int index = -1;
      for (var i = 0; i < _bucketDistancesFromScrollEnd.length; i++) {
        final threshhold = _bucketDistancesFromScrollEnd[i];
        if (pos < threshhold) {
          break;
        } else {
          index++;
        }
      }
      return max(index, 0);
    }

    // TODO: only if bucket not equal null???
    final dashboardBloc = getIt<DashboardBloc>();
    final bucketIndex = _bucketIndexFromScrollPosition();
    final bucket = dashboardBloc.getBucketByIndex(bucketIndex);
    dashboardBloc.add(DashboardEvent.setHeaderBucket(bucket));
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
}
