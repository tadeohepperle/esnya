part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.started() = _Started;

  const factory DashboardEvent.bucketsReceived(
    Either<Failure, KtList<DayBucket>> failureOrBuckets,
  ) = _BucketsReceived;

  const factory DashboardEvent.foodInputBlocEntriesReceived(
      KtList<FoodItemEntryWrapper> entries) = _FoodInputBlocEntriesReceived;

  const factory DashboardEvent.foodInputBlocOutgoingEntriesReceived(
      KtList<FoodItemEntry> entries) = _FoodInputBlocOutgoingEntriesReceived;

  const factory DashboardEvent.extendBucketWatchRange() =
      _ExtendBucketWatchRange;
}
