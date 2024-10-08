import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/investment_controller/investment_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/date_time_formator.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_text.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/admin_login_screen.dart';
import 'component/admin_invest_widget.dart';

class AdminInvestScreen extends StatelessWidget {
  AdminInvestScreen({super.key});

  final InvestmentController controller = Get.put(InvestmentController());

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
          'Invest',
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              GlobalContainer(
                backgroundColor: ColorRes.white,
                elevation: 1,
                width: Get.width,
                borderRadius: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GlobalTextFormField(
                        controller: controller.selectInvestDateCon,
                        titleText: 'Select Date',
                        hintText: "Select Date".tr,
                        keyboardType: TextInputType.datetime,
                        titleStyle: const TextStyle(color: ColorRes.textColor, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                        sufixIcon: GestureDetector(
                            onTap: () async {
                              var pickedDate = await showDateOnlyPicker(context);
                              if (pickedDate != null) {
                                String formattedDate = DateTimeFormatter.showDateOnlyYear.format(pickedDate);
                                controller.selectInvestDateCon.text = formattedDate;
                              }
                            },
                            child: const Icon(Icons.calendar_month, color: ColorRes.textColor, size: 20)),
                      ),
                      const SizedBox(height: 10),
                      // Comments Field
                      GlobalTextFormField(
                        controller: controller.investCommentsCon,
                        titleText: 'Comments',
                        hintText: 'Enter Invest Comments',
                        decoration: inputDropDecoration,
                        maxLine: 2,
                      ),
                      const SizedBox(height: 10),
                      // Amount Field
                      GlobalTextFormField(
                        controller: controller.investAmountCon,
                        titleText: 'Amount',
                        hintText: 'Enter Invest Amount',
                        keyboardType: TextInputType.number,
                        decoration: borderDecoration,
                      ),
                      const SizedBox(height: 20),
                      // Submit Button
                      GlobalButtonWidget(
                        str: 'Submit',
                        height: 45,
                        onTap: () {
                          controller.addInvestment();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Total Investment Row
              GetBuilder<InvestmentController>(builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const GlobalText(
                      str: "Total Invest =",
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.textColor,
                    ),
                    GlobalText(
                      str: '৳ ${controller.totalInvestAmount.toStringAsFixed(2)}',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.textColor,
                    ),
                  ],
                );
              }),
              const SizedBox(height: 10),
              // Table Header
              const InvestTableWidget(
                firstRow: 'SL',
                secondRow: 'Date',
                thirdRow: 'Comments',
                fourRow: 'Amount',
              ),
              GetBuilder<InvestmentController>(builder: (controller) {
                if (controller.investData.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Investments Found',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                }
                return GlobalContainer(
                  backgroundColor: ColorRes.white,
                  width: Get.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.investData.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      final investment = controller.investData[index];
                      double amount = 0.0;
                      if (investment['amount'] != null) {
                        amount = double.tryParse(investment['amount'].toString()) ?? 0.0;
                      }

                      return InvestTableValueWidget(
                        firstColumn: (index + 1).toString(),
                        secondColumn: investment['date'] ?? '',
                        thirdColumn: investment['comments'] ?? '',
                        fourColumn: amount.toStringAsFixed(2),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
