part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = _Started;

  const factory DashboardEvent.bucketsReceived(
          Either<Failure, KtList<FoodItemEntryBucket>> failureOrBuckets) =
      _BucketsReceived;

  const factory DashboardEvent.foodInputEntriesReceived(
      BlocAndRepoFoodItemEntries entries) = _FoodInputEntriesReceived;
}