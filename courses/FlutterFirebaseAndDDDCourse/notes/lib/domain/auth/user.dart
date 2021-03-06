import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/core/value_objects.dart';

part 'user.freezed.dart';

//? Step 31: create a new entity class [User] to store the User ID [UniqueId]
@freezed
abstract class User with _$User {
  const factory User({
    @required UniqueId id,
  }) = _User;
}
