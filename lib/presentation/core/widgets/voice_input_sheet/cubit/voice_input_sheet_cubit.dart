import 'package:bloc/bloc.dart';
import 'package:esnya/injection_environments.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'voice_input_sheet_state.dart';
part 'voice_input_sheet_cubit.freezed.dart';

@isolate1
@injectable
class VoiceInputSheetCubit extends Cubit<VoiceInputSheetState> {
  VoiceInputSheetCubit() : super(VoiceInputSheetState.initial());
}
