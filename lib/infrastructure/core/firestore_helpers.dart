import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/auth/auth_repository.dart';
import '../../domain/core/errors.dart';
import '../../injection.dart';
import 'package:esnya_shared_resources/core/core.dart';

const kBucketsCollectionName = 'buckets';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = getIt<AuthRepository>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance.collection('users').doc(user.id.value);
  }

  Future<DocumentReference> bucketDocument(UniqueId bucketId) async {
    final userDoc = await userDocument();
    return userDoc.collection(kBucketsCollectionName).doc(bucketId.value);
  }
}
