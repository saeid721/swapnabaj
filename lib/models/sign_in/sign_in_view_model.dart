import 'package:firebase_auth/firebase_auth.dart';

import 'user_model.dart';

class SignInViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(email: userCredential.user?.email ?? '');
    } catch (e) {
      return null; // Handle sign-in error
    }
  }
}
