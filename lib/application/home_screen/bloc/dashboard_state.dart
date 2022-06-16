part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required DashboardBucketsState dashboardBucketsState,
    required KtList<DayBucket> buckets,
    required KtList<FoodItemEntry> entriesBetweenBlocAndRepo,
    required KtList<FoodItemEntryWrapper> entriesFoodInputBloc,
  }) = _DashboardState;
  factory DashboardState.initial() => DashboardState(
        dashboardBucketsState: DashboardBucketsState.loading,
        buckets: <DayBucket>[].toImmutableList(),
        entriesBetweenBlocAndRepo: <FoodItemEntry>[].toImmutableList(),
        entriesFoodInputBloc: <FoodItemEntryWrapper>[].toImmutableList(),
      );
}

enum DashboardBucketsState { loading, loaded, failure }
