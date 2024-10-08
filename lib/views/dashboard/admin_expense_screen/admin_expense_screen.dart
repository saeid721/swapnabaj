import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/expense_controller/expense_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_text.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/admin_login_screen.dart';
import 'component/admin_expense_widget.dart';

class AdminExpenseScreen extends StatelessWidget {
  AdminExpenseScreen({super.key});

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
              Get.to(() => SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              GlobalContainer(
                backgroundColor: ColorRes.white,
                elevation: 1,
                width: Get.width,
                borderRadius: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalTextFormField(
                        controller: controller.selectExpenseDateCon,
                        titleText: 'Select Date',
                        hintText: "Select Date".tr,
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                        sufixIcon: GestureDetector(
                          onTap: () async {
                            var pickedDate = await showDateOnlyPicker(context);
                            if (pickedDate != null) {
                              controller.selectExpenseDateCon.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                            }
                          },
                          child: const Icon(Icons.calendar_today, color: ColorRes.textColor),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: controller.expenseCommentsCon,
                        titleText: 'Comments',
                        hintText: 'Enter Expense Comments',
                        decoration: inputDropDecoration,
                        maxLine: 2,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: controller.expenseAmountCon,
                        titleText: 'Amount',
                        hintText: 'Enter Expense Amount',
                        keyboardType: TextInputType.number,
                        decoration: borderDecoration,
                      ),
                      const SizedBox(height: 20),
                      GlobalButtonWidget(
                        str: 'Submit',
                        height: 45,
                        onTap: () {
                          controller.addExpanse();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GetBuilder<ExpenseController>(builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const GlobalText(
                      str: "Total Expense =",
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.textColor,
                    ),
                    GlobalText(
                      str: '৳ ${controller.totalExpenseAmount.toStringAsFixed(2)}',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.textColor,
                    ),
                  ],
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
