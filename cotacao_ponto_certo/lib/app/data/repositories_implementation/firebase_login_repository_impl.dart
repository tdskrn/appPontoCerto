import 'package:cotacao_ponto_certo/app/domain/repositories/firebase_login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoginRepositoryImpl implements FirebaseLoginRepository {
  final FirebaseAuth _firebaseAuth;
  FirebaseLoginRepositoryImpl(this._firebaseAuth);

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  @override
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
