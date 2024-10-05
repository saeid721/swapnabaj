class CapitalModel {
  final String date;
  final String depositorName;
  final String purpose;
  final double amount;
  double _totalAmount;

  CapitalModel({
    required this.date,
    required this.depositorName,
    required this.purpose,
    required this.amount,
    required double totalAmount,
  }) : _totalAmount = totalAmount;

  double get totalAmount => _totalAmount; // Getter for totalAmount

  void updateAmount(double newAmount) {
    _totalAmount += newAmount; // Method to update total amount
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'depositorName': depositorName,
      'purpose': purpose,
      'amount': amount, // Use amount directly
      'totalAmount': _totalAmount, // Include totalAmount in the map
    };
  }

  static CapitalModel fromMap(Map<String, dynamic> map) {
    return CapitalModel(
      date: map['date'] ?? '',
      depositorName: map['depositorName'] ?? '',
      purpose: map['purpose'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      totalAmount: map['totalAmount']?.toDouble() ?? 0.0,
    );
  }
}
