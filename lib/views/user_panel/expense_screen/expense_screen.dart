import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/expense_controller/expense_controller.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_text.dart';
import '../side_menu_screen.dart';
import 'component/expense_widget.dart';

class ExpenseScreen extends StatelessWidget {
  ExpenseScreen({super.key});

  final ExpenseController controller = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.primaryColor),
        centerTitle: true,
        title: const Text(
          'Expense',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() =>  SignInScreen());
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      drawer: const SideMenuScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              GetBuilder<ExpenseController>(builder: (controller) {
                return GlobalContainer(
                  backgroundColor: ColorRes.white,
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
                  bottomBorderColor: ColorRes.borderColor,
                  borderCornerRadius: const BorderRadius.all(Radius.circular(5)),
                  elevation: 2,
                  height: 40,
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const GlobalText(
                        str: "Total Expense =",
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textColor,
                      ),
                      GlobalText(
                        str: '৳ ${controller.totalExpenseAmount.toStringAsFixed(2)}',
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textColor,
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 10),
              GlobalContainer(
                backgroundColor: ColorRes.backgroundColor,
                width: Get.width,
                child: const ExpenseTableWidget(
                  firstRow: 'SL',
                  secondRow: 'Date',
                  thirdRow: 'Comments',
                  fourRow: 'Amount',
                ),
              ),
              GetBuilder<ExpenseController>(builder: (controller) {
                if (controller.expenseData.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Expense Found',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                }
                return GlobalContainer(
                  backgroundColor: ColorRes.white,
                  width: Get.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.expenseData.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      final expense = controller.expenseData[index];
                      double amount = 0.0;
                      if (expense['amount'] != null) {
                        amount = double.tryParse(expense['amount'].toString()) ?? 0.0;
                      }

                      return ExpenseTableValueWidget(
                        firstColumn: (index + 1).toString(),
                        secondColumn: expense['date'] ?? '',
                        thirdColumn: expense['comments'] ?? '',
                        fourColumn: amount.toStringAsFixed(2),
                      );
                    },
                  ),
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
