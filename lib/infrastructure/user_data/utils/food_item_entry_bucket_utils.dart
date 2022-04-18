import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/domain/core/errors.dart';
import 'package:esnya/injection.dart';
import 'package:intl/intl.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:kt_dart/collection.dart';

final DateFormat formatter = DateFormat('yyyy-MM-dd');
String bucketIdForToday() =>
    'log-${formatter.format(DateTime.now())}'; // for example "log-2022-04-03";
FoodItemEntryBucket createBucketForToday() {
  final userOption = getIt<AuthRepository>().getSignedInUser();
  final user = userOption.getOrElse(() => throw NotAuthenticatedError());
  return FoodItemEntryBucket(
    userId: user.id,
    id: UniqueId.fromUniqueString(bucketIdForToday()),
    type: FoodItemEntryBucketType.log,
    entries: <FoodItemEntry>[].toImmutableList(),
  );
}

Map<String, dynamic> updateObjectForEntry(FoodItemEntry entry) {
  return {'entries.${entry.id.value}': entry.toJson()};
}

Map<String, dynamic> deleteObjectForEntry(FoodItemEntry entry) {
  return {'entries.${entry.id.value}': FieldValue.delete()};
}

Map<String, dynamic> updateObjectForEntries(Iterable<FoodItemEntry> entries) {
  return {
    for (var entry in entries) 'entries.${entry.id.value}': entry.toJson()
  };
}
