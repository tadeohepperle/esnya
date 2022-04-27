import 'package:esnya/presentation/core/design_components/esnya_colors.dart';
import 'package:esnya/presentation/core/design_components/esnya_icon_button.dart';
import 'package:esnya/presentation/core/design_components/esnya_icons.dart';
import 'package:esnya/presentation/core/design_components/esnya_sizes.dart';
import 'package:esnya/presentation/core/design_components/esnya_text.dart';
import 'package:esnya/presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoiceInputSheetCubit, VoiceInputSheetState>(
        builder: (context, state) {
      return _buildSheet(context, state);
    });
  }

  Widget _buildSheet(BuildContext context, VoiceInputSheetState state) {
    final colorScheme = getColorScheme(context);
    final getText = state.map(
      initial: (value) => "initial",
      error: (value) => "initial",
      recording: (value) => "initial",
      stopped: (value) => "initial",
      preparing: (value) => "initial",
    );
    final textColor = state.maybeMap(
      orElse: () => colorScheme.onBackground,
      error: (value) => colorScheme.error,
    );

    final text = state.map(
        initial: (value) => "initial",
        error: (value) => "something went wrong",
        recording: (value) => _ellipsisTextFromLeft(value.currentInput, 32),
        stopped: (value) => "",
        preparing: (value) => "...preparing our ears");

    final centralWidget = state.map(
      initial: (value) => SizedBox.shrink(),
      error: (value) => Icon(
        EsnyaIcons.error,
        size: 56,
      ),
      recording: (value) => Icon(
        EsnyaIcons.microphone,
        size: 56,
        color: colorScheme.primary,
      ),
      stopped: (value) => Icon(
        EsnyaIcons.microphone,
        size: 56,
        color: colorScheme.onBackground,
      ),
      preparing: (value) => CircularProgressIndicator(),
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
          EsnyaSizes.spaceBaseHeight2,
          Container(
            width: double.infinity,
            height: 60,
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
