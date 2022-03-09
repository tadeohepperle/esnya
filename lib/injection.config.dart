// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i11;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i9;
import 'domain/auth/auth_repository.dart' as _i7;
import 'domain/food_data/food_analysis_repository.dart' as _i4;
import 'infrastructure/auth/auth_repository_impl.dart' as _i8;
import 'infrastructure/core/firebase_injectible_module.dart' as _i12;
import 'infrastructure/food_data/food_analysis_repository_impl.dart' as _i5;
import 'presentation/routes/app_router.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectibleModule = _$FirebaseInjectibleModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectibleModule.fireBaseAuth);
  gh.lazySingleton<_i4.FoodAnalysisRepository>(
      () => _i5.FoodAnalysisRepositoryImpl());
  gh.lazySingleton<_i6.GoogleSignIn>(
      () => firebaseInjectibleModule.googleSignIn);
  gh.lazySingleton<_i7.AuthRepository>(() => _i8.FirebaseAuthRepository(
      get<_i3.FirebaseAuth>(), get<_i6.GoogleSignIn>()));
  gh.factory<_i9.SignInFormBloc>(
      () => _i9.SignInFormBloc(get<_i7.AuthRepository>()));
  gh.lazySingleton<_i10.AppRouter>(
      () => _i10.AppRouter(get<_i7.AuthRepository>()));
  gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(get<_i7.AuthRepository>()));
  return get;
}

class _$FirebaseInjectibleModule extends _i12.FirebaseInjectibleModule {}
