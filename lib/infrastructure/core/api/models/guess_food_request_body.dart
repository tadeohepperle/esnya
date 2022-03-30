import 'package:freezed_annotation/freezed_annotation.dart';
part 'guess_food_request_body.g.dart';

@JsonSerializable()
class GuessFoodRequestBody {
  final String input;

  GuessFoodRequestBody(this.input);

  factory GuessFoodRequestBody.fromJson(Map<String, dynamic> json) =>
      _$GuessFoodRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$GuessFoodRequestBodyToJson(this);
}
