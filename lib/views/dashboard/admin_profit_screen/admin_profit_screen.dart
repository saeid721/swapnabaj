import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/profit_controller/profit_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/date_time_formator.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_text.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/admin_login_screen.dart';
import 'component/admin_profit_widget.dart';

class AdminProfitScreen extends StatelessWidget {
  AdminProfitScreen({super.key});

  final ProfitController profitController = Get.put(ProfitController());

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
          'Profit',
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
          scrollDirection: Axis.vertical,
          child: Padding(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalTextFormField(
                          controller: profitController.selectProfitDateCon,
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
                                  profitController.selectProfitDateCon.text = formattedDate;
                                }
                              },
                              child: const Icon(Icons.calendar_month, color: ColorRes.textColor, size: 20)),
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: profitController.profitCommentsCon,
                          titleText: 'Comments',
                          hintText: 'Enter Profit Comments',
                          decoration: inputDropDecoration,
                          maxLine: 2,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: profitController.profitAmountCon,
                          titleText: 'Amount',
                          hintText: 'Enter Profit Amount',
                          keyboardType: TextInputType.number,
                          decoration: borderDecoration,
                        ),
                        const SizedBox(height: 20),
                        GlobalButtonWidget(
                          str: 'Submit',
                          height: 45,
                          onTap: () {
                            profitController.addProfit();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<ProfitController>(
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GlobalText(
                          str: "Total Profit =",
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.textColor,
                        ),
                        GlobalText(
                          str: '৳ ${controller.totalProfitAmount.toStringAsFixed(2)}',
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.textColor,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 10),
                GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  width: Get.width,
                  child: const ProfitTableWidget(
                    firstRow: 'SL',
                    secondRow: 'Date',
                    thirdRow: 'Comments',
                    fourRow: 'Amount',
                  ),
                ),
                GetBuilder<ProfitController>(builder: (controller) {
                  if (controller.profitData.isEmpty) {
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
                      itemCount: controller.profitData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        final profit = controller.profitData[index];
                        double amount = 0.0;
                        if (profit['amount'] != null) {
                          amount = double.tryParse(profit['amount'].toString()) ?? 0.0;
                        }

                        return ProfitTableValueWidget(
                          firstColumn: (index + 1).toString(),
                          secondColumn: profit['date'] ?? '',
                          thirdColumn: profit['comments'] ?? '',
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
      ),
    );
  }
}
