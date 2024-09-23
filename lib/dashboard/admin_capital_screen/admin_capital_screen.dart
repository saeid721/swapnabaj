import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/date_time_formator.dart';
import '../../global_widget/global_button.dart';
import '../../global_widget/global_dropdown_fromfield.dart';
import '../../global_widget/global_textform_field.dart';
import '../../global_widget/input_decoration.dart';
import '../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/admin_login_screen.dart';
import '../../global_widget/colors.dart';
import '../../global_widget/global_container.dart';
import '../../global_widget/global_text.dart';
import 'component/admin_capital_detailes_table_widget.dart';
import 'component/admin_capital_summery_table_widget.dart';

class AdminCapitalScreen extends StatefulWidget {
  const AdminCapitalScreen({super.key});

  @override
  State<AdminCapitalScreen> createState() => _AdminCapitalScreenState();
}

class _AdminCapitalScreenState extends State<AdminCapitalScreen> {
  List<Map<String, String>> capitalData = [
    {
      "firstColumn": "01",
      "secondColumn": "Atiqur Rahman",
      "thirdColumn": "60000"
    },
    {
      "firstColumn": "02",
      "secondColumn": "Shamim Hosen",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "03",
      "secondColumn": "Md. Taimur Rahman",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "04",
      "secondColumn": "Md. Shohel Rana",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "05",
      "secondColumn": "Md.Shakhawat Hossen",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "06",
      "secondColumn": "Abdullah Al Kafi",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "07",
      "secondColumn": "Mst. Taslima Akter Rupa",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "08",
      "secondColumn": "Minhazul Islam Saeid",
      "thirdColumn": "80000"
    },
    {"firstColumn": "09", "secondColumn": "Md. Asif", "thirdColumn": "80000"},
    {
      "firstColumn": "10",
      "secondColumn": "Dipok Kumar",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "11",
      "secondColumn": "Md. Amirul Islam",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "12",
      "secondColumn": "Shoriful Islam",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "13",
      "secondColumn": "Konkor Chandra Modok",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "14",
      "secondColumn": "Belayet Hossain",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "15",
      "secondColumn": "Md. Samsul Alom",
      "thirdColumn": "80000"
    },
    {
      "firstColumn": "16",
      "secondColumn": "Ismail Hossain",
      "thirdColumn": "80000"
    },
  ];

  // This function calculates the total amount from the capital data
  double getTotalAmount() {
    return capitalData.fold(
        0, (sum, item) => sum + double.parse(item['thirdColumn']!));
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = getTotalAmount(); // Calculating total amount
    final TextEditingController selectDepositDateCon = TextEditingController();
    final TextEditingController depositAmountCon = TextEditingController();
    String selectDepositorName = '0';
    String selectDepositPurpose = '0';

    // @override
    // void initState() {
    //   super.initState();
    // }

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.capitalColor),
        centerTitle: true,
        title: const Text(
          'Capital',
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
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Column(
            children: [
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
                                String formatedDate = DateTimeFormatter
                                    .showDateOnlyYear
                                    .format(pickedDate);
                                selectDepositDateCon.text = formatedDate;
                              });
                            },
                            child: const Icon(Icons.calendar_month,
                                color: ColorRes.textColor, size: 20)),
                      ),
                      const SizedBox(height: 10),
                      CustomDropDownFormField(
                        value: selectDepositorName,
                        titleText: "Select Depositor Name",
                        hintText: "Select Depositor Name",
                        isDense: true,
                        filled: true,
                        items: const [
                          "Atiqur Rahman",
                          "Shamim Hosen",
                          "Md. Taimur Rahman",
                          "Md. Shohel Rana",
                          "Md.Shakhawat Hossen",
                          "Abdullah Al Kafi",
                          "Mst. Taslima Akter Rupa",
                          "Minhazul Islam Saeid",
                          "Md. Asif",
                          "Dipok Kumar",
                          "Md. Amirul Islam",
                          "Shoriful Islam",
                          "Konkor Chandra Modok",
                          "Belayet Hossain",
                          "Md. Samsul Alom",
                          "Ismail Hossain",
                        ],
                        sufixIcon:
                            const Icon(Icons.keyboard_arrow_down_sharp),
                        onChanged: (val) {
                          setState(
                            () {
                              selectDepositorName = val!;
                              log("Value: $val");
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomDropDownFormField(
                        value: selectDepositPurpose,
                        titleText: "Deposit Porpose",
                        hintText: "Select Deposit Porpose",
                        isDense: true,
                        filled: true,
                        items: const [
                          "Monthly",
                          "Yearly",
                        ],
                        sufixIcon:
                            const Icon(Icons.keyboard_arrow_down_sharp),
                        onChanged: (val) {
                          setState(
                            () {
                              selectDepositPurpose = val!;
                              log("Value: $val");
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: depositAmountCon,
                        titleText: 'Amount',
                        hintText: 'Enter Deposit Amount',
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
              const SizedBox(height: 10),
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
                    backgroundColor: ColorRes.backgroundColor,
                    width: Get.width,
                    child: const CapitalSummeryTableWidget(
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
                        return CapitalSummeryTableValueWidget(
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
                    child: const CapitalDetailsTableWidget(
                      firstRow: 'SL',
                      secondRow: 'Date',
                      thirdRow: 'Name',
                      fourRow: 'Porpose',
                      fiveRow: 'Amount',
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
                        return const CapitalDetailsTableValueWidget(
                          firstColumn: '001',
                          secondColumn: '10/09/2024',
                          thirdColumn: "Konkor Chandra Modok",
                          fourColumn: 'Monthly',
                          fiveColumn: '2,500',
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
    );
  }
}
