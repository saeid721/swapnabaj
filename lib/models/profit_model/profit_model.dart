class ProfitModel {
  final String date;
  final String comments;
  double amount;

  ProfitModel({
    required this.date,
    required this.comments,
    required this.amount,
  });

  double get amounts => amount;

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'comments': comments,
      'amount': amount,
    };
  }

  static ProfitModel fromMap(Map<String, dynamic> map) {
    return ProfitModel(
      date: map['date'],
      comments: map['comments'],
      amount: map['amount'].toDouble(),
    );
  }
}
