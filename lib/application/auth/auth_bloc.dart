import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (e) async {
          final userOption = _authRepository.getSignedInUser();
          emit(
            userOption.fold(
              () => const AuthState.unauthenticated(),
              (_) => const AuthState.authenticated(),
            ),
          );
        },
        signedOut: (e) async {
          await _authRepository.signOut();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
