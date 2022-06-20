// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:esnya_shared_resources/esnya_shared_resources.dart' as _i14;
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart'
    as _i32;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;

import 'application/app_startup/cubit/app_startup_cubit.dart' as _i37;
import 'application/auth/auth_bloc.dart' as _i38;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i35;
import 'application/food_data/input/food_input_bloc.dart' as _i31;
import 'application/home_screen/bloc/dashboard_bloc.dart' as _i39;
import 'domain/app_startup/app_startup_repository.dart' as _i23;
import 'domain/auth/auth_repository.dart' as _i25;
import 'domain/isolate2/isolate_2_repository.dart' as _i12;
import 'domain/resources/file_repository.dart' as _i4;
import 'domain/resources/local_data_repository.dart' as _i15;
import 'domain/resources/resource_repository.dart' as _i17;
import 'domain/user_data/day_bucket_repository.dart' as _i27;
import 'domain/user_data/user_diet_preferences_repository.dart' as _i20;
import 'infrastructure/app_startup/app_startup_repository_impl.dart' as _i24;
import 'infrastructure/auth/auth_repository_impl.dart' as _i26;
import 'infrastructure/core/api/food_backend_client.dart' as _i8;
import 'infrastructure/core/api/food_backend_client_impl.dart' as _i9;
import 'infrastructure/core/dio_injectible_module.dart' as _i41;
import 'infrastructure/core/firebase_injectible_module.dart' as _i42;
import 'infrastructure/core/shared_resources_injectible_module.dart' as _i43;
import 'infrastructure/food_data/food_data_repository_isolate_2.dart' as _i29;
import 'infrastructure/food_data/food_data_repository_isolate_bridge.dart'
    as _i30;
import 'infrastructure/food_data/food_data_repository_local_impl_csv.dart'
    as _i10;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_2.dart'
    as _i40;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_bridge.dart'
    as _i33;
import 'infrastructure/food_mapping/food_mapping_repository_local_impl_csv.dart'
    as _i34;
import 'infrastructure/isolate2/isolate_2_repository_impl.dart' as _i13;
import 'infrastructure/resources/file_repository_impl.dart' as _i5;
import 'infrastructure/resources/local_data_repository_impl.dart' as _i16;
import 'infrastructure/resources/resource_repository_impl_isolate_1.dart'
    as _i18;
import 'infrastructure/resources/resource_repository_impl_isolate_2.dart'
    as _i19;
import 'infrastructure/user_data/day_bucket_repository_impl_firebase.dart'
    as _i28;
import 'infrastructure/user_data/user_diet_preferences_repository_impl.dart'
    as _i21;
import 'presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart'
    as _i22;
import 'presentation/routes/app_router.dart' as _i36;

const String _isolate1 = 'isolate1';
const String _isolate2 = 'isolate2';
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
  gh.lazySingleton<_i4.FileRepository>(() => _i5.FileRepositoryImpl(),
      registerFor: {_isolate1, _isolate2});
  gh.lazySingleton<_i6.FirebaseAuth>(
      () => firebaseInjectibleModule.fireBaseAuth);
  gh.lazySingleton<_i7.FirebaseFirestore>(
      () => firebaseInjectibleModule.firestore);
  gh.lazySingleton<_i8.FoodBackendClient>(
      () => _i9.FoodBackendClientImpl(get<_i3.Dio>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i10.FoodDataRepositoryLocalImplCsv>(
      () => _i10.FoodDataRepositoryLocalImplCsv(),
      registerFor: {_isolate2});
  gh.lazySingleton<_i11.GoogleSignIn>(
      () => firebaseInjectibleModule.googleSignIn);
  gh.lazySingleton<_i12.Isolate2Repository>(
      () => _i13.Isolate2RepositoryImpl());
  gh.singleton<_i14.LanguageRepository>(
      sharedResourcesInjectibleModule.languageRepository());
  gh.lazySingleton<_i15.LocalDataRepository>(
      () => _i16.LocalDataRepositoryImpl(),
      registerFor: {_isolate1, _isolate2});
  gh.lazySingleton<_i17.ResourceRepository>(
      () => _i18.ResourceRepositoryImplIsolate1(get<_i12.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i17.ResourceRepository>(
      () => _i19.ResourceRepositoryImplIsolate2(),
      registerFor: {_isolate2});
  gh.singleton<_i14.SimilarityCalculator>(
      sharedResourcesInjectibleModule.similarityCalculator());
  gh.singleton<_i14.TextProcessingRepository>(
      sharedResourcesInjectibleModule.textProcessingRepository());
  gh.lazySingleton<_i20.UserDietPreferencesRepository>(
      () => _i21.UserDietPreferencesRepositoryImpl(),
      registerFor: {_isolate1});
  gh.factory<_i22.VoiceInputSheetCubit>(
      () => _i22.VoiceInputSheetCubit(get<_i17.ResourceRepository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i23.AppStartupRepository>(
      () => _i24.AppStartupRepositoryImpl(get<_i4.FileRepository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i25.AuthRepository>(() => _i26.AuthRepositoryImpl(
      get<_i6.FirebaseAuth>(), get<_i11.GoogleSignIn>()));
  gh.lazySingleton<_i27.DayBucketsRepository>(
      () => _i28.DayBucketRepositoryImplFirebase(get<_i7.FirebaseFirestore>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i14.FoodDataRepository>(
      () => _i29.FoodDataRepositoryIsolate2(
          get<_i10.FoodDataRepositoryLocalImplCsv>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i14.FoodDataRepository>(
      () =>
          _i30.FoodDataRepositoryIsolateBridge(get<_i12.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i31.FoodInputBloc>(
      () => _i31.FoodInputBloc(get<_i14.TextProcessingRepository>(),
          get<_i27.DayBucketsRepository>(), get<_i14.FoodMappingRepository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i32.FoodMappingRepository>(
      () => _i33.FoodMappingRepositoryIsolateBridge(
          get<_i12.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i34.FoodMappingRepositoryLocalImplCsv>(
      () => _i34.FoodMappingRepositoryLocalImplCsv(
          similarityCalculator_: get<_i14.SimilarityCalculator>(),
          foodDataRepository_: get<_i14.FoodDataRepository>()),
      registerFor: {_isolate2});
  gh.factory<_i35.SignInFormBloc>(
      () => _i35.SignInFormBloc(get<_i25.AuthRepository>()));
  gh.lazySingleton<_i36.AppRouter>(() => _i36.AppRouter(
      get<_i25.AuthRepository>(), get<_i23.AppStartupRepository>()));
  gh.lazySingleton<_i37.AppStartupCubit>(
      () => _i37.AppStartupCubit(get<_i23.AppStartupRepository>()));
  gh.lazySingleton<_i38.AuthBloc>(
      () => _i38.AuthBloc(get<_i25.AuthRepository>()));
  gh.lazySingleton<_i39.DashboardBloc>(
      () => _i39.DashboardBloc(
          get<_i27.DayBucketsRepository>(), get<_i31.FoodInputBloc>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i14.FoodMappingRepository>(
      () => _i40.FoodMappingRepositoryIsolate2(
          get<_i34.FoodMappingRepositoryLocalImplCsv>()),
      registerFor: {_isolate2});
  return get;
}

class _$DioInjectibleModule extends _i41.DioInjectibleModule {}

class _$FirebaseInjectibleModule extends _i42.FirebaseInjectibleModule {}

class _$SharedResourcesInjectibleModule
    extends _i43.SharedResourcesInjectibleModule {}
