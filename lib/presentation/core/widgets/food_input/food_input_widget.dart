import 'dart:async';

import 'package:esnya/application/food_data/input/food_input_bloc.dart';
import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class FoodInputWidget extends StatefulWidget {
  final String contextId;
  const FoodInputWidget({Key? key, required this.contextId}) : super(key: key);

  @override
  State<FoodInputWidget> createState() => _FoodInputWidgetState();
}

class _FoodInputWidgetState extends State<FoodInputWidget> {
  //////////////////////////////////////////////////////////////////////
  /// State
  //////////////////////////////////////////////////////////////////////
  late FocusNode _foodInputBarFocusNode;
  late StreamSubscription<bool> _keyboardSubscription;

  FoodInputMode? _previousMode;

  @override
  void initState() {
    super.initState();
    _foodInputBarFocusNode = FocusNode();
    var keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      _handleKeyBoardVisibilityChange(visible);
    });
  }

  //////////////////////////////////////////////////////////////////////
  /// Build
  //////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    getIt<FoodInputBloc>().add(FoodInputEvent.setContext(widget.contextId));
    return BlocConsumer<FoodInputBloc, FoodInputState>(
      listener: (context, foodInputState) {
        final newMode = foodInputState.foodInputMode;
        if (_previousMode != foodInputState.foodInputMode) {
          _previousMode = newMode;
          if (newMode == FoodInputMode.text) {
            _requestFocusUntilItsGranted();
          }
        }
      },
      builder: (context, foodInputState) {
        return Stack(
          children: [
            Positioned(
              child: AnimatedCrossFade(
                  firstChild: _buildButtons(context, foodInputState),
                  secondChild: _buildVoiceInputSheet(context, foodInputState),
                  crossFadeState:
                      foodInputState.foodInputMode == FoodInputMode.voice
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  duration: kCrossFadeAnimationDuration),
              bottom: 0,
              left: 0,
              right: 0,
            ),
            _buildFoodInputBar(context, foodInputState)
          ],
        );
      },
    );
  }

  //////////////////////////////////////////////////////////////////////
  /// Rendering Functions
  //////////////////////////////////////////////////////////////////////

  _buildButtons(BuildContext context, FoodInputState foodInputState) {
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
              if (foodInputState.foodInputMode == FoodInputMode.none) {
                context.read<FoodInputBloc>().add(
                      const FoodInputEvent.setFoodInputMode(
                          FoodInputMode.voice),
                    );
              }
            },
          )..getTextColor = (c) => c.secondary,
          const SizedBox(
            height: EsnyaSizes.base,
          ),
          EsynaButton.surface(
            title: "Add Food by Text",
            leadingIcon: EsnyaIcons.add,
            buttonSize: ButtonSize.large,
            onPressed: () {
              if (foodInputState.foodInputMode == FoodInputMode.none) {
                context.read<FoodInputBloc>().add(
                      const FoodInputEvent.setFoodInputMode(FoodInputMode.text),
                    );
              }
            },
          )..getTextColor = (c) => c.primary,
        ],
      ),
    );
  }

  Widget _buildVoiceInputSheet(
      BuildContext context, FoodInputState foodInputState) {
    return BlocProvider<VoiceInputSheetCubit>(
      create: (context) => getIt<VoiceInputSheetCubit>(),
      child: VoiceInputSheet(
        onChanged: (value) => _onChanged(context, value),
        onSubmitted: (value) => _onSubmitted(context, value),
        onClosed: (value) => _onClosed(context, value),
      ),
    );
  }

  Widget _buildFoodInputBar(
      BuildContext context, FoodInputState foodInputState) {
    final visible = foodInputState.foodInputMode == FoodInputMode.text;
    return KeyboardAligned(
      child: AnimatedCrossFade(
        crossFadeState:
            visible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: kCrossFadeAnimationDuration,
        secondChild: const SizedBox.shrink(),
        firstChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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

  //////////////////////////////////////////////////////////////////////
  /// Handling Changes
  //////////////////////////////////////////////////////////////////////

  _onClosed(BuildContext context, String value) {
    context.read<FoodInputBloc>()
      ..add(const FoodInputEvent.saveVolatileText())
      ..add(const FoodInputEvent.setFoodInputMode(FoodInputMode.none));
  }

  _onSubmitted(BuildContext context, String value) {
    context.read<FoodInputBloc>().add(const FoodInputEvent.saveVolatileText());
  }

  _onChanged(BuildContext context, String value) {
    context.read<FoodInputBloc>().add(FoodInputEvent.setVolatileText(value));
    //_scrollToEndInListView();
  }

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

  void _handleKeyBoardVisibilityChange(bool visible) {
    final bloc = context.read<FoodInputBloc>();
    final foodInputMode = context.read<FoodInputBloc>().state.foodInputMode;
    if (!visible && foodInputMode == FoodInputMode.text) {
      bloc.add(FoodInputEvent.setFoodInputMode(FoodInputMode.none));
      // TODO: other things on closing, like resetting bloc???
    }
  }
}
