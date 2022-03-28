import 'package:esnya_shared_resources/core/data_structures/unique_id.dart';

import '../../domain/auth/entities/entities.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

extension FirebaseUserDomainX on firebase_auth.User {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
