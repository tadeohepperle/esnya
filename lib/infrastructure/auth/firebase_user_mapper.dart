import '../../domain/auth/entities/entities.dart';
import '../../domain/core/unique_id.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

extension FirebaseUserDomainX on firebase_auth.User {
  User toDomain() {
    return User(
      id: UniqueId.fromTrustedIdString(uid),
    );
  }
}
