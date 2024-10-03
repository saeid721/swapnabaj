import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfitController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, dynamic>> profitData = [];

  final TextEditingController selectProfitDateCon = TextEditingController();
  final TextEditingController profitCommentsCon = TextEditingController();
  final TextEditingController profitAmountCon = TextEditingController();

  String selectDepositorName = '0';
  String selectDepositPurpose = '0';

  @override
  void onInit() {
    super.onInit();
    fetchCapitalData();
  }

  void fetchCapitalData() {
    _firestore.collection('profitData').snapshots().listen((snapshot) {
      profitData.clear();
      profitData.addAll(snapshot.docs.map((doc) => doc.data()));
      update();
    });
  }

  Future<void> addOrUpdateProfitData() async {
    // Change the condition to check for empty fields correctly
    if (profitCommentsCon.text.isEmpty || profitAmountCon.text.isEmpty || selectProfitDateCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed');
      return;
    }

    try {
      String date = selectProfitDateCon.text;
      String comments = profitCommentsCon.text;
      String amount = profitAmountCon.text;

      var existingEntryIndex = profitData.indexWhere((element) => element['depositorName'] == selectDepositorName);

      if (existingEntryIndex != -1) {
        // Update existing entry
        double existingAmount = double.parse(profitData[existingEntryIndex]['amount']);
        double newAmount = existingAmount + double.parse(amount);
        profitData[existingEntryIndex]['amount'] = newAmount.toString();
        profitData[existingEntryIndex]['date'] = date;

        await _firestore.collection('profitData').doc(selectDepositorName).update({
          'amount': newAmount.toString(),
          'date': date,
        });
      } else {
        // Add new entry
        Map<String, dynamic> newEntry = {
          'id': (profitData.length + 1).toString(),
          'date': date,
          'comments': comments,
          'amount': amount,
        };
        profitData.add(newEntry);

        await _firestore.collection('profitData').doc(selectDepositorName).set(newEntry);
      }

      update();
      clearInputs();
      Get.snackbar('Success', 'Profit data saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Calculate the total profit amount
  double get totalProfitAmount {
    return profitData.fold(0.0, (sum, item) => sum + double.parse(item['amount']));
  }

  void clearInputs() {
    selectProfitDateCon.clear();
    profitCommentsCon.clear();
    profitAmountCon.clear();
    update();
  }

  @override
  void dispose() {
    selectProfitDateCon.dispose();
    profitCommentsCon.dispose();
    profitAmountCon.dispose();
    super.dispose();
  }
}
