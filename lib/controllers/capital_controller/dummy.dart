//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../global_widget/colors.dart';
//
// class CapitalController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final List<Map<String, dynamic>> capitalData = [];
//
//   final TextEditingController selectDepositDateCon = TextEditingController();
//   final TextEditingController depositAmountCon = TextEditingController();
//   String selectDepositorName = '0';
//   String selectDepositPurpose = '0';
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchCapitalData();
//   }
//
//   void fetchCapitalData() {
//     _firestore.collection('capitalData').snapshots().listen((snapshot) {
//       capitalData.clear();
//       capitalData.addAll(snapshot.docs.map((doc) => doc.data()));
//       update();
//     });
//   }
//
//   Future<void> updateCapitalData() async {
//     if (selectDepositorName == '0' || selectDepositPurpose == '0' || depositAmountCon.text.isEmpty || selectDepositDateCon.text.isEmpty) {
//       Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
//       return;
//     }
//
//     try {
//       String date = selectDepositDateCon.text;
//       String amount = depositAmountCon.text;
//
//       var existingEntryIndex = capitalData.indexWhere((element) => element['depositorName'] == selectDepositorName);
//
//       if (existingEntryIndex != -1) {
//         // Update existing entry
//         double existingAmount = double.parse(capitalData[existingEntryIndex]['amount']);
//         double newAmount = existingAmount + double.parse(amount);
//         capitalData[existingEntryIndex]['amount'] = newAmount.toString();
//         capitalData[existingEntryIndex]['date'] = date;
//
//         await _firestore.collection('capitalData').doc(selectDepositorName).update({
//           'amount': newAmount.toString(),
//           'date': date,
//         });
//       } else {
//         // Add new entry
//         Map<String, dynamic> newEntry = {
//           'date': date,
//           'depositorName': selectDepositorName,
//           'depositPurpose': selectDepositPurpose,
//           'amount': amount,
//         };
//         capitalData.add(newEntry);
//
//         await _firestore.collection('capitalData').doc(selectDepositorName).set(newEntry);
//       }
//
//       update();
//       clearInputs();
//       Get.snackbar('Success', 'Deposit data saved successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to save data: $e', colorText: ColorRes.red);
//     }
//   }
//
//   // Calculate the total Capital amount
//   double get totalCapitalAmount {
//     return capitalData.fold(0.0, (sum, item) {
//       double amount = double.tryParse(item['amount'].toString()) ?? 0.0;
//       return sum + amount;
//     });
//   }
//
//   void clearInputs() {
//     selectDepositDateCon.clear();
//     depositAmountCon.clear();
//     selectDepositorName = '0';
//     selectDepositPurpose = '0';
//     update();
//   }
//
//   @override
//   void dispose() {
//     selectDepositDateCon.dispose();
//     depositAmountCon.dispose();
//     super.dispose();
//   }
// }