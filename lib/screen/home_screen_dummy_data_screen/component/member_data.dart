import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widget/colors.dart';

class MemberData {
  final String sl, name, percent, deposit, profit, balance;

  MemberData({
    required this.sl,
    required this.name,
    required this.percent,
    required this.deposit,
    required this.profit,
    required this.balance,
  });
}

final NumberFormat currencyFormat = NumberFormat('#,##,##0.00', 'en_US');

final List<MemberData> members = [
  MemberData(
    sl: '01',
    name: 'Mr. Mizan',
    percent: '1',
    deposit: '68,500',
    profit: '13,951',
    balance: '82,451',
  ),
  MemberData(
    sl: '02',
    name: 'Mr. Rasu',
    percent: '1',
    deposit: '67,500',
    profit: '13,951',
    balance: '80,951',
  ),
  MemberData(
    sl: '03',
    name: 'Mr. Sopon',
    percent: '1',
    deposit: '64,000',
    profit: '13,951',
    balance: '77,951',
  ),
  MemberData(
    sl: '04',
    name: 'Mr. Shahin',
    percent: '2',
    deposit: '1,13,000',
    profit: '27,903',
    balance: '1,50,903',
  ),
  MemberData(
    sl: '05',
    name: 'Mr. Aminul',
    percent: '1',
    deposit: '70,000',
    profit: '13,951',
    balance: '83,951',
  ),
  MemberData(
    sl: '06',
    name: 'Mr. Jibon',
    percent: '1',
    deposit: '50,500',
    profit: '13,951',
    balance: '64,451',
  ),
  MemberData(
    sl: '07',
    name: 'Mr. Asik',
    percent: '3',
    deposit: '2,05,500',
    profit: '68,500',
    balance: '2,04,354',
  ),
  MemberData(
    sl: '08',
    name: 'Mr. Saeid',
    percent: '1',
    deposit: '64,000',
    profit: '13,951',
    balance: '77,951',
  ),
  MemberData(
    sl: '09',
    name: 'Mr. Asadul',
    percent: '2',
    deposit: '1,04,000',
    profit: '27,903',
    balance: '1,31,903',
  ),
  MemberData(
    sl: '10',
    name: 'Mr. Sanjit',
    percent: '1',
    deposit: '65,000',
    profit: '13,951',
    balance: '79,451',
  ),
];

const double totalCapital = 882000.00;
const double totalProfit = 194780.00;
const double totalInvest = 920000.00;
const double totalExpense = 11074.00;

double get currentBalance =>
    (totalCapital + totalProfit) - (totalInvest + totalExpense);
double get netBalance => (totalCapital + totalProfit) - totalExpense;

List<PieChartSectionData> buildPieChartSections() {
  double total =
      totalCapital + totalProfit + totalInvest + totalExpense + currentBalance;

  return [
    PieChartSectionData(
      color: ColorRes.primaryColor,
      value: totalCapital / total * 100,
      title: '',
      radius: 50,
    ),
    PieChartSectionData(
      color: ColorRes.green,
      value: totalProfit / total * 100,
      title: '',
      radius: 50,
    ),
    PieChartSectionData(
      color: Colors.orange,
      value: totalInvest / total * 100,
      title: '',
      radius: 50,
    ),
    PieChartSectionData(
      color: ColorRes.red,
      value: totalExpense / total * 100,
      title: '',
      radius: 50,
    ),
    PieChartSectionData(
      color: ColorRes.balck,
      value: currentBalance / total * 100,
      title: '',
      radius: 50,
    ),
  ];
}
