import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/capital_model/capital_model.dart';

class CapitalController extends GetxController {
  final selectDepositDateCon = TextEditingController();
  final depositAmountCon = TextEditingController();
  String? selectDepositorName;
  String? selectDepositPurpose;
  String? selectedMemberId;

  // Map for static memberId values
  final Map<String, String> depositorToMemberId = {
    "Atiqur Rahman": "1",
    "Shamim Hosen": "2",
    "Md. Taimur Rahman": "3",
    "Md. Shohel Rana": "4",
    "Md.Shakhawat Hossen": "5",
    "Abdullah Al Kafi": "6",
    "Taslima Akter Rupa": "7",
    "Minhazul Islam Saeid": "8",
    "Dipok Kumar": "9",
    "Md. Asif": "10",
    "Md. Amirul Islam": "11",
    "Shoriful Islam": "12",
    "Konkor Chandra Modok": "13",
    "Belayet Hossain": "14",
    "Md. Samsul Alom": "15",
    "Ismail Hossain": "16",
  };

  List<CapitalModel> capitalData = [];
  List<CapitalModel> depositEntries = [];
  double totalCapitalAmount = 0.0;

  @override
  void onInit() {
    super.onInit();
    fetchCapitalData(); // Fetch capital data
    fetchDepositEntries(); // Fetch deposit entries
  }

  // Fetch capital data from Firebase
  Future<void> fetchCapitalData() async {
    FirebaseFirestore.instance.collection('capitalData').orderBy('memberId', descending: false).snapshots().listen((event) {
      capitalData.clear();
      totalCapitalAmount = 0.0;

      for (var doc in event.docs) {
        var capitalModel = CapitalModel.fromMap(doc.data());
        capitalData.add(capitalModel);
        totalCapitalAmount += capitalModel.totalDepositAmount;
      }
      update(); // Trigger UI update
    });
  }

  // Fetch individual deposit entries from Firebase
  Future<void> fetchDepositEntries() async {
    FirebaseFirestore.instance.collection('depositEntries').orderBy('date', descending: true).snapshots().listen((event) {
      depositEntries.clear();
      for (var doc in event.docs) {
        var depositModel = CapitalModel.fromMap(doc.data());
        depositEntries.add(depositModel);
      }
      update(); // Update the UI
    });
  }

  // Add a new Deposit to Firestore
  Future<void> addCapitalData() async {
    try {
      if (selectDepositDateCon.text.isEmpty || selectDepositorName == null || selectDepositPurpose == null || depositAmountCon.text.isEmpty) {
        Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
        return;
      }

      // Ensure memberId is assigned based on the depositor name
      String memberId = depositorToMemberId[selectDepositorName] ?? '';
      double amount = double.tryParse(depositAmountCon.text) ?? 0.0;

      if (memberId.isEmpty || amount <= 0) {
        Get.snackbar('Error', 'Please select a depositor and enter a valid amount.', colorText: ColorRes.red);
        return;
      }

      var capitalCollection = FirebaseFirestore.instance.collection('capitalData');
      var docSnapshot = await capitalCollection.doc(memberId).get();

      if (docSnapshot.exists) {
        // Update the total deposit amount for the existing record
        double existingTotalDepositAmount = docSnapshot.data()?['totalDepositAmount'] ?? 0.0;
        await capitalCollection.doc(memberId).update({
          'totalDepositAmount': existingTotalDepositAmount + amount,
          'date': selectDepositDateCon.text,
          'depositorName': selectDepositorName ?? '',
          'depositPurpose': selectDepositPurpose ?? '',
        });
      } else {
        // Create a new document if no record exists
        await capitalCollection.doc(memberId).set({
          'memberId': memberId,
          'totalDepositAmount': amount,
          'date': selectDepositDateCon.text,
          'depositorName': selectDepositorName ?? '',
          'depositPurpose': selectDepositPurpose ?? '',
        });
      }

      // Add to depositEntries collection
      await FirebaseFirestore.instance.collection('depositEntries').add({
        'memberId': memberId,
        'amount': amount,
        'date': selectDepositDateCon.text,
        'depositorName': selectDepositorName ?? '',
        'depositPurpose': selectDepositPurpose ?? '',
      });

      // Clear input fields and notify success
      clearInputs();
      Get.snackbar('Success', 'Deposit data saved successfully');
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data: $e', colorText: ColorRes.red);
    }
  }


  // Clear the form after submission
  void clearInputs() {
    selectDepositDateCon.clear();
    depositAmountCon.clear();
    selectDepositorName = null;
    selectDepositPurpose = null;
    selectedMemberId = null; // Clear the memberId after submission
    update();
  }

  @override
  void dispose() {
    selectDepositDateCon.dispose();
    depositAmountCon.dispose();
    super.dispose();
  }
}
