import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/global_button.dart';
import '../../global_widget/global_textform_field.dart';
import '../../global_widget/input_decoration.dart';
import '../admin_login_screen/admin_login_screen.dart';
import '../../global_widget/colors.dart';
import '../../global_widget/global_container.dart';
import '../../global_widget/global_text.dart';
import '../admin_profit_screen/component/admin_profit_widget.dart';
import 'component/admin_capital_widget.dart';

class AdminCapitalScreen extends StatefulWidget {
  const AdminCapitalScreen({super.key});

  @override
  State<AdminCapitalScreen> createState() => _AdminCapitalScreenState();
}

class _AdminCapitalScreenState extends State<AdminCapitalScreen> {
  List<Map<String, String>> capitalData = [
    {"firstColumn": "01", "secondColumn": "Mr. Atiq", "thirdColumn": "60000"},
    {"firstColumn": "02", "secondColumn": "Mr. Shamim", "thirdColumn": "80000"},
    {"firstColumn": "03", "secondColumn": "Mr. Sohel", "thirdColumn": "80000"},
    {
      "firstColumn": "04",
      "secondColumn": "Mr. Shakhawat",
      "thirdColumn": "80000"
    },
    {"firstColumn": "05", "secondColumn": "Mr. Taimur", "thirdColumn": "80000"},
    {"firstColumn": "06", "secondColumn": "Mr. Kafi", "thirdColumn": "80000"},
    {"firstColumn": "07", "secondColumn": "Mr. Ismail", "thirdColumn": "80000"},
    {
      "firstColumn": "08",
      "secondColumn": "Mr. Shamsul",
      "thirdColumn": "80000"
    },
    // Add more data items here
  ];

  // This function calculates the total amount from the capital data
  double getTotalAmount() {
    return capitalData.fold(
        0, (sum, item) => sum + double.parse(item['thirdColumn']!));
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = getTotalAmount(); // Calculating total amount

    final TextEditingController depositDateCon = TextEditingController();
    final TextEditingController depositorNameCon = TextEditingController();
    final TextEditingController depositAmountCon = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.capitalColor),
        centerTitle: false,
        title: const Text(
          'Swapnobaj',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.capitalColor,
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
                          controller: depositDateCon,
                          titleText: 'Date',
                          hintText: 'Deposit Date',
                          decoration: borderDecoration,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: depositorNameCon,
                          titleText: 'Comments',
                          hintText: 'Depositor Name',
                          decoration: borderDecoration,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: depositAmountCon,
                          titleText: 'Amount',
                          hintText: 'Enter Deposit Amount',
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
                const SizedBox(height: 5),
                Column(
                  children: [
                    const GlobalText(
                      str: "Summery",
                      fontSize: 16,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      color: ColorRes.primaryColor,
                    ),
                    const SizedBox(height: 10),
                    GlobalContainer(
                      backgroundColor: ColorRes.white,
                      width: Get.width,
                      child: const CapitalTableWidget(
                        firstRow: 'SL',
                        secondRow: 'Name',
                        thirdRow: 'Deposit',
                      ),
                    ),
                    GlobalContainer(
                      backgroundColor: ColorRes.white,
                      width: Get.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: capitalData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return CapitalTableValueWidget(
                            firstColumn: capitalData[index]['firstColumn']!,
                            secondColumn: capitalData[index]['secondColumn']!,
                            thirdColumn: capitalData[index]['thirdColumn']!,
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GlobalText(
                          str: "Total Deposit (BDT) =",
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.textColor,
                        ),
                        GlobalText(
                          // Displaying the total amount with two decimal places
                          str: totalAmount.toStringAsFixed(2),
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.textColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    GlobalContainer(
                      backgroundColor: ColorRes.backgroundColor,
                      width: Get.width,
                      child: const ProfitTableWidget(
                        firstRow: 'SL',
                        secondRow: 'Date',
                        thirdRow: 'Name',
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
                          return const ProfitTableValueWidget(
                            firstColumn: '001',
                            secondColumn: '10/09/2024',
                            thirdColumn: "Mr. Atiq",
                            fourColumn: '2,500',
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GlobalText(
                          str: "Total Deposit (BDT) =",
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.textColor,
                        ),
                        GlobalText(
                          // Displaying the total amount with two decimal places
                          str: totalAmount.toStringAsFixed(2),
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          color: ColorRes.textColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
