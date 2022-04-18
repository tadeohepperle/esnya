import 'package:esnya/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/domain/auth/value_objects/password.dart';
import 'package:esnya/domain/auth/value_objects/email_adress.dart';
import 'package:esnya/domain/auth/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'firebase_user_mapper.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepositoryImpl(this._firebaseAuth, this._googleSignIn);

  @override
  Option<User> getSignedInUser() =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    final emailStr = emailAddress.valueOrCrash;
    final passwordStr = password.valueOrCrash;
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailStr, password: passwordStr);
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
        // catch-all for invalid-email, operation-not-allowed, weak-password
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    final emailStr = emailAddress.valueOrCrash;
    final passwordStr = password.valueOrCrash;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailStr, password: passwordStr);
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == "invalid-email" || e.code == "wrong-password") {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;

      final authCredential = firebase_auth.GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );
      await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

  @override
  bool isSignedIn() {
    return getSignedInUser().isSome();
  }
}
