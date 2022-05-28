import 'dart:async';

import 'package:esnya/domain/resources/data_directory_path_provider.dart';
import 'package:esnya/domain/speech_recognition/entities/speech_recognition_event.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/speech_recognition/speech_recognition_repository.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:vosk_speech_recognition/vosk_speech_recognition.dart';

class SpeechRecognitionRepositoryImplVosk extends SetupRepositoryImpl
    implements SpeechRecognitionRepository {
  final VoskSpeechRecognition voskSpeechRecognition;

  SpeechRecognitionRepositoryImplVosk(this.voskSpeechRecognition);

  @override
  Stream<Either<Failure, double>> doSetupWork() async* {
    yield right(0);
    voskSpeechRecognition.reset();
    final modelDirectoryPath =
        DataDirectoryPathProvider.dataDirectoryPath + '/stt_model_en_1';
    await voskSpeechRecognition.loadModel(modelDirectoryPath);
    final isLoaded = await voskSpeechRecognition.isModelLoaded();
    if (!isLoaded) {
      yield left(DataFailure.invalidDataFile(modelDirectoryPath));
    }
    yield right(1);
  }

  @override
  Stream<SpeechRecognitionEvent> get recognitionStream => voskSpeechRecognition
      .recognitionStream
      .map((event) => mapVoskRecognitionEventToSpeechRecognitionEvent(event));
}

/// SpeechRecognitionEvent is used in esnya, VoskRecognitionEvent is used in the vosk_speech_recognition library (a dependency)
SpeechRecognitionEvent mapVoskRecognitionEventToSpeechRecognitionEvent(
    VoskRecognitionEvent voskRecognitionEvent) {
  if (voskRecognitionEvent.type == VoskRecognitionEventType.PARTIAL) {
    return SpeechRecognitionEvent.partial(voskRecognitionEvent.text);
  } else if (voskRecognitionEvent.type == VoskRecognitionEventType.SAFE) {
    return SpeechRecognitionEvent.safe(voskRecognitionEvent.text);
  }
  throw UnimplementedError();
}
