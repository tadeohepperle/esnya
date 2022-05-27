import 'dart:async';

import 'package:esnya_shared_resources/core/core.dart';

import 'entities/speech_recognition_event.dart';

abstract class SpeechRecognitionRepository implements SetupRepository {
  Stream<SpeechRecognitionEvent> get recognitionStream;
}
