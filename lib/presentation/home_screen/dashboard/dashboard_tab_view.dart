import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../application/food_data/input/food_input_bloc.dart';
import '../../../application/home_screen/bloc/dashboard_bloc.dart';
import '../../../injection.dart';
import '../../core/core.dart';
import 'widgets/dashboard_entries_list.dart';
import 'widgets/dashboard_header.dart';

class DashboardTabView extends StatefulWidget {
  const DashboardTabView({Key? key}) : super(key: key);

  @override
  State<DashboardTabView> createState() => _DashboardTabViewState();
}

class _DashboardTabViewState extends State<DashboardTabView>
    with AutomaticKeepAliveClientMixin {
  late DashboardInputState _dashboardInputState;
  late FocusNode _foodInputBarFocusNode;
  late StreamSubscription<bool> _keyboardSubscription;

  set dashboardInputState(DashboardInputState target) {
    final before = _dashboardInputState;
    if (target == before) return;
    setState(() {
      _dashboardInputState = target;
    });
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
    _foodInputBarFocusNode = FocusNode();
    var keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      _handleKeyBoardVisibilityChange(visible);
    });
  }

  @override
  void dispose() {
    _foodInputBarFocusNode.dispose();
    _keyboardSubscription.cancel();
    super.dispose();
  }

  /// Layout for this page:
  /// xpx unsafeArea
  /// 172px header (EsnyaSizes.kDashboardHeaderheightWithoutUnsafeArea)
  ///
  ///
  ///
  /// 48px tabnavigation (EsnyaSizes.kEsnyaBottomNavigationTabHeight)

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, dashboardState) {},
      builder: (context, dashboardState) {
        return Stack(
          children: [
            // the body of the page (header + list of entries)
            Column(
              children: [
                DashboardHeader(),
                DashboardEntriesList(
                    availableRenderHeight:
                        _determineAvailableRenderHeightForListView(context)),
              ],
            ),
            // the bottom floating action icons / the voice input panel
            _buildBottomWidgets(context),
            // the text input bar clinging to the keyboard
            _buildFoodInputBar(context),
          ],
        );
      },
    );
  }

  double _determineAvailableRenderHeightForListView(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height -
        mediaQuery.padding.top -
        EsnyaSizes.kDashboardHeaderheightWithoutUnsafeArea -
        EsnyaSizes.kEsnyaBottomNavigationBarHeight;
  }

  /// the bottom floating action icons / the voice input panel
  Widget _buildBottomWidgets(BuildContext context) {
    Widget _buildFloatingActionButtons() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(EsnyaSizes.base * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            EsynaButton.surface(
              title: "Add by Voice",
              leadingIcon: EsnyaIcons.microphone,
              buttonSize: ButtonSize.large,
              onPressed: () {
                if (dashboardInputState == DashboardInputState.closed) {
                  dashboardInputState = DashboardInputState.voice;
                }
              },
            )..getTextColor = (c) => c.secondary,
            SizedBox(
              height: EsnyaSizes.base,
            ),
            EsynaButton.surface(
              title: "Add Food by Text",
              leadingIcon: EsnyaIcons.add,
              buttonSize: ButtonSize.large,
              onPressed: () {
                if (dashboardInputState == DashboardInputState.closed) {
                  dashboardInputState = DashboardInputState.text;
                }
              },
            )..getTextColor = (c) => c.primary,
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
        firstChild: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: FoodInputBar(
            focusNode: _foodInputBarFocusNode,
            onChanged: (value) => _onChanged(context, value),
            onSubmitted: (value) => _onSubmitted(context, value),
            onClosed: (value) => _onClosed(context, value),
          ),
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
    //_scrollToEndInListView();
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

        // TODO: add again
        //_scrollToEndInListView(animated: true);
        return true;
      }
      await Future.delayed(requestInterval);
    }
    return false;
  }
}

enum DashboardInputState { closed, text, voice }
