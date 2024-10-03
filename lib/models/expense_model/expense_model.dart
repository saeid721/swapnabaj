
class ExpenseModel {
  String date;
  String comments;
  double amount;

  ExpenseModel({
    required this.date,
    required this.comments,
    required this.amount,
  });

  // Convert InvestModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'comments': comments,
      'amount': amount,
    };
  }

  // Factory method to create an InvestModel from Firestore document
  static ExpenseModel fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      date: map['date'],
      comments: map['comments'],
      amount: map['amount'].toDouble(),
    );
  }
}
