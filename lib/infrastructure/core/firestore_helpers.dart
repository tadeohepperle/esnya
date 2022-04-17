import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esnya/domain/auth/auth_repository.dart';
import 'package:esnya/domain/core/errors.dart';
import 'package:esnya/injection.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = getIt<AuthRepository>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance.collection('users').doc(user.id.value);
  }
}
