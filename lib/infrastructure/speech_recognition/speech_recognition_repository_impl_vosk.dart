import 'dart:async';

import 'package:esnya/domain/resources/data_directory_path_provider.dart';
import 'package:esnya/domain/speech_recognition/entities/speech_recognition_event.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/speech_recognition/speech_recognition_repository.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:vosk_speech_recognition/vosk_speech_recognition.dart';

class SpeechRecognitionRepositoryImplVosk extends SetupRepositoryImpl
    implements SpeechRecognitionRepository {
  @override
  Future<Either<Failure, Unit>> doSetupWork() async {
    final modelDirectoryPath =
        DataDirectoryPathProvider.dataDirectoryPath + '/stt_model_en_1';

    /// success = 1, failure = 0
    await VoskSpeechRecognition.loadModel(modelDirectoryPath);
    final isLoaded = await VoskSpeechRecognition.isModelLoaded();
    if (!isLoaded) {
      return left(DataFailure.invalidDataFile(modelDirectoryPath));
    }
    return right(unit);
  }

  @override
  Stream<SpeechRecognitionEvent> listen() async* {
    await VoskSpeechRecognition.startRecognition();
    return VoskSpeechRecognition.recognitionStream.map((event) => if(ev)); // TODO

  }
}
