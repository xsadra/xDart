import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:notes/domain/auth/auth_failure.dart';
import 'package:notes/domain/auth/user.dart';
import 'package:notes/domain/auth/value_objects.dart';

// * Use [Unit] class instead of [void] keyword
//? Step 7: create auth facade interface [act as a Repository]

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  //? Step 32: add [getSignInUser, signOut] to [IAuthFacade] contract in domain layer
  Future<Option<User>> getSignInUser();

  Future<void> signOut();
}
