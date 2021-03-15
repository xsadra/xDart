import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:notes/domain/auth/user.dart';
import 'package:notes/domain/core/value_objects.dart';

//? Step 33: add a mapper extension to [FirebaseUser] convert to User
extension FirebaseUserDomanX on firebase.User {
  User toDomain() {
    return User(id: UniqueId.fromUniqueString(uid));
  }
}
