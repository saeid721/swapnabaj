import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/investment_model/investment_model.dart';

class InvestmentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, dynamic>> investData = [];

  TextEditingController selectInvestDateCon = TextEditingController();
  TextEditingController investCommentsCon = TextEditingController();
  TextEditingController investAmountCon = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchInvestData(); // Fetch data when controller initializes
  }

  // Fetch investments from Firestore and sort by timestamp descending
  void fetchInvestData() {
    _firestore.collection('investData').orderBy('date', descending: true).snapshots().listen((snapshot) {
      investData.clear();
      investData.addAll(snapshot.docs.map((doc) => doc.data()));
      update(); // Notify UI to update
    });
  }

  // Add a new investment to Firestore
  Future<void> addInvestment() async {
    if (selectInvestDateCon.text.isEmpty || investCommentsCon.text.isEmpty || investAmountCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
      return;
    }

    try {
      var newInvestment = InvestModel(
        date: selectInvestDateCon.text,
        comments: investCommentsCon.text,
        amount: double.parse(investAmountCon.text),
      );

      await _firestore.collection('investData').add(newInvestment.toJson());

      // Clear input fields and notify success
      clearInputs();
      Get.snackbar('Success', 'Invest data saved successfully');
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data: $e', colorText: ColorRes.red);
    }
  }

  // Calculate the total deposit amount
  double get totalInvestAmount {
    return investData.fold(0.0, (sum, item) => sum + (item['amount'] ?? 0.0));
  }

  // Clear text field inputs
  void clearInputs() {
    selectInvestDateCon.clear();
    investCommentsCon.clear();
    investAmountCon.clear();
    update();
  }

  @override
  void dispose() {
    selectInvestDateCon.dispose();
    investCommentsCon.dispose();
    investAmountCon.dispose();
    super.dispose();
  }
}
