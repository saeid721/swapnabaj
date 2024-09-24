// import 'package:get/get.dart';
//
// import '../../services/sign_in/firebase_auth_service.dart';
//
// class ForgetPasswordViewModel extends GetxController {
//   final FirebaseAuthService _authService = FirebaseAuthService();
//   var isLoading = false.obs;
//
//   Future<void> resetPassword(String email) async {
//     if (email.isNotEmpty) {
//       try {
//         isLoading.value = true;
//         await _authService.resetPassword(email);
//         isLoading.value = false;
//         Get.snackbar('Success', 'Password reset link sent to your email.');
//       } catch (e) {
//         isLoading.value = false;
//         Get.snackbar('Error', e.toString());
//       }
//     } else {
//       Get.snackbar('Error', 'Email is required');
//     }
//   }
// }
