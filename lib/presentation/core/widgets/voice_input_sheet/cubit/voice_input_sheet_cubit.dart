import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/resources/resource_repository.dart';
import 'package:esnya/infrastructure/resources/stt_model_resource.dart';
import 'package:esnya/injection_environments.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vosk_speech_recognition/vosk_speech_recognition.dart';

part 'voice_input_sheet_state.dart';
part 'voice_input_sheet_cubit.freezed.dart';

@isolate1
@injectable
class VoiceInputSheetCubit extends Cubit<VoiceInputSheetState> {
  ResourceRepository resourceRepository;

  VoiceInputSheetCubit(this.resourceRepository)
      : super(const VoiceInputSheetState.initial()) {
    final resourceStatusStream =
        resourceRepository.resourceStatusStream<SttModelResource>();
    resourceStatusStream.listen((event) {
      event.map(
          unknown: (_) {},
          inProgress: (inProgress) {
            emit(VoiceInputSheetState.preparing(inProgress.progress));
          },
          available: (available) {
            emit(const VoiceInputSheetState.idle());
          },
          failed: (failed) {
            emit(const VoiceInputSheetState.error(
                "failed to download sst model"));
          });
    });
  }

  setInput(String input) {
    if (state is _Recording) {
      emit((state as _Recording).copyWith(currentInput: input));
    }
  }

  startRecording() {
    if (state is _Idle) {
      emit(const VoiceInputSheetState.recording(''));
    }
  }

  stopRecording() {
    if (state is _Recording) {
      emit(const VoiceInputSheetState.idle());
    }
  }

  tryReload() {
    // TODO: implement reload anbd download of model, setup of Voice Recognition Repo
  }
}
