part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    required DashboardBucketsState dashboardBucketsState,
    required KtList<DayBucket> buckets,
    required KtList<FoodItemEntry> foodInputBlocOutgoingEntries,
    required KtList<FoodItemEntryWrapper> foodInputBlocEntries,
  }) = _DashboardState;
  factory DashboardState.initial() => DashboardState(
        dashboardBucketsState: DashboardBucketsState.loading,
        buckets: <DayBucket>[].toImmutableList(),

        /// foodInputBlocOutgoingEntries acts as a cache for entries
        /// that have left the food Input Bloc because the user committed them,
        /// but they have not quite arrived in the firebase stream of entries we listen to.
        foodInputBlocOutgoingEntries: <FoodItemEntry>[].toImmutableList(),
        foodInputBlocEntries: <FoodItemEntryWrapper>[].toImmutableList(),
      );
}

enum DashboardBucketsState { loading, loaded, failure }
