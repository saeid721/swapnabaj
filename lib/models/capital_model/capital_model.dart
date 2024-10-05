class CapitalModel {
  final String date;
  final String depositorName;
  final String purpose;
  final double amount;
  double _totalAmount; // Keep as private

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
      date: map['date'] ?? '', // Default to empty string if null
      depositorName: map['depositorName'] ?? '', // Default to empty string if null
      purpose: map['purpose'] ?? '', // Default to empty string if null
      amount: map['amount']?.toDouble() ?? 0.0, // Default to 0.0 if null
      totalAmount: map['totalAmount']?.toDouble() ?? 0.0, // Default to 0.0 if null
    );
  }
}
