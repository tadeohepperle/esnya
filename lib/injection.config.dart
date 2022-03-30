// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:esnya_shared_resources/esnya_shared_resources.dart' as _i7;
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart'
    as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i20;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i18;
import 'domain/auth/auth_repository.dart' as _i14;
import 'domain/isolate2/isolate_2_repository.dart' as _i12;
import 'infrastructure/auth/auth_repository_impl.dart' as _i15;
import 'infrastructure/core/api/food_backend_client.dart' as _i5;
import 'infrastructure/core/api/food_backend_client_impl.dart' as _i6;
import 'infrastructure/core/dio_injectible_module.dart' as _i21;
import 'infrastructure/core/firebase_injectible_module.dart' as _i22;
import 'infrastructure/core/shared_resources_injectible_module.dart' as _i23;
import 'infrastructure/food_data/food_data_repository_isolate_bridge.dart'
    as _i16;
import 'infrastructure/food_data/food_data_repository_remote_impl.dart' as _i8;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_bridge.dart'
    as _i17;
import 'infrastructure/food_mapping/food_mapping_repository_remote_impl.dart'
    as _i10;
import 'infrastructure/isolate2/isolate_2_repository_impl.dart' as _i13;
import 'presentation/routes/app_router.dart' as _i19;

const String _isolate2 = 'isolate2';
const String _isolate1 = 'isolate1';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioInjectibleModule = _$DioInjectibleModule();
  final firebaseInjectibleModule = _$FirebaseInjectibleModule();
  final sharedResourcesInjectibleModule = _$SharedResourcesInjectibleModule();
  gh.lazySingleton<_i3.Dio>(() => dioInjectibleModule.dio);
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectibleModule.fireBaseAuth);
  gh.lazySingleton<_i5.FoodBackendClient>(
      () => _i6.FoodBackendClientImpl(get<_i3.Dio>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i7.FoodDataRepository>(
      () => _i8.FoodDataRepositoryRemoteImpl(get<_i5.FoodBackendClient>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i9.FoodMappingRepository>(
      () => _i10.FoodMappingRepositoryRemoteImpl(),
      registerFor: {_isolate2});
  gh.lazySingleton<_i11.GoogleSignIn>(
      () => firebaseInjectibleModule.googleSignIn);
  gh.lazySingleton<_i12.Isolate2Repository>(
      () => _i13.Isolate2RepositoryImpl());
  gh.singleton<_i7.SimilarityCalculator>(
      sharedResourcesInjectibleModule.similarityCalculator());
  gh.lazySingleton<_i14.AuthRepository>(() => _i15.FirebaseAuthRepository(
      get<_i4.FirebaseAuth>(), get<_i11.GoogleSignIn>()));
  gh.lazySingleton<_i7.FoodDataRepository>(
      () =>
          _i16.FoodDataRepositoryIsolateBridge(get<_i12.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i9.FoodMappingRepository>(
      () => _i17.FoodMappingRepositoryIsolateBridge(
          get<_i12.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.factory<_i18.SignInFormBloc>(
      () => _i18.SignInFormBloc(get<_i14.AuthRepository>()));
  gh.lazySingleton<_i19.AppRouter>(
      () => _i19.AppRouter(get<_i14.AuthRepository>()));
  gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(get<_i14.AuthRepository>()));
  return get;
}

class _$DioInjectibleModule extends _i21.DioInjectibleModule {}

class _$FirebaseInjectibleModule extends _i22.FirebaseInjectibleModule {}

class _$SharedResourcesInjectibleModule
    extends _i23.SharedResourcesInjectibleModule {}
