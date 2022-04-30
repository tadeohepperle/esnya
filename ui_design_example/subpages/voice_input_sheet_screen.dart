import 'package:esnya/injection.dart';
import 'package:esnya/presentation/core/design_components/esnya_button.dart';
import 'package:esnya/presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet.dart';
import 'package:esnya/presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoiceInputSheetScreen extends StatefulWidget {
  const VoiceInputSheetScreen({Key? key}) : super(key: key);

  @override
  State<VoiceInputSheetScreen> createState() => _VoiceInputSheetScreenState();
}

class _VoiceInputSheetScreenState extends State<VoiceInputSheetScreen> {
  final cubit = getIt<VoiceInputSheetCubit>();

  String _text = '';
  String _unsavedText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocProvider(
          create: (context) => cubit,
          child: BlocBuilder<VoiceInputSheetCubit, VoiceInputSheetState>(
            builder: (context, state) {
              return ListView(children: [
                EsynaButton.primary(
                  title: "Clear",
                  onPressed: () {
                    setState(() {
                      _text = '';
                    });
                  },
                ),
                EsynaButton.primary(
                  title: "write",
                  onPressed: () async {
                    cubit.startRecording();
                    var s = "hello";
                    for (var i = 0; i < 100; i++) {
                      s += " " + i.toRadixString(2);
                      cubit.setInput(s);
                      await Future.delayed(Duration(milliseconds: 500));
                    }
                  },
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  height: 200,
                  child: Text(_text + _unsavedText),
                ),
                Divider(),
                VoiceInputSheet(onChanged: (v) {
                  setState(() {
                    _unsavedText = v;
                  });
                }, onSubmitted: (v) {
                  setState(() {
                    _text += _unsavedText + "\n";
                    _unsavedText = '';
                  });
                }, onClosed: (v) {
                  setState(() {
                    _text += '\n Closed. \n';
                    _unsavedText = '';
                  });
                })
              ]);
            },
          )),
    ));
  }
}
