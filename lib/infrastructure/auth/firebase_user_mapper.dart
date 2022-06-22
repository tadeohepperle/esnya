import 'package:esnya_shared_resources/core/data_structures/unique_id.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../domain/auth/entities/entities.dart';

extension FirebaseUserDomainX on firebase_auth.User {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
