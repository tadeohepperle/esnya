part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required DashboardBucketsState dashboardBucketsState,
    required KtList<FoodItemEntryBucket> buckets,
    required KtList<FoodItemEntry> entriesBetweenBlocAndRepo,
    required KtList<FoodItemEntry> entriesFoodInputBloc,
  }) = _DashboardState;
  factory DashboardState.initial() => DashboardState(
        dashboardBucketsState: DashboardBucketsState.loading,
        buckets: <FoodItemEntryBucket>[].toImmutableList(),
        entriesBetweenBlocAndRepo: <FoodItemEntry>[].toImmutableList(),
        entriesFoodInputBloc: <FoodItemEntry>[].toImmutableList(),
      );
}

enum DashboardBucketsState { loading, loaded, failure }
