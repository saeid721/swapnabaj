import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/investment_model/investment_model.dart';

class InvestmentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<InvestmentModel> investData = [];
  double totalInvestAmount = 0.0;
  TextEditingController selectInvestDateCon = TextEditingController();
  TextEditingController investCommentsCon = TextEditingController();
  TextEditingController investAmountCon = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchInvestments(); // Fetch data when controller initializes
  }

  // Fetch investments from Firestore and sort by timestamp descending
  Future<void> fetchInvestments() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('investData')
          .orderBy('timestamp', descending: true)
          .get();

      List<InvestmentModel> investments = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return InvestmentModel.fromJson(data, doc.id);
      }).toList();

      investData = investments;
      calculateTotalAmount();
      update(); // Notify GetBuilder to rebuild UI
      log('Fetched ${investData.length} investments.');
    } catch (e) {
      log('Error fetching investments: $e');
      Get.snackbar('Error', 'Failed to fetch investments');
    }
  }

  // Calculate the total investment amount
  void calculateTotalAmount() {
    totalInvestAmount = investData.fold(0.0, (double sum, item) => sum + item.amount);
    update(); // Notify GetBuilder to rebuild UI
    log('Total Investment Amount: $totalInvestAmount');
  }

  // Add a new investment to Firestore
  Future<void> addInvestment() async {
    if (selectInvestDateCon.text.isNotEmpty &&
        investCommentsCon.text.isNotEmpty &&
        investAmountCon.text.isNotEmpty) {
      try {
        var newInvestment = InvestmentModel(
          date: selectInvestDateCon.text,
          comments: investCommentsCon.text,
          amount: double.parse(investAmountCon.text),
        );

        await _firestore.collection('investData').add(newInvestment.toJson());

        // Clear input fields
        selectInvestDateCon.clear();
        investCommentsCon.clear();
        investAmountCon.clear();

        // Refresh the investments list
        await fetchInvestments();
        log('Added new investment.');
      } catch (e) {
        log('Error adding investment: $e');
        Get.snackbar('Error', 'Failed to add investment');
      }
    } else {
      Get.snackbar('Error', 'All fields are required');
      log('Add Investment failed: Missing fields.');
    }
  }
}
