import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseLoginRepository {
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password);

  Future<void> signOut();
}
