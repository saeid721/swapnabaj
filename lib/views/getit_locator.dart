import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/capital_controller/capital_controller.dart';
import '../controllers/expense_controller/expense_controller.dart';
import '../controllers/investment_controller/investment_controller.dart';
import '../controllers/profit_controller/profit_controller.dart';

final locator = GetIt.instance;

Future init(SharedPreferences prefs) async {

  Get.put(CapitalController());
  Get.put(ProfitController());
  Get.put(InvestmentController());
  Get.put(ExpenseController());

}
