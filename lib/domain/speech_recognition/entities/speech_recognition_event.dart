import 'package:freezed_annotation/freezed_annotation.dart';

part 'speech_recognition_event.freezed.dart';

@freezed
abstract class SpeechRecognitionEvent with _$SpeechRecognitionEvent {
  const factory SpeechRecognitionEvent.partial(String text) =
      SpeechRecognitionEventPartial;
  const factory SpeechRecognitionEvent.safe(String text) =
      SpeechRecognitionEventSafe;
}
