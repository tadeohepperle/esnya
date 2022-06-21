import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/infrastructure/core/firestore_helpers.dart';
import 'package:esnya/infrastructure/user_data/dtos/day_bucket_dto.dart';
import 'package:esnya/injection.dart';
import 'package:esnya_shared_resources/core/core.dart';
import 'package:kt_dart/kt.dart';

import '../../../domain/core/errors.dart';

void postRandomDataToFireStore() async {
  FirebaseFirestore _firestore = getIt<FirebaseFirestore>();
  AuthRepository _authRepo = getIt<AuthRepository>();
  var user = _authRepo
      .getSignedInUser()
      .getOrElse(() => throw NotAuthenticatedError());
  final userDoc = await _firestore.userDocument();
  var startDate = DateTime(2021, 1, 1);

  for (var i = 0; i < 200; i++) {
    startDate = startDate.add(Duration(days: 1));
    var y = startDate.year.toString();
    var m = startDate.month.toString().padLeft(2, '0');
    var d = startDate.day.toString().padLeft(2, '0');
    var bucketid = '$y-$m-$d';

    int nEntries = randInt(0, 8);
    DateTime entryTime = startDate.add(Duration(hours: randInt(0, 12)));
    List<FoodItemEntry> entries = [];
    for (var i = 0; i < nEntries; i++) {
      entryTime = entryTime.add(Duration(minutes: randInt(0, 59)));
      entries.add(TestObjectFaker.randomFoodItemEntry(entryTime));
    }

    var bucket = DayBucket(
        userId: user.id,
        id: UniqueId.fromUniqueString(bucketid),
        entries: entries.toImmutableList());

    await userDoc.collection("buckets").doc(bucketid).set(bucket.toFireStore());
    print("sent bucket for $startDate");
    print("----------");
  }
}

void deleteLogBuckets() async {
  FirebaseFirestore _firestore = getIt<FirebaseFirestore>();
  AuthRepository _authRepo = getIt<AuthRepository>();
  var user = _authRepo
      .getSignedInUser()
      .getOrElse(() => throw NotAuthenticatedError());
  final userDoc = await _firestore.userDocument();
  final sn = await userDoc
      .collection("buckets")
      .where("id", isGreaterThan: "log-")
      .get();
  sn.docs.forEach((element) {
    element.reference.delete();
  });
}
