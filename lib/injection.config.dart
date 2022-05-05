// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:esnya_shared_resources/esnya_shared_resources.dart' as _i8;
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart'
    as _i26;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i12;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i31;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i29;
import 'application/food_data/input/food_input_bloc.dart' as _i25;
import 'application/home_screen/bloc/dashboard_bloc.dart' as _i32;
import 'domain/auth/auth_repository.dart' as _i22;
import 'domain/isolate2/isolate_2_repository.dart' as _i13;
import 'domain/resources/local_data_repository.dart' as _i15;
import 'domain/resources/resource_repository.dart' as _i17;
import 'domain/user_data/food_item_entry_bucket_repository.dart' as _i10;
import 'domain/user_data/user_diet_preferences_repository.dart' as _i19;
import 'infrastructure/auth/auth_repository_impl.dart' as _i23;
import 'infrastructure/core/api/food_backend_client.dart' as _i6;
import 'infrastructure/core/api/food_backend_client_impl.dart' as _i7;
import 'infrastructure/core/dio_injectible_module.dart' as _i33;
import 'infrastructure/core/firebase_injectible_module.dart' as _i34;
import 'infrastructure/core/shared_resources_injectible_module.dart' as _i35;
import 'infrastructure/food_data/food_data_repository_impl_asset_bundle.dart'
    as _i9;
import 'infrastructure/food_data/food_data_repository_isolate_bridge.dart'
    as _i24;
import 'infrastructure/food_mapping/food_mapping_repository_impl_asset_bundle.dart'
    as _i28;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_bridge.dart'
    as _i27;
import 'infrastructure/isolate2/isolate_2_repository_impl.dart' as _i14;
import 'infrastructure/resources/local_data_repository_impl.dart' as _i16;
import 'infrastructure/resources/resource_repository_impl.dart' as _i18;
import 'infrastructure/user_data/food_item_entry_bucket_repository_impl_firebase.dart'
    as _i11;
import 'infrastructure/user_data/user_diet_preferences_repository_impl.dart'
    as _i20;
import 'presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart'
    as _i21;
import 'presentation/routes/app_router.dart' as _i30;

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
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseInjectibleModule.firestore);
  gh.lazySingleton<_i6.FoodBackendClient>(
      () => _i7.FoodBackendClientImpl(get<_i3.Dio>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i8.FoodDataRepository>(
      () => _i9.FoodDataRepositoryImplAssetBundle(),
      registerFor: {_isolate2});
  gh.lazySingleton<_i10.FoodItemEntryBucketRepository>(
      () => _i11.FoodItemEntryBucketRepositoryImplFirebase(
          get<_i5.FirebaseFirestore>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i12.GoogleSignIn>(
      () => firebaseInjectibleModule.googleSignIn);
  gh.lazySingleton<_i13.Isolate2Repository>(
      () => _i14.Isolate2RepositoryImpl());
  gh.singleton<_i8.LanguageRepository>(
      sharedResourcesInjectibleModule.languageRepository());
  gh.lazySingleton<_i15.LocalDataRepository>(
      () => _i16.LocalDataRepositoryImpl(),
      registerFor: {_isolate1});
  gh.lazySingleton<_i17.ResourceRepository>(() => _i18.ResourceRepositoryImpl(),
      registerFor: {_isolate1});
  gh.singleton<_i8.SimilarityCalculator>(
      sharedResourcesInjectibleModule.similarityCalculator());
  gh.singleton<_i8.TextProcessingRepository>(
      sharedResourcesInjectibleModule.textProcessingRepository());
  gh.lazySingleton<_i19.UserDietPreferencesRepository>(
      () => _i20.UserDietPreferencesRepositoryImpl(),
      registerFor: {_isolate1});
  gh.factory<_i21.VoiceInputSheetCubit>(() => _i21.VoiceInputSheetCubit(),
      registerFor: {_isolate1});
  gh.lazySingleton<_i22.AuthRepository>(() => _i23.AuthRepositoryImpl(
      get<_i4.FirebaseAuth>(), get<_i12.GoogleSignIn>()));
  gh.lazySingleton<_i8.FoodDataRepository>(
      () =>
          _i24.FoodDataRepositoryIsolateBridge(get<_i13.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i25.FoodInputBloc>(
      () => _i25.FoodInputBloc(
          get<_i8.TextProcessingRepository>(),
          get<_i10.FoodItemEntryBucketRepository>(),
          get<_i8.FoodMappingRepository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i26.FoodMappingRepository>(
      () => _i27.FoodMappingRepositoryIsolateBridge(
          get<_i13.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i8.FoodMappingRepository>(
      () => _i28.FoodMappingRepositoryImplAssetBundle(
          foodDataRepository: get<_i8.FoodDataRepository>(),
          similarityCalculator: get<_i8.SimilarityCalculator>()),
      registerFor: {_isolate2});
  gh.factory<_i29.SignInFormBloc>(
      () => _i29.SignInFormBloc(get<_i22.AuthRepository>()));
  gh.lazySingleton<_i30.AppRouter>(
      () => _i30.AppRouter(get<_i22.AuthRepository>()));
  gh.factory<_i31.AuthBloc>(() => _i31.AuthBloc(get<_i22.AuthRepository>()));
  gh.lazySingleton<_i32.DashboardBloc>(
      () => _i32.DashboardBloc(
          get<_i10.FoodItemEntryBucketRepository>(), get<_i25.FoodInputBloc>()),
      registerFor: {_isolate1});
  return get;
}

class _$DioInjectibleModule extends _i33.DioInjectibleModule {}

class _$FirebaseInjectibleModule extends _i34.FirebaseInjectibleModule {}

class _$SharedResourcesInjectibleModule
    extends _i35.SharedResourcesInjectibleModule {}
