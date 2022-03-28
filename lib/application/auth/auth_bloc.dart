import 'package:bloc/bloc.dart';
import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(authCheckRequested: (e) async {
        final userOption = await _authRepository.getSignedInUser();
        emit(
          userOption.fold(
            () => const AuthState.unauthenticated(),
            (_) => const AuthState.authenticated(),
          ),
        );
      }, signedOut: (e) async {
        await _authRepository.signOut();
        emit(const AuthState.unauthenticated());
      });
    });
  }
}