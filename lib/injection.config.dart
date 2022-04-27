// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:esnya_shared_resources/esnya_shared_resources.dart' as _i8;
import 'package:esnya_shared_resources/food_mapping/repositories/food_mapping_repository.dart'
    as _i12;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_bloc.dart' as _i25;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i23;
import 'application/food_data/input/food_input_bloc.dart' as _i21;
import 'application/home_screen/bloc/dashboard_bloc.dart' as _i26;
import 'domain/auth/auth_repository.dart' as _i18;
import 'domain/isolate2/isolate_2_repository.dart' as _i15;
import 'domain/user_data/food_item_entry_bucket_repository.dart' as _i10;
import 'infrastructure/auth/auth_repository_impl.dart' as _i19;
import 'infrastructure/core/api/food_backend_client.dart' as _i6;
import 'infrastructure/core/api/food_backend_client_impl.dart' as _i7;
import 'infrastructure/core/dio_injectible_module.dart' as _i27;
import 'infrastructure/core/firebase_injectible_module.dart' as _i28;
import 'infrastructure/core/shared_resources_injectible_module.dart' as _i29;
import 'infrastructure/food_data/food_data_repository_isolate_bridge.dart'
    as _i20;
import 'infrastructure/food_data/food_data_repository_remote_impl.dart' as _i9;
import 'infrastructure/food_mapping/food_mapping_repository_isolate_bridge.dart'
    as _i22;
import 'infrastructure/food_mapping/food_mapping_repository_remote_impl.dart'
    as _i13;
import 'infrastructure/isolate2/isolate_2_repository_impl.dart' as _i16;
import 'infrastructure/user_data/food_item_entry_bucket_repository_impl_firebase.dart'
    as _i11;
import 'presentation/core/widgets/voice_input_sheet/cubit/voice_input_sheet_cubit.dart'
    as _i17;
import 'presentation/routes/app_router.dart' as _i24;

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
      () => _i9.FoodDataRepositoryRemoteImpl(get<_i6.FoodBackendClient>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i10.FoodItemEntryBucketRepository>(
      () => _i11.FoodItemEntryBucketRepositoryImplFirebase(
          get<_i5.FirebaseFirestore>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i12.FoodMappingRepository>(
      () => _i13.FoodMappingRepositoryRemoteImpl(get<_i6.FoodBackendClient>()),
      registerFor: {_isolate2});
  gh.lazySingleton<_i14.GoogleSignIn>(
      () => firebaseInjectibleModule.googleSignIn);
  gh.lazySingleton<_i15.Isolate2Repository>(
      () => _i16.Isolate2RepositoryImpl());
  gh.singleton<_i8.LanguageRepository>(
      sharedResourcesInjectibleModule.languageRepository());
  gh.singleton<_i8.SimilarityCalculator>(
      sharedResourcesInjectibleModule.similarityCalculator());
  gh.singleton<_i8.TextProcessingRepository>(
      sharedResourcesInjectibleModule.textProcessingRepository());
  gh.factory<_i17.VoiceInputSheetCubit>(() => _i17.VoiceInputSheetCubit(),
      registerFor: {_isolate1});
  gh.lazySingleton<_i18.AuthRepository>(() => _i19.AuthRepositoryImpl(
      get<_i4.FirebaseAuth>(), get<_i14.GoogleSignIn>()));
  gh.lazySingleton<_i8.FoodDataRepository>(
      () =>
          _i20.FoodDataRepositoryIsolateBridge(get<_i15.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i21.FoodInputBloc>(
      () => _i21.FoodInputBloc(
          get<_i8.TextProcessingRepository>(),
          get<_i10.FoodItemEntryBucketRepository>(),
          get<_i8.FoodMappingRepository>()),
      registerFor: {_isolate1});
  gh.lazySingleton<_i12.FoodMappingRepository>(
      () => _i22.FoodMappingRepositoryIsolateBridge(
          get<_i15.Isolate2Repository>()),
      registerFor: {_isolate1});
  gh.factory<_i23.SignInFormBloc>(
      () => _i23.SignInFormBloc(get<_i18.AuthRepository>()));
  gh.lazySingleton<_i24.AppRouter>(
      () => _i24.AppRouter(get<_i18.AuthRepository>()));
  gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(get<_i18.AuthRepository>()));
  gh.lazySingleton<_i26.DashboardBloc>(
      () => _i26.DashboardBloc(
          get<_i10.FoodItemEntryBucketRepository>(), get<_i21.FoodInputBloc>()),
      registerFor: {_isolate1});
  return get;
}

class _$DioInjectibleModule extends _i27.DioInjectibleModule {}

class _$FirebaseInjectibleModule extends _i28.FirebaseInjectibleModule {}

class _$SharedResourcesInjectibleModule
    extends _i29.SharedResourcesInjectibleModule {}
