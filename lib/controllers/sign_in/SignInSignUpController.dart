// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
//
// class SignInSignUpController extends GetxController {
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   String? selectUserRole;
//   bool rememberPassword = false;
//
//   void selectUserRoleChanged(String? value) {
//     selectUserRole = value;
//   }
//
//   void rememberPasswordChanged(bool? value) {
//     rememberPassword = value ?? false;
//   }
//
//   void signUp() {
//     if (selectUserRole == null) {
//       Get.snackbar("Error", "Please select a user role");
//     } else {
//       // Implement Firebase sign-up logic here
//       Get.snackbar("Success", "User registered successfully");
//     }
//   }
//
//   void signIn() {
//     // Implement Firebase sign-in logic here
//     Get.snackbar("Success", "User signed in successfully");
//   }
// }
