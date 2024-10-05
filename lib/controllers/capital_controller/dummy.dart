//
// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../models/capital_model/capital_model.dart';
//
// class CapitalController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final List<CapitalModel> capitalData = []; // List of CapitalModel
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
//       capitalData.addAll(snapshot.docs.map((doc) {
//         var data = doc.data();
//         return CapitalModel.fromMap(data); // Create CapitalModel from map
//       }));
//       update();
//     });
//   }
//
//   Future<void> updateCapitalData() async {
//     if (selectDepositorName == '0' || selectDepositPurpose == '0' ||
//         depositAmountCon.text.isEmpty || selectDepositDateCon.text.isEmpty) {
//       Get.snackbar('Error', 'All fields must be completed', colorText: Colors.red);
//       return;
//     }
//
//     try {
//       String date = selectDepositDateCon.text;
//       double? amount = double.tryParse(depositAmountCon.text);
//       if (amount == null || amount <= 0) {
//         Get.snackbar('Error', 'Please enter a valid amount', colorText: Colors.red);
//         return;
//       }
//
//       var existingEntryIndex = capitalData.indexWhere((element) => element.depositorName == selectDepositorName);
//       double newTotalAmount;
//
//       if (existingEntryIndex != -1) {
//         CapitalModel existingEntry = capitalData[existingEntryIndex];
//         newTotalAmount = existingEntry.totalAmount + amount;
//         existingEntry.updateAmount(amount); // Update the total amount
//
//         await _firestore.collection('capitalData').doc(selectDepositorName).update({
//           'date': date,
//           'amount': amount,
//           'totalAmount': newTotalAmount,
//         });
//       } else {
//         // Add new entry
//         newTotalAmount = amount; // Set total amount equal to amount for new entry
//
//         CapitalModel newEntry = CapitalModel(
//           date: date,
//           depositorName: selectDepositorName,
//           purpose: selectDepositPurpose,
//           amount: amount,
//           totalAmount: newTotalAmount, // Set total amount
//         );
//
//         capitalData.add(newEntry);
//         await _firestore.collection('capitalData').doc(selectDepositorName).set(newEntry.toMap());
//       }
//
//       update();
//       clearInputs();
//       Get.snackbar('Success', 'Deposit data saved successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to save data: ${e.toString()}', colorText: Colors.red);
//     }
//   }
//
//   double get totalCapitalAmount {
//     return capitalData.fold(0.0, (sum, item) => sum + item.totalAmount);
//   }
//
//   // Clear text field inputs
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
//
