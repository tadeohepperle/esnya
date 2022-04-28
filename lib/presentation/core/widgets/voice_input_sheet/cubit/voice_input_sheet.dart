import 'package:avatar_glow/avatar_glow.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya/presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design_components/esnya_design_utils.dart';

class VoiceInputSheet extends StatefulWidget {
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final void Function(String) onClosed;

  const VoiceInputSheet({
    Key? key,
    required this.onChanged,
    required this.onSubmitted,
    required this.onClosed,
  }) : super(key: key);

  @override
  State<VoiceInputSheet> createState() => _VoiceInputSheetState();
}

class _VoiceInputSheetState extends State<VoiceInputSheet> {
  void _stopRecording(BuildContext context) {
    context.read<VoiceInputSheetCubit>().stopRecording();
  }

  void _startRecording(BuildContext context) {
    context.read<VoiceInputSheetCubit>().startRecording();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceInputSheetCubit, VoiceInputSheetState>(
        builder: (context, state) {
      print("rebuild");
      return _buildSheet(context, state);
    });
  }

  Widget _buildSheet(BuildContext context, VoiceInputSheetState state) {
    final colorScheme = getColorScheme(context);
    state = VoiceInputSheetState.error("sasa sa as sa");

    final textColor = state.maybeMap(
      orElse: () => colorScheme.onBackground,
      error: (value) => colorScheme.error,
    );

    final text = state.map(
        initial: (value) => "",
        error: (value) => value.errorText,
        recording: (value) => _ellipsisTextFromLeft(value.currentInput, 32),
        stopped: (value) => "",
        preparing: (value) =>
            "preparing AI ${(value.progress * 100).toStringAsFixed(0)} %");

    final centralWidget = state.map(
      initial: (value) => SizedBox.shrink(),
      error: (value) => Icon(
        EsnyaIcons.error,
        size: 56,
        color: colorScheme.error,
      ),
      stopped: (value) => EsnyaIconButton.custom(
        EsnyaIcons.microphone,
        onPressed: () => _startRecording(context),
        floatingActionStyle: true,
        customPadding: EsnyaSizes.paddingBase,
        borderRadius: 50,
        customIconSize: 56,
        getIconColor: (c) => c.error,
        getColor: (c) => c.surface,
      ),

      // EsnyaIconButton.custom(
      //   EsnyaIcons.microphone,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(50),
      //     side: BorderSide.none,
      //   ),
      //   customPadding: EsnyaSizes.paddingBase2,
      //   floatingActionStyle: true,
      //   onPressed: () => _startRecording(context),
      //   customIconSize: 56,
      //   getColor: (c) => c.surface,
      //   getIconColor: (c) => c.primary,
      //   shadowSize: ShadowSize.small,
      // ),
      recording: (value) => GestureDetector(
        onTap: () => _stopRecording(context),
        child: SizedBox(
          height: 100,
          width: 300,
          child: AvatarGlow(
            curve: Curves.decelerate,
            showTwoGlows: true,
            glowColor: colorScheme.error,
            animate: true,
            endRadius: 60,
            child: Icon(
              EsnyaIcons.microphone,
              size: 56,
              color: colorScheme.error,
            ),
          ),
        ),
      ),
      preparing: (value) => CircularProgressIndicator(
        strokeWidth: 4,
        color: colorScheme.onBackground,
      ),
    );

    return shadowWrapLargeUp(
      Container(
        padding: const EdgeInsets.all(EsnyaSizes.base),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(EsnyaSizes.base * 2),
            topRight: Radius.circular(EsnyaSizes.base * 2),
          ),
          color: colorScheme.surface,
        ),
        child: Column(children: [
          Row(
            children: [
              SizedBox(width: EsnyaSizes.base * 4), // to maintain symmetry
              Expanded(
                child: Center(
                  child: EsnyaText.custom(
                    text: text,
                    getTextStyle: (t) => t.titleLarge,
                    overflow: TextOverflow.ellipsis,
                    color: textColor,
                  ),
                ),
              ),
              EsnyaIconButton.custom(
                EsnyaIcons.close,
                shadowSize: ShadowSize.none,
                onPressed: () => widget.onClosed(''), // TODO
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 100,
            child: Center(
              child: centralWidget,
            ),
          )
        ]),
      ),
    );
  }
}

String _ellipsisTextFromLeft(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '...${text.substring(text.length - maxLength)}';
  }
}
