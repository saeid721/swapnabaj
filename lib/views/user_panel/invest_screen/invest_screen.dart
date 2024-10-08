import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/investment_controller/investment_controller.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_text.dart';
import '../side_menu_screen.dart';
import 'component/invest_widget.dart';

class InvestScreen extends StatefulWidget {
  const InvestScreen({super.key});

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
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
              GetBuilder<InvestmentController>(builder: (controller) {
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
                        str: "Total Invest =",
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textColor,
                      ),
                      GlobalText(
                        str: '৳ ${controller.totalInvestAmount.toStringAsFixed(2)}',
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
