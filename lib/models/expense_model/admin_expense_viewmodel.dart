// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'expense_model.dart';
//
// class AdminExpenseViewModel {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // Fetch expenses from Firestore and sort by date descending
//   Future<List<ExpenseModel>> fetchExpenses() async {
//     var snapshot = await _firestore
//         .collection('expenseData')
//         .orderBy('expenseDate', descending: true)
//         .get();
//
//     return snapshot.docs
//         .map((doc) => ExpenseModel.fromMap(doc.data(), doc.id))
//         .toList();
//   }
//
//   // Add a new expense
//   Future<void> addExpense(ExpenseModel expense) async {
//     await _firestore.collection('expenseData').add(expense.toMap());
//   }
//
//   // Calculate total expense amount
//   double calculateTotal(List<ExpenseModel> expenses) {
//     return expenses.fold(0.0, (total, exp) => total + exp.expenseAmount);
//   }
// }
