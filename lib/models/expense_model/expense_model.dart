class ExpenseModel {
  String id;
  String date;
  String comments;
  double amount;

  ExpenseModel({
    required this.id,
    required this.date,
    required this.comments,
    required this.amount,
  });

  // Convert ExpenseModel to Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'comments': comments,
      'amount': amount,
    };
  }

  // Create an ExpenseModel from a Firebase document
  factory ExpenseModel.fromMap(String id, Map<String, dynamic> map) {
    return ExpenseModel(
      id: id,
      date: map['date'],
      comments: map['comments'],
      amount: map['amount'].toDouble(),
    );
  }
}
