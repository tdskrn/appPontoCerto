import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cotacao_ponto_certo/models/entitys/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Sign up users
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUsers(UserApp user) async {
    String res = 'Some error ocurred';

    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await _firestore.collection('users').doc(cred.user!.uid).set({
        'email': user.email,
        'fullName': user.fullName,
        'phoneNumber': user.phoneNumber,
        'userId': cred.user!.uid,
      }).whenComplete(() {
        res = 'success';
        return res;
      });
    } catch (error) {}
    return res;
  }

  loginUsers(String email, String password) async {
    String res = 'something went wrong';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Please fiels must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
