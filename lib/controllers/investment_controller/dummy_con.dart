// // investment_controller.dart
// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../models/investment_model/dummy_model.dart';
//
// class InvestmentController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final List<InvestmentModel> investData = [];
//   double totalInvestAmount = 0.0;
//   final selectInvestDateCon = TextEditingController();
//   final investCommentsCon = TextEditingController();
//   final investAmountCon = TextEditingController();
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchInvestmentData();
//   }
//
//   void fetchInvestmentData() {
//     _firestore.collection('investData').snapshots().listen((snapshot) {
//       investData.clear();
//       investData.addAll(snapshot.docs.map((doc) => InvestmentModel.fromMap(doc.data() as Map<String, dynamic>)));
//       calculateTotalAmount();
//     });
//   }
//
//   Future<void> addOrUpdateInvestmentData() async {
//     String date = selectInvestDateCon.text;
//     String comments = investCommentsCon.text;
//     String amountText = investAmountCon.text;
//
//     if (date.isEmpty || comments.isEmpty || amountText.isEmpty) {
//       Get.snackbar('Error', 'All fields must be completed', snackPosition: SnackPosition.BOTTOM);
//       return;
//     }
//
//     try {
//       double amount = double.parse(amountText);
//       Map<String, dynamic> newEntry = {
//         'date': date,
//         'comments': comments,
//         'amount': amount,
//       };
//
//       await _firestore.collection('investData').add(newEntry);
//       clearInputs();
//       Get.snackbar('Success', 'Investment data saved successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to save data: $e', snackPosition: SnackPosition.BOTTOM);
//     }
//   }
//
//   void calculateTotalAmount() {
//     totalInvestAmount = investData.fold(0.0, (sum, item) => sum + item.amount);
//     update();
//     log('Total Investment Amount: $totalInvestAmount');
//   }
//
//   void clearInputs() {
//     selectInvestDateCon.clear();
//     investCommentsCon.clear();
//     investAmountCon.clear();
//   }
//
//   @override
//   void dispose() {
//     selectInvestDateCon.dispose();
//     investCommentsCon.dispose();
//     investAmountCon.dispose();
//     super.dispose();
//   }
// }
