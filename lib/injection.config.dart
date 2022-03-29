// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:esnya_shared_resources/esnya_shared_resources.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i10;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i8;
import 'domain/auth/auth_repository.dart' as _i6;
import 'infrastructure/auth/auth_repository_impl.dart' as _i7;
import 'infrastructure/core/firebase_injectible_module.dart' as _i11;
import 'infrastructure/core/shared_resources_injectible_module.dart' as _i12;
import 'presentation/routes/app_router.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectibleModule = _$FirebaseInjectibleModule();
  final sharedResourcesInjectibleModule = _$SharedResourcesInjectibleModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectibleModule.fireBaseAuth);
  gh.singleton<_i4.FoodDataRepository>(
      sharedResourcesInjectibleModule.foodDataRepository());
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectibleModule.googleSignIn);
  gh.singleton<_i4.SimilarityCalculator>(
      sharedResourcesInjectibleModule.similarityCalculator());
  gh.lazySingleton<_i6.AuthRepository>(() => _i7.FirebaseAuthRepository(
      get<_i3.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.singleton<_i4.FoodMappingRepository>(
      sharedResourcesInjectibleModule.foodMappingRepository(
          get<_i4.FoodDataRepository>(), get<_i4.SimilarityCalculator>()));
  gh.factory<_i8.SignInFormBloc>(
      () => _i8.SignInFormBloc(get<_i6.AuthRepository>()));
  gh.lazySingleton<_i9.AppRouter>(
      () => _i9.AppRouter(get<_i6.AuthRepository>()));
  gh.factory<_i10.AuthBloc>(() => _i10.AuthBloc(get<_i6.AuthRepository>()));
  return get;
}

class _$FirebaseInjectibleModule extends _i11.FirebaseInjectibleModule {}

class _$SharedResourcesInjectibleModule
    extends _i12.SharedResourcesInjectibleModule {}
