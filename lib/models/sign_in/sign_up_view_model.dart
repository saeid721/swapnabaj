
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/sign_in/firebase_auth_service.dart';
import '../../views/dashboard/admin_login_screen/admin_login_screen.dart';
import 'user_model.dart';

class SignUpViewModel extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> signUp(String email, String password, String name, String role) async {
    try {
      isLoading.value = true;
      UserModel? user = await _authService.signUpWithEmailAndPassword(email, password, name, role);

      if (user != null) {
        Get.snackbar('Success', 'Account created successfully');
        // Navigate to home screen or desired screen
        Get.to(() => SignInScreen());
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', 'Sign in failed', backgroundColor: Colors.red.withOpacity(0.8),  colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logIn(String email, String password, String name, String role) async {
    try {
      isLoading.value = true;
      UserModel? user = await _authService.signInWithEmailAndPassword(email, password,);

      if (user != null) {
        Get.snackbar('Success', 'Account created successfully');
        // Navigate to home screen or desired screen
        Get.to(() => SignInScreen());
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', 'Sign in failed', backgroundColor: Colors.red.withOpacity(0.8),  colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}


