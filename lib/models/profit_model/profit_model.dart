
class ProfitModel {
  String date;
  String comments;
  double amount;

  ProfitModel({
    required this.date,
    required this.comments,
    required this.amount,
  });

  // Convert Profit Model to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'comments': comments,
      'amount': amount,
    };
  }

  // Factory method to create an Profit Model from Firestore document
  static ProfitModel fromMap(Map<String, dynamic> map) {
    return ProfitModel(
      date: map['date'],
      comments: map['comments'],
      amount: map['amount'].toDouble(),
    );
  }
}
