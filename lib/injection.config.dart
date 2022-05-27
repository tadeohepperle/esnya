// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:esnya_shared_resources/esnya_shared_resources.dart' as _i16;
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart'
    as _i30;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i35;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i33;
import 'application/food_data/input/food_input_bloc.dart' as _i29;
import 'application/home_screen/bloc/dashboard_bloc.dart' as _i36;
import 'domain/auth/auth_repository.dart' as _i25;
import 'domain/isolate2/isolate_2_repository.dart' as _i14;
import 'domain/resources/file_repository.dart' as _i4;
import 'domain/resources/local_data_repository.dart' as _i17;
import 'domain/resources/resource_repository.dart' as _i19;
import 'domain/user_data/food_item_entry_bucket_repository.dart' as _i11;
import 'domain/user_data/user_diet_preferences_repository.dart' as _i22;
import 'infrastructure/auth/auth_repository_impl.dart' as _i26;
import 'infrastructure/core/api/food_backend_client.dart' as _i8;
import 'infrastructure/core/api/food_backend_client_impl.dart' as _i9;
import 'infrastructure/core/dio_injectible_module.dart' as _i38;
import 'infrastructure/core/firebase_injectible_module.dart' as _i39;
import 'infrastructure/core/shared_resources_injectible_module.dart' as _i40;
import 'infrastructure/food_data/food_data_repository_isolate_2.dart' as _i27;
import 'infrastructure/food_data/food_data_repository_isolate_bridge.dart'
    as _i28;
import 'infrastructure/food_data/food_data_repository_local_impl_csv.dart'
    as _i10;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_2.dart'
    as _i37;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_bridge.dart'
    as _i31;
import 'infrastructure/food_mapping/food_mapping_repository_local_impl_csv.dart'
    as _i32;
import 'infrastructure/isolate2/isolate_2_repository_impl.dart' as _i15;
import 'infrastructure/resources/file_repository_impl.dart' as _i5;
import 'infrastructure/resources/local_data_repository_impl.dart' as _i18;
import 'infrastructure/resources/resource_repository_impl_isolate_1.dart'
    as _i20;
import 'infrastructure/resources/resource_repository_impl_isolate_2.dart'
    as _i21;
import 'infrastructure/user_data/food_item_entry_bucket_repository_impl_firebase.dart'
    as _i12;
import 'infrastructure/user_data/user_diet_preferences_repository_impl.dart'
    as _i23;
import 'presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart'
    as _i24;
import 'presentation/routes/app_router.dart' as _i34;

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
  gh.lazySingleton<_i11.FoodItemEntryBucketRepository>(
      () => _i12.FoodItemEntryBucketRepositoryImplFirebase(
          get<_i7.FirebaseFirestore>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i13.GoogleSignIn>(
      () => firebaseInjectibleModule.googleSignIn);
  gh.lazySingleton<_i14.Isolate2Repository>(
      () => _i15.Isolate2RepositoryImpl());
  gh.singleton<_i16.LanguageRepository>(
      sharedResourcesInjectibleModule.languageRepository());
  gh.lazySingleton<_i17.LocalDataRepository>(
      () => _i18.LocalDataRepositoryImpl(),
      registerFor: {_isolate1, _isolate2});
  gh.lazySingleton<_i19.ResourceRepository>(
      () => _i20.ResourceRepositoryImplIsolate1(get<_i14.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i19.ResourceRepository>(
      () => _i21.ResourceRepositoryImplIsolate2(),
      registerFor: {_isolate2});
  gh.singleton<_i16.SimilarityCalculator>(
      sharedResourcesInjectibleModule.similarityCalculator());
  gh.singleton<_i16.TextProcessingRepository>(
      sharedResourcesInjectibleModule.textProcessingRepository());
  gh.lazySingleton<_i22.UserDietPreferencesRepository>(
      () => _i23.UserDietPreferencesRepositoryImpl(),
      registerFor: {_isolate1});
  gh.factory<_i24.VoiceInputSheetCubit>(
      () => _i24.VoiceInputSheetCubit(get<_i19.ResourceRepository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i25.AuthRepository>(() => _i26.AuthRepositoryImpl(
      get<_i6.FirebaseAuth>(), get<_i13.GoogleSignIn>()));
  gh.lazySingleton<_i16.FoodDataRepository>(
      () => _i27.FoodDataRepositoryIsolate2(
          get<_i10.FoodDataRepositoryLocalImplCsv>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i16.FoodDataRepository>(
      () =>
          _i28.FoodDataRepositoryIsolateBridge(get<_i14.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i29.FoodInputBloc>(
      () => _i29.FoodInputBloc(
          get<_i16.TextProcessingRepository>(),
          get<_i11.FoodItemEntryBucketRepository>(),
          get<_i16.FoodMappingRepository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i30.FoodMappingRepository>(
      () => _i31.FoodMappingRepositoryIsolateBridge(
          get<_i14.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i32.FoodMappingRepositoryLocalImplCsv>(
      () => _i32.FoodMappingRepositoryLocalImplCsv(
          similarityCalculator_: get<_i16.SimilarityCalculator>(),
          foodDataRepository_: get<_i16.FoodDataRepository>()),
      registerFor: {_isolate2});
  gh.factory<_i33.SignInFormBloc>(
      () => _i33.SignInFormBloc(get<_i25.AuthRepository>()));
  gh.lazySingleton<_i34.AppRouter>(
      () => _i34.AppRouter(get<_i25.AuthRepository>()));
  gh.factory<_i35.AuthBloc>(() => _i35.AuthBloc(get<_i25.AuthRepository>()));
  gh.lazySingleton<_i36.DashboardBloc>(
      () => _i36.DashboardBloc(
          get<_i11.FoodItemEntryBucketRepository>(), get<_i29.FoodInputBloc>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i16.FoodMappingRepository>(
      () => _i37.FoodMappingRepositoryIsolate2(
          get<_i32.FoodMappingRepositoryLocalImplCsv>()),
      registerFor: {_isolate2});
  return get;
}

class _$DioInjectibleModule extends _i38.DioInjectibleModule {}

class _$FirebaseInjectibleModule extends _i39.FirebaseInjectibleModule {}

class _$SharedResourcesInjectibleModule
    extends _i40.SharedResourcesInjectibleModule {}
