import 'dart:async';

import 'package:esnya/presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart';
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
        return BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, dashboardState) {
          return Stack(children: [
            // the body of the page
            _buildBody(context),
            // the bottom floating action icons / the voice input panel
            _buildBottomWidgets(context),
            // the text input bar clinging to the keyboard
            _buildFoodInputBar(context),
            ElevatedButton(
              child: Text("Klick me"),
              onPressed: () {
                _foodInputBarFocusNode.requestFocus();
              },
            ),
          ]);
        });
      }),
    );
  }

  Widget _buildBody(context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ...List.generate(50, (index) => Text(index.toRadixString(3)))
      ]),
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
          onChanged: (value) {
            // TODO:
          },
          onSubmitted: (value) {
            // TODO:
          },
          onClosed: (value) {
            dashboardInputState = DashboardInputState.closed;
          },
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
          onChanged: (v) {
            // context.read<FoodInputBloc>().add(FoodInputEvent.setVolatileText(v));
          },
          onSubmitted: (v) {
            // context
            //     .read<FoodInputBloc>()
            //     .add(const FoodInputEvent.saveVolatileText());
          },
          onClosed: (v) {
            dashboardInputState = DashboardInputState.closed;
            // context
            //     .read<FoodInputBloc>()
            //     .add(const FoodInputEvent.saveVolatileText());
            // FocusManager.instance.primaryFocus?.unfocus();
            // if (_dashboardInputState == DashboardInputState.text) {
            //   setState(() {
            //     _dashboardInputState = DashboardInputState.closed;
            //   });
            // }
          },
        ),
      ),
    );
    // return AnimatedOpacity(
    //   opacity: 1,
    //   duration: kCrossFadeAnimationDuration,
    //   child:
    // );
  }
}

enum DashboardInputState { closed, text, voice }
