// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../global_widget/colors.dart';
// import '../../../global_widget/global_button.dart';
// import '../../super_admin_panel/Super_admin_home_screen.dart';
// import '../../user_panel/bottom_navigation_bar/bottom_navigation.dart';
// import '../admin_home_screen/admin_home_screen.dart';
// import 'forget_password_screen.dart';
// import 'component/build_custom_text_field.dart';
// import 'component/custom_drop_down_form_field.dart';
//
// class SignInSignUpScreen extends StatefulWidget {
//   const SignInSignUpScreen({super.key});
//
//   @override
//   SignInSignUpScreenState createState() => SignInSignUpScreenState();
// }
//
// class SignInSignUpScreenState extends State<SignInSignUpScreen> with SingleTickerProviderStateMixin {
//   String? selectUserRole; // Nullable to handle no selection
//   late TabController _tabController;
//   bool rememberPassword = false; // Checkbox state
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // TabBar
//           Container(
//             height: 80,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFF007142), Color(0xFF35C147)],
//               ),
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TabBar(
//                   controller: _tabController,
//                   indicatorColor: Colors.white,
//                   labelColor: Colors.white,
//                   unselectedLabelColor: ColorRes.textColor,
//                   tabs: const [
//                     Tab(text: "Sign Up"),
//                     Tab(text: "Sign In"),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 buildSignUpForm(),
//                 buildSignInForm(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildSignUpForm() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: ListView(
//         children: [
//           const SizedBox(height: 20),
//           const Text(
//             "Create An Account",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           CustomDropDownFormField(
//             value: selectUserRole,
//             hintText: "Select User Role",
//             isDense: true,
//             filled: true,
//             items: const ["Member", "Admin", "Super Admin"],
//             sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
//             onChanged: (val) {
//               setState(() {
//                 selectUserRole = val!;
//               });
//             },
//           ),
//           buildCustomTextField("Full Name", Icons.person),
//           buildCustomTextField("Email", Icons.email),
//           buildCustomTextField("Password", Icons.lock, isPassword: true),
//           buildCustomTextField("Confirm Password", Icons.lock, isPassword: true),
//           const SizedBox(height: 20),
//           GlobalButtonWidget(
//             str: 'SIGN UP',
//             height: 45,
//             onTap: () {
//               if (selectUserRole == null || selectUserRole!.isEmpty) {
//                 Get.snackbar(
//                   "Error",
//                   "Please select a user role",
//                   backgroundColor: Colors.red,
//                   colorText: Colors.white,
//                 );
//               } else {
//                 // Add sign-up logic here
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildSignInForm() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: ListView(
//         children: [
//           const SizedBox(height: 20),
//           const Text(
//             "Welcome Back!",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 20),
//           buildCustomTextField("Email", Icons.email),
//           buildCustomTextField("Password", Icons.lock, isPassword: true),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Checkbox(
//                     value: rememberPassword,
//                     onChanged: (value) {
//                       setState(() {
//                         rememberPassword = value ?? false;
//                       });
//                     },
//                   ),
//                   const Text("Remember Password"),
//                 ],
//               ),
//               TextButton(
//                 onPressed: () {
//                   Get.to(() => AdminForgetPasswordScreen());
//                 },
//                 child: const Text("Forget Password?", style: TextStyle(color: Colors.red)),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           GlobalButtonWidget(
//             str: 'SIGN IN',
//             height: 45,
//             onTap: () {
//               if (selectUserRole == null || selectUserRole!.isEmpty) {
//                 Get.snackbar(
//                   "Error",
//                   "Please select a user role",
//                   backgroundColor: Colors.red,
//                   colorText: Colors.white,
//                 );
//               } else {
//                 // Navigate based on user role
//                 switch (selectUserRole) {
//                   case 'Member':
//                     Get.to(() => const BottomNavigation());
//                     break;
//                   case 'Admin':
//                     Get.to(() => const AdminHomeScreen());
//                     break;
//                   case 'Super Admin':
//                     Get.to(() => const SuperAdminHomeScreen());
//                     break;
//                   default:
//                     Get.snackbar(
//                       "Error",
//                       "Invalid user role selected",
//                       backgroundColor: Colors.red,
//                       colorText: Colors.white,
//                     );
//                 }
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
