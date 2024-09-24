import 'package:firebase_auth/firebase_auth.dart';
import '../../models/sign_in/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> signUpWithEmailAndPassword(
      String email,
      String password,
      String name,
      String role,
      ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        // Create user model
        UserModel newUser = UserModel(
          uid: user.uid,
          email: email,
          name: name,
          role: role,
        );
        return newUser;
      }
    } catch (e) {
      print("SignUp error: $e");
      rethrow;
    }
    return null;
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        // LogIn model
        UserModel loggedInUser = UserModel(
          uid: user.uid,
          email: email,
        );
        return loggedInUser;
      }
    } catch (e) {
      print("SignIn error: $e");
      rethrow; // You might want to handle errors differently
    }
    return null;
  }
}
