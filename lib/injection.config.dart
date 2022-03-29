// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:esnya_shared_resources/esnya_shared_resources.dart' as _i4;
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart'
    as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i17;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i15;
import 'domain/auth/auth_repository.dart' as _i11;
import 'domain/isolate2/isolate_2_repository.dart' as _i9;
import 'infrastructure/auth/auth_repository_impl.dart' as _i12;
import 'infrastructure/core/firebase_injectible_module.dart' as _i18;
import 'infrastructure/core/shared_resources_injectible_module.dart' as _i19;
import 'infrastructure/food_data/food_data_repository_isolate_bridge.dart'
    as _i13;
import 'infrastructure/food_data/food_data_repository_remote_impl.dart' as _i5;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_bridge.dart'
    as _i14;
import 'infrastructure/food_mapping/food_mapping_repository_remote_impl.dart'
    as _i7;
import 'infrastructure/isolate2/isolate_2_repository_impl.dart' as _i10;
import 'presentation/routes/app_router.dart' as _i16;

const String _isolate2 = 'isolate2';
const String _isolate1 = 'isolate1';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectibleModule = _$FirebaseInjectibleModule();
  final sharedResourcesInjectibleModule = _$SharedResourcesInjectibleModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectibleModule.fireBaseAuth);
  gh.lazySingleton<_i4.FoodDataRepository>(
      () => _i5.FoodDataRepositoryRemoteImpl(),
      registerFor: {_isolate2});
  gh.lazySingleton<_i6.FoodMappingRepository>(
      () => _i7.FoodMappingRepositoryRemoteImpl(),
      registerFor: {_isolate2});
  gh.lazySingleton<_i8.GoogleSignIn>(
      () => firebaseInjectibleModule.googleSignIn);
  gh.lazySingleton<_i9.Isolate2Repository>(() => _i10.Isolate2RepositoryImpl());
  gh.singleton<_i4.SimilarityCalculator>(
      sharedResourcesInjectibleModule.similarityCalculator());
  gh.lazySingleton<_i11.AuthRepository>(() => _i12.FirebaseAuthRepository(
      get<_i3.FirebaseAuth>(), get<_i8.GoogleSignIn>()));
  gh.lazySingleton<_i4.FoodDataRepository>(
      () => _i13.FoodDataRepositoryIsolateBridge(get<_i9.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i6.FoodMappingRepository>(
      () => _i14.FoodMappingRepositoryIsolateBridge(
          get<_i9.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.factory<_i15.SignInFormBloc>(
      () => _i15.SignInFormBloc(get<_i11.AuthRepository>()));
  gh.lazySingleton<_i16.AppRouter>(
      () => _i16.AppRouter(get<_i11.AuthRepository>()));
  gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(get<_i11.AuthRepository>()));
  return get;
}

class _$FirebaseInjectibleModule extends _i18.FirebaseInjectibleModule {}

class _$SharedResourcesInjectibleModule
    extends _i19.SharedResourcesInjectibleModule {}
