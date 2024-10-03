import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/expense_model/expense_model.dart';

class ExpenseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, dynamic>> expenseData = [];

  TextEditingController selectExpenseDateCon = TextEditingController();
  TextEditingController expenseCommentsCon = TextEditingController();
  TextEditingController expenseAmountCon = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchExpenseData(); // Fetch data when controller initializes
  }

  // Fetch investments from Firestore and sort by timestamp descending
  void fetchExpenseData() {
    _firestore.collection('expenseData').orderBy('date', descending: true).snapshots().listen((snapshot) {
      expenseData.clear();
      expenseData.addAll(snapshot.docs.map((doc) => doc.data()));
      update(); // Notify UI to update
    });
  }

  // Add a new Expanse to Firestore
  Future<void> addExpanse() async {
    if (selectExpenseDateCon.text.isEmpty || expenseCommentsCon.text.isEmpty || expenseAmountCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
      return;
    }

    try {
      var newExpense = ExpenseModel(
        date: selectExpenseDateCon.text,
        comments: expenseCommentsCon.text,
        amount: double.parse(expenseAmountCon.text),
      );

      await _firestore.collection('expenseData').add(newExpense.toJson());

      // Clear input fields and notify success
      clearInputs();
      Get.snackbar('Success', 'Expense data saved successfully');
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data: $e', colorText: ColorRes.red);
    }
  }

  // Calculate the total deposit amount
  double get totalExpenseAmount {
    return expenseData.fold(0.0, (sum, item) => sum + (item['amount'] ?? 0.0));
  }

  // Clear text field inputs
  void clearInputs() {
    selectExpenseDateCon.clear();
    expenseCommentsCon.clear();
    expenseAmountCon.clear();
    update();
  }

  @override
  void dispose() {
    selectExpenseDateCon.dispose();
    expenseCommentsCon.dispose();
    expenseAmountCon.dispose();
    super.dispose();
  }
}
