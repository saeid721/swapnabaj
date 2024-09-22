import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/date_time_formator.dart';
import '../../global_widget/global_button.dart';
import '../../global_widget/global_textform_field.dart';
import '../../global_widget/input_decoration.dart';
import '../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/admin_login_screen.dart';
import '../../global_widget/colors.dart';
import '../../global_widget/global_container.dart';
import 'component/admin_expense_widget.dart';

class AdminExpenseScreen extends StatefulWidget {
  const AdminExpenseScreen({super.key});

  @override
  State<AdminExpenseScreen> createState() => _AdminExpenseScreenState();
}

class _AdminExpenseScreenState extends State<AdminExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController selectDepositDateCon = TextEditingController();
    final TextEditingController expenseCommentsCon = TextEditingController();
    final TextEditingController expenseAmountCon = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.primaryColor),
        centerTitle: false,
        title: const Text(
          'Swapnobaj',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                GlobalContainer(
                  backgroundColor: ColorRes.white,
                  elevation: 1,
                  width: Get.width,
                  borderRadius: 8, // Adjust the width if needed
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalTextFormField(
                          controller: selectDepositDateCon,
                          titleText: 'Select Date',
                          hintText: "Select Date".tr,
                          titleStyle: const TextStyle(
                              color: ColorRes.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
                          isDense: true,
                          decoration: inputDropDecoration,
                          filled: true,
                          sufixIcon: GestureDetector(
                              onTap: () async {
                                var pickedDate =
                                    await showDateOnlyPicker(context);
                                setState(() {
                                  String formattedDate = DateTimeFormatter
                                      .showDateOnlyYear
                                      .format(pickedDate);
                                  selectDepositDateCon.text = formattedDate;
                                });
                              },
                              child: const Icon(Icons.calendar_month,
                                  color: ColorRes.textColor, size: 20)),
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: expenseCommentsCon,
                          titleText: 'Comments',
                          hintText: 'Enter Expense Comments',
                          decoration: borderDecoration,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: expenseAmountCon,
                          titleText: 'Amount',
                          hintText: 'Enter Expense Amount',
                          keyboardType: TextInputType.number,
                          decoration: borderDecoration,
                        ),
                        const SizedBox(height: 20),
                        GlobalButtonWidget(
                          str: 'Submit',
                          height: 45,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  width: Get.width,
                  child: const InvestTableWidget(
                    firstRow: 'SL',
                    secondRow: 'Date',
                    thirdRow: 'Comments',
                    fourRow: 'Amount',
                  ),
                ),
                GlobalContainer(
                  backgroundColor: ColorRes.white,
                  width: Get.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return const InvestTableValueWidget(
                        firstColumn: '001',
                        secondColumn: '10/09/2024',
                        thirdColumn: "ব্যাংক একাউন্ট খোলা বাবত খরচ",
                        fourColumn: '1,000',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
