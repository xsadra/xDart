import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/domain/auth/i_auth_facade.dart';
import 'package:notes/domain/core/errors.dart';
import 'package:notes/injection.dart';

//? Step 58: create [FirestoreX] extension on [Firestore]
extension FirestoreX on Firestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return Firestore.instance
        .collection('users')
        .document(user.id.getOrCrash());
  }
}
//? Step 59: create [DocumentReferenceX] extension on [DocumentReference]

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}
