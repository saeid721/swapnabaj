
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../controllers/capital_controller/capital_controller.dart';
import '../../../controllers/expense_controller/expense_controller.dart';
import '../../../controllers/investment_controller/investment_controller.dart';
import '../../../controllers/profit_controller/profit_controller.dart';
import '../../../global_widget/colors.dart';

List<PieChartSectionData> buildPieChartSections() {
  final CapitalController capitalController = Get.find();
  final ProfitController profitController = Get.find();
  final InvestmentController investmentController = Get.find();
  final ExpenseController expenseController = Get.find();

  // Get the total values from the controllers
  double capital = capitalController.totalCapitalAmount;
  double profit = profitController.totalProfitAmount;
  double invest = investmentController.totalInvestAmount;
  double expense = expenseController.totalExpenseAmount;

  double currentBalance = capital + profit - (invest + expense);
  double total = capital + profit + invest + expense + currentBalance;

  // Check to avoid division by zero
  if (total == 0) {
    return [];
  }

  return [
    PieChartSectionData(
      color: ColorRes.capitalColor,
      value: capital / total * 100,
      title: '',
      radius: 50,
    ),
    PieChartSectionData(
      color: ColorRes.profitColor,
      value: profit / total * 100,
      title: '',
      radius: 50,
    ),
    PieChartSectionData(
      color: ColorRes.investColor,
      value: invest / total * 100,
      title: '',
      radius: 50,
    ),
    PieChartSectionData(
      color: ColorRes.expenseColor,
      value: expense / total * 100,
      title: '',
      radius: 50,
    ),
    PieChartSectionData(
      color: ColorRes.green,
      value: currentBalance / total * 100,
      title: '',
      radius: 50,
    ),
  ];
}