// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:esnya_shared_resources/esnya_shared_resources.dart' as _i16;
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart'
    as _i29;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i34;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i32;
import 'application/food_data/input/food_input_bloc.dart' as _i28;
import 'application/home_screen/bloc/dashboard_bloc.dart' as _i35;
import 'domain/auth/auth_repository.dart' as _i24;
import 'domain/isolate2/isolate_2_repository.dart' as _i14;
import 'domain/resources/local_data_repository.dart' as _i17;
import 'domain/resources/resource_repository.dart' as _i19;
import 'domain/user_data/food_item_entry_bucket_repository.dart' as _i10;
import 'domain/user_data/user_diet_preferences_repository.dart' as _i21;
import 'infrastructure/auth/auth_repository_impl.dart' as _i25;
import 'infrastructure/core/api/food_backend_client.dart' as _i6;
import 'infrastructure/core/api/food_backend_client_impl.dart' as _i7;
import 'infrastructure/core/dio_injectible_module.dart' as _i37;
import 'infrastructure/core/firebase_injectible_module.dart' as _i38;
import 'infrastructure/core/shared_resources_injectible_module.dart' as _i39;
import 'infrastructure/food_data/food_data_repository_isolate2.dart' as _i27;
import 'infrastructure/food_data/food_data_repository_isolate_bridge.dart'
    as _i26;
import 'infrastructure/food_data/food_data_repository_local_impl_csv.dart'
    as _i8;
import 'infrastructure/food_data/food_data_repository_remote_impl.dart' as _i9;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_2.dart'
    as _i36;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_bridge.dart'
    as _i30;
import 'infrastructure/food_mapping/food_mapping_repository_local_impl_csv.dart'
    as _i31;
import 'infrastructure/food_mapping/food_mapping_repository_remote_impl.dart'
    as _i12;
import 'infrastructure/isolate2/isolate_2_repository_impl.dart' as _i15;
import 'infrastructure/resources/local_data_repository_impl.dart' as _i18;
import 'infrastructure/resources/resource_repository_impl.dart' as _i20;
import 'infrastructure/user_data/food_item_entry_bucket_repository_impl_firebase.dart'
    as _i11;
import 'infrastructure/user_data/user_diet_preferences_repository_impl.dart'
    as _i22;
import 'presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart'
    as _i23;
import 'presentation/routes/app_router.dart' as _i33;

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
  gh.lazySingleton<_i8.FoodDataRepositoryLocalImplCsv>(
      () => _i8.FoodDataRepositoryLocalImplCsv(),
      registerFor: {_isolate2});
  gh.lazySingleton<_i9.FoodDataRepositoryRemoteImpl>(
      () => _i9.FoodDataRepositoryRemoteImpl(get<_i6.FoodBackendClient>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i10.FoodItemEntryBucketRepository>(
      () => _i11.FoodItemEntryBucketRepositoryImplFirebase(
          get<_i5.FirebaseFirestore>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i12.FoodMappingRepositoryRemoteImpl>(
      () => _i12.FoodMappingRepositoryRemoteImpl(get<_i6.FoodBackendClient>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i13.GoogleSignIn>(
      () => firebaseInjectibleModule.googleSignIn);
  gh.lazySingleton<_i14.Isolate2Repository>(
      () => _i15.Isolate2RepositoryImpl());
  gh.singleton<_i16.LanguageRepository>(
      sharedResourcesInjectibleModule.languageRepository());
  gh.lazySingleton<_i17.LocalDataRepository>(
      () => _i18.LocalDataRepositoryImpl(),
      registerFor: {_isolate2, _isolate1});
  gh.lazySingleton<_i19.ResourceRepository>(() => _i20.ResourceRepositoryImpl(),
      registerFor: {_isolate2, _isolate1});
  gh.singleton<_i16.SimilarityCalculator>(
      sharedResourcesInjectibleModule.similarityCalculator());
  gh.singleton<_i16.TextProcessingRepository>(
      sharedResourcesInjectibleModule.textProcessingRepository());
  gh.lazySingleton<_i21.UserDietPreferencesRepository>(
      () => _i22.UserDietPreferencesRepositoryImpl(),
      registerFor: {_isolate1});
  gh.factory<_i23.VoiceInputSheetCubit>(() => _i23.VoiceInputSheetCubit(),
      registerFor: {_isolate1});
  gh.lazySingleton<_i24.AuthRepository>(() => _i25.AuthRepositoryImpl(
      get<_i4.FirebaseAuth>(), get<_i13.GoogleSignIn>()));
  gh.lazySingleton<_i16.FoodDataRepository>(
      () =>
          _i26.FoodDataRepositoryIsolateBridge(get<_i14.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i16.FoodDataRepository>(
      () => _i27.FoodDataRepositoryIsolate2(
          get<_i19.ResourceRepository>(),
          get<_i8.FoodDataRepositoryLocalImplCsv>(),
          get<_i9.FoodDataRepositoryRemoteImpl>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i28.FoodInputBloc>(
      () => _i28.FoodInputBloc(
          get<_i16.TextProcessingRepository>(),
          get<_i10.FoodItemEntryBucketRepository>(),
          get<_i16.FoodMappingRepository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i29.FoodMappingRepository>(
      () => _i30.FoodMappingRepositoryIsolateBridge(
          get<_i14.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i31.FoodMappingRepositoryLocalImplCsv>(
      () => _i31.FoodMappingRepositoryLocalImplCsv(
          similarityCalculator_: get<_i16.SimilarityCalculator>(),
          foodDataRepository_: get<_i16.FoodDataRepository>()),
      registerFor: {_isolate2});
  gh.factory<_i32.SignInFormBloc>(
      () => _i32.SignInFormBloc(get<_i24.AuthRepository>()));
  gh.lazySingleton<_i33.AppRouter>(
      () => _i33.AppRouter(get<_i24.AuthRepository>()));
  gh.factory<_i34.AuthBloc>(() => _i34.AuthBloc(get<_i24.AuthRepository>()));
  gh.lazySingleton<_i35.DashboardBloc>(
      () => _i35.DashboardBloc(
          get<_i10.FoodItemEntryBucketRepository>(), get<_i28.FoodInputBloc>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i16.FoodMappingRepository>(
      () => _i36.FoodMappingRepositoryIsolate2(
          get<_i19.ResourceRepository>(),
          get<_i31.FoodMappingRepositoryLocalImplCsv>(),
          get<_i12.FoodMappingRepositoryRemoteImpl>()),
      registerFor: {_isolate2});
  return get;
}

class _$DioInjectibleModule extends _i37.DioInjectibleModule {}

class _$FirebaseInjectibleModule extends _i38.FirebaseInjectibleModule {}

class _$SharedResourcesInjectibleModule
    extends _i39.SharedResourcesInjectibleModule {}
