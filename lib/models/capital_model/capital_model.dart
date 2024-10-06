class CapitalModel {
  final String memberId;
  final String date;
  final String depositorName;
  final String depositPurpose;
  final double amount;
  final double totalDepositAmount;

  CapitalModel({
    required this.memberId,
    required this.date,
    required this.depositorName,
    required this.depositPurpose,
    required this.amount,
    required this.totalDepositAmount,
  });

  factory CapitalModel.fromMap(Map<String, dynamic> map) {
    return CapitalModel(
      memberId: map['memberId'] ?? '',
      date: map['date'] ?? '',
      depositorName: map['depositorName'] ?? '',
      depositPurpose: map['depositPurpose'] ?? '',
      amount: double.tryParse(map['amount'].toString()) ?? 0.0,
      totalDepositAmount: double.tryParse(map['totalDepositAmount'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'memberId': memberId,
      'date': date,
      'depositorName': depositorName,
      'depositPurpose': depositPurpose,
      'amount': amount,
      'totalDepositAmount': totalDepositAmount,
    };
  }
}
