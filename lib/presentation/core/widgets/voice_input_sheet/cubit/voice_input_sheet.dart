import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design_components/esnya_design_utils.dart';
import '../../../design_components/esnya_icon_button.dart';
import '../../../design_components/esnya_icons.dart';
import '../../../design_components/esnya_sizes.dart';
import '../../../design_components/esnya_text.dart';
import 'voice_input_sheet_cubit.dart';

/// needs to be wrapped in BlocProvider<VoiceInputSheetCubit,VoiceInputSheetState>
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
      return _buildSheet(context, state);
    });
  }

  Widget _buildSheet(BuildContext context, VoiceInputSheetState state) {
    final colorScheme = getColorScheme(context);

    final textColor = state.maybeMap(
      orElse: () => colorScheme.onBackground,
      error: (value) => colorScheme.error,
    );

    final text = state.map(
        initial: (value) => "",
        error: (value) => value.errorText,
        recording: (value) => _ellipsisTextFromLeft(value.currentInput, 32),
        idle: (value) => "",
        preparing: (value) =>
            "preparing AI ${(value.progress * 100).toStringAsFixed(0)} %");

    final centralWidget = state.map(
      initial: (value) => SizedBox.shrink(),
      error: (value) => Icon(
        EsnyaIcons.error,
        size: 56,
        color: colorScheme.error,
      ),
      idle: (value) => EsnyaIconButton.surface(
        EsnyaIcons.microphone,
        onPressed: () => _startRecording(context),
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

    return Container(
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
                child: EsnyaText.h1(
                  text,
                  overflow: TextOverflow.ellipsis,
                  color: textColor,
                ),
              ),
            ),
            EsnyaIconButton.surface(
              EsnyaIcons.close,
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
