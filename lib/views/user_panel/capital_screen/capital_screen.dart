import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/capital_controller/capital_controller.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_text.dart';
import '../side_menu_screen.dart';
import 'component/capital_widget.dart';
import 'component/deposit_widget.dart';

class CapitalScreen extends StatelessWidget {
  CapitalScreen({super.key});

  final CapitalController capitalController = Get.put(CapitalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.capitalColor),
        centerTitle: true,
        title: const Text(
          'Deposit',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.capitalColor,
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
              // GetBuilder<CapitalController>(
              //   builder: (controller) {
              //     return GlobalContainer(
              //       backgroundColor: ColorRes.white,
              //       padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
              //       bottomBorderColor: ColorRes.borderColor,
              //       borderCornerRadius: const BorderRadius.all(Radius.circular(5)),
              //       elevation: 2,
              //       height: 40,
              //       width: Get.width,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           const GlobalText(
              //             str: "Total Deposit =",
              //             fontSize: 16,
              //             textAlign: TextAlign.center,
              //             fontWeight: FontWeight.w600,
              //             color: ColorRes.textColor,
              //           ),
              //           GlobalText(
              //             str: '৳ ${controller.totalCapitalAmount.toStringAsFixed(2)}',
              //             fontSize: 16,
              //             textAlign: TextAlign.center,
              //             fontWeight: FontWeight.w600,
              //             color: ColorRes.textColor,
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
              //const SizedBox(height: 10),
              _buildCapitalTable(),
              const SizedBox(height: 10),
              _buildDepositTable(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Capital Table: Display totalDepositAmount
  Widget _buildCapitalTable() {
    return Column(
      children: [
        GlobalContainer(
          backgroundColor: ColorRes.backgroundColor,
          width: Get.width,
          child: const CapitalTableWidget(
            firstRow: 'SL',
            secondRow: 'Name',
            thirdRow: 'Amount',
          ),
        ),
        GetBuilder<CapitalController>(builder: (controller) {
          if (controller.capitalData.isEmpty) {
            return const Center(
              child: Text(
                'No Deposit Found',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            );
          }
          return GlobalContainer(
            backgroundColor: ColorRes.white,
            width: Get.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.capitalData.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                var data = controller.capitalData[index];
                return CapitalTableValueWidget(
                  firstColumn: data.memberId, // Check if data is displayed
                  secondColumn: data.depositorName,
                  thirdColumn: data.totalDepositAmount.toStringAsFixed(2),
                );
              },
            ),
          );
        }),
      ],
    );
  }

  // Deposit Entries Table: Display individual deposit amounts
  Widget _buildDepositTable() {
    return Column(
      children: [
        const GlobalText(
          str: "Deposit List",
          fontSize: 18,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
          color: ColorRes.primaryColor,
        ),
        const SizedBox(height: 5),
        GlobalContainer(
          backgroundColor: ColorRes.backgroundColor,
          width: Get.width,
          child: const DepositTableWidget(
            firstRow: 'SL',
            secondRow: 'Date',
            thirdRow: 'Name',
            fourRow: 'Purpose',
            fiveRow: 'Amount',
          ),
        ),
        GetBuilder<CapitalController>(builder: (controller) {
          if (controller.depositEntries.isEmpty) {
            return const Center(
              child: Text(
                'No Deposit Found',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            );
          }
          return GlobalContainer(
            backgroundColor: ColorRes.white,
            width: Get.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.depositEntries.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                var singleData = controller.depositEntries[index];
                return DepositTableValueWidget(
                  firstColumn: (index + 1).toString(),
                  secondColumn: singleData.date,
                  thirdColumn: singleData.depositorName,
                  fourColumn: singleData.depositPurpose,
                  fiveColumn: singleData.amount.toStringAsFixed(1),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
