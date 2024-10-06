import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../models/capital_model/capital_model.dart';

class CapitalController extends GetxController {
  final selectDepositDateCon = TextEditingController();
  final depositAmountCon = TextEditingController();
  String? selectDepositorName;
  String? selectDepositPurpose;

  List<CapitalModel> capitalData = [];
  List<CapitalModel> depositEntries = [];
  double totalCapitalAmount = 0.0;

  @override
  void onInit() {
    super.onInit();
    fetchCapitalData();
    fetchDepositEntries();
  }

  // Fetch capital data from Firebase
  Future<void> fetchCapitalData() async {
    FirebaseFirestore.instance
        .collection('capitalData')
        .snapshots()
        .listen((event) {
      capitalData.clear();
      totalCapitalAmount = 0.0;

      for (var doc in event.docs) {
        // Fetch each document and store in the model
        var capitalModel = CapitalModel.fromMap(doc.data());

        // Add the capital data to the list
        capitalData.add(capitalModel);

        // Ensure that totalDepositAmount is properly added up
        totalCapitalAmount += capitalModel.totalDepositAmount;
      }

      update(); // Trigger UI update
    });
  }

  // Fetch individual deposit entries from Firebase
  Future<void> fetchDepositEntries() async {
    FirebaseFirestore.instance
        .collection('depositEntries')
        .orderBy('date', descending: true)
        .snapshots()
        .listen((event) {
      depositEntries.clear();
      for (var doc in event.docs) {
        var depositModel = CapitalModel.fromMap(doc.data());
        depositEntries.add(depositModel);
      }
      update(); // Update the UI
    });
  }

  Future<void> updateCapitalData() async {
    String memberId = selectDepositorName ?? '';
    double amount = double.tryParse(depositAmountCon.text) ?? 0.0;

    if (memberId.isEmpty || amount <= 0) {
      Get.snackbar('Error', 'Please select a depositor and enter a valid amount.');
      return;
    }

    var capitalCollection = FirebaseFirestore.instance.collection('capitalData');
    var docSnapshot = await capitalCollection.doc(memberId).get();

    if (docSnapshot.exists) {
      // Get the existing record and update totalDepositAmount
      double existingTotalDepositAmount = docSnapshot.data()?['totalDepositAmount'] ?? 0.0;
      await capitalCollection.doc(memberId).update({
        'totalDepositAmount': existingTotalDepositAmount + amount,
        'date': DateFormat('dd/MM/yyyy').format(DateTime.now()),
        'depositorName': selectDepositorName ?? '',
        'depositPurpose': selectDepositPurpose ?? '',
      });
    } else {
      // Create a new document if no record exists
      await capitalCollection.doc(memberId).set({
        'memberId': memberId,
        'totalDepositAmount': amount,
        'date': DateFormat('dd/MM/yyyy').format(DateTime.now()),
        'depositorName': selectDepositorName ?? '',
        'depositPurpose': selectDepositPurpose ?? '',
      });
    }

    // Add to depositEntries collection
    await FirebaseFirestore.instance.collection('depositEntries').add({
      'memberId': memberId,
      'amount': amount,
      'date': DateFormat('dd/MM/yyyy').format(DateTime.now()),
      'depositorName': selectDepositorName ?? '',
      'depositPurpose': selectDepositPurpose ?? '',
    });

    // Clear the form after submission
    selectDepositDateCon.clear();
    depositAmountCon.clear();
    selectDepositorName = null;
    selectDepositPurpose = null;
    update();
  }
}
