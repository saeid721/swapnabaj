// // investment_model.dart
// class InvestmentModel {
//   final String date;
//   final String comments;
//   final double amount;
//
//   InvestmentModel({
//     required this.date,
//     required this.comments,
//     required this.amount,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'date': date,
//       'comments': comments,
//       'amount': amount,
//     };
//   }
//
//   static InvestmentModel fromMap(Map<String, dynamic> map) {
//     return InvestmentModel(
//       date: map['date'] ?? '',
//       comments: map['comments'] ?? '',
//       amount: (map['amount'] ?? 0).toDouble(),
//     );
//   }
// }
