import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CapitalController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, dynamic>> capitalData = [];
  final TextEditingController selectDepositDateCon = TextEditingController();
  final TextEditingController depositAmountCon = TextEditingController();
  String selectDepositorName = '0';
  String selectDepositPurpose = '0';

  @override
  void onInit() {
    super.onInit();
    fetchCapitalData();
  }

  void fetchCapitalData() {
    _firestore.collection('capitalData').snapshots().listen((snapshot) {
      capitalData.clear();
      capitalData.addAll(snapshot.docs.map((doc) => doc.data()));
      update();
    });
  }

  Future<void> addOrUpdateCapitalData() async {
    if (selectDepositorName == '0' || selectDepositPurpose == '0' || depositAmountCon.text.isEmpty || selectDepositDateCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      String date = selectDepositDateCon.text;
      String amount = depositAmountCon.text;

      var existingEntryIndex = capitalData.indexWhere((element) => element['depositorName'] == selectDepositorName);

      if (existingEntryIndex != -1) {
        capitalData[existingEntryIndex]['amount'] =
            (double.parse(capitalData[existingEntryIndex]['amount']) + double.parse(amount)).toString();
        capitalData[existingEntryIndex]['date'] = date;

        await _firestore.collection('capitalData').doc(selectDepositorName).update({
          'amount': capitalData[existingEntryIndex]['amount'],
          'date': date,
        });
      } else {
        Map<String, dynamic> newEntry = {
          'id': (capitalData.length + 1).toString(),
          'date': date,
          'depositorName': selectDepositorName,
          'depositPurpose': selectDepositPurpose,
          'amount': amount,
        };
        capitalData.add(newEntry);

        await _firestore.collection('capitalData').doc(selectDepositorName).set(newEntry);
      }

      update();
      clearInputs();
      Get.snackbar('Success', 'Deposit data saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data: $e',);
    }
  }

  void clearInputs() {
    selectDepositDateCon.clear();
    depositAmountCon.clear();
    selectDepositorName = '0';
    selectDepositPurpose = '0';
    update();
  }

  @override
  void dispose() {
    selectDepositDateCon.dispose();
    depositAmountCon.dispose();
    super.dispose();
  }
}
