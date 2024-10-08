import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/profit_controller/profit_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_text.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import 'component/profit_widget.dart';

class ProfitScreen extends StatelessWidget {
  ProfitScreen({super.key});

  final ProfitController profitController = Get.put(ProfitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.primaryColor),
        centerTitle: false,
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
              Get.to(() =>  SignInScreen());
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              GetBuilder<ProfitController>(
                builder: (controller) {
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
                          str: "Total Profit =",
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.textColor,
                        ),
                        GlobalText(
                          str: '৳ ${controller.totalProfitAmount.toStringAsFixed(2)}',
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.textColor,
                        ),
                      ],
                    ),
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
    );
  }
}
