import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/profit_model/profit_model.dart';

class ProfitController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, dynamic>> profitData = [];

  TextEditingController selectProfitDateCon = TextEditingController();
  TextEditingController profitCommentsCon = TextEditingController();
  TextEditingController profitAmountCon = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchProfitData(); // Fetch data when controller initializes
  }

  // Fetch Profit from Firestore and sort by date descending
  void fetchProfitData() {
    _firestore.collection('profitData').orderBy('date', descending: true).snapshots().listen((snapshot) {
      profitData.clear();
      profitData.addAll(snapshot.docs.map((doc) => doc.data()));
      update(); // Notify UI to update
    });
  }

  // Add a new Expanse to Firestore
  Future<void> addProfit() async {
    if (selectProfitDateCon.text.isEmpty || profitCommentsCon.text.isEmpty || profitAmountCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
      return;
    }

    try {
      var newProfit = ProfitModel(
        date: selectProfitDateCon.text,
        comments: profitCommentsCon.text,
        amount: double.parse(profitAmountCon.text),
      );

      await _firestore.collection('profitData').add(newProfit.toJson());

      // Clear input fields and notify success
      clearInputs();
      Get.snackbar('Success', 'Profit data saved successfully');
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data: $e', colorText: ColorRes.red);
    }
  }

  // Calculate the total deposit amount
  double get totalProfitAmount {
    return profitData.fold(0.0, (sum, item) {
      double amount = double.tryParse(item['amount'].toString()) ?? 0.0;
      return sum + amount;
    });
  }
  // Clear text field inputs
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
