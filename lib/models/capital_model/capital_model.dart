class CapitalModel {
  final String depositorName;
  final String depositPurpose;
  final double amount;
  final String date;

  CapitalModel({
    required this.depositorName,
    required this.depositPurpose,
    required this.amount,
    required this.date,
  });

  factory CapitalModel.fromMap(Map<String, dynamic> map) {
    return CapitalModel(
      depositorName: map['depositorName'] ?? '',
      depositPurpose: map['depositPurpose'] ?? '',
      amount: double.tryParse(map['amount'].toString()) ?? 0.0,
      date: map['date'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'depositorName': depositorName,
      'depositPurpose': depositPurpose,
      'amount': amount,
      'date': date,
    };
  }
}
