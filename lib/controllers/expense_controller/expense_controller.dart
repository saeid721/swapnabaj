import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/expense_model/expense_model.dart';

class ExpenseController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final List<ExpenseModel> expenseData = []; // List of ExpenseModel objects

  TextEditingController selectExpenseDateCon = TextEditingController();
  TextEditingController expenseCommentsCon = TextEditingController();
  TextEditingController expenseAmountCon = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchExpenses(); // Fetch initial data when the controller is initialized
  }

  // Fetch expenses from Firebase and sort them by date
  void fetchExpenses() {
    firestore.collection('expenseData').orderBy('date', descending: true).snapshots().listen((snapshot) {
      expenseData.clear(); // Clear the list before adding new data
      for (var doc in snapshot.docs) {
        expenseData.add(ExpenseModel.fromMap(doc.id, doc.data()));
      }
      update(); // Notify the UI that the data has changed
    });
  }

  // Add new expense to Firebase
  Future<void> addExpense() async {
    try {
      String date = selectExpenseDateCon.text;
      String comments = expenseCommentsCon.text;
      double amount = double.parse(expenseAmountCon.text);

      ExpenseModel newExpense = ExpenseModel(
        id: '', // Firebase will generate an ID
        date: date,
        comments: comments,
        amount: amount,
      );

      await firestore.collection('expenseData').add(newExpense.toMap());

      // Clear the form after submission
      selectExpenseDateCon.clear();
      expenseCommentsCon.clear();
      expenseAmountCon.clear();

      // Fetch the updated list of expenses after adding a new one
      fetchExpenses();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add expense: $e');
    }
  }

  // Calculate the total expense amount
  double get totalExpenseAmount {
    return expenseData.fold(0.0, (sum, item) => sum + item.amount);
  }
}
