

class CapitalModel {
  final String date;
  final String depositorName;
  final String purpose;
  double _amount; // Keep as private

  CapitalModel({
    required this.date,
    required this.depositorName,
    required this.purpose,
    required double amount,
  }) : _amount = amount;

  double get amount => _amount; // Getter for amount

  void updateAmount(double newAmount) {
    _amount += newAmount; // Method to update amount
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'depositorName': depositorName,
      'purpose': purpose,
      'amount': _amount,
    };
  }

  static CapitalModel fromMap(Map<String, dynamic> map) {
    return CapitalModel(
      date: map['date'],
      depositorName: map['depositorName'],
      purpose: map['purpose'],
      amount: map['amount'].toDouble(),
    );
  }
}