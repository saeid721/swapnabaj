import 'package:cloud_firestore/cloud_firestore.dart';

class InvestmentModel {
  String? id;
  String date;
  String comments;
  double amount;

  InvestmentModel({
    this.id,
    required this.date,
    required this.comments,
    required this.amount,
  });

  // Factory method to create an InvestmentModel from Firestore document
  factory InvestmentModel.fromJson(Map<String, dynamic> json, String id) {
    return InvestmentModel(
      id: id,
      date: json['date'] ?? '',
      comments: json['comments'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
    );
  }

  // Convert InvestmentModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'comments': comments,
      'amount': amount,
      'timestamp': FieldValue.serverTimestamp(), // For sorting
    };
  }
}
