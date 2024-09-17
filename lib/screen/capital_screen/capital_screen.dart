import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_screen/login_screen.dart';
import '../widget/colors.dart';
import '../widget/global_container.dart';
import '../widget/global_text.dart';
import 'component/capital_widget.dart';

class CapitalScreen extends StatefulWidget {
  const CapitalScreen({super.key});

  @override
  State<CapitalScreen> createState() => _CapitalScreenState();
}

class _CapitalScreenState extends State<CapitalScreen> {
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
            icon: const Icon(Icons.login),
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
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      const GlobalText(
                        str: "Capital",
                        fontSize: 20,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w700,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
