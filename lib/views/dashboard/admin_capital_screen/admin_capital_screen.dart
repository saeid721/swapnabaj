import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/capital_controller/capital_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/date_time_formator.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_dropdown_fromfield.dart';
import '../../../global_widget/global_text.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/admin_login_screen.dart';
import 'component/admin_capital_detailes_table_widget.dart';
import 'component/admin_capital_summery_table_widget.dart';

class AdminCapitalScreen extends StatefulWidget {
  const AdminCapitalScreen({super.key});

  @override
  _AdminCapitalScreenState createState() => _AdminCapitalScreenState();
}

class _AdminCapitalScreenState extends State<AdminCapitalScreen> {
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
              Get.to(() => SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              GlobalContainer(
                backgroundColor: ColorRes.white,
                elevation: 1,
                width: Get.width,
                borderRadius: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<CapitalController>(
                    builder: (controller) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GlobalTextFormField(
                          controller: capitalController.selectDepositDateCon,
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
                              var pickedDate = await showDateOnlyPicker(context);
                              setState(() {
                                String formattedDate = DateTimeFormatter.showDateOnly.format(pickedDate);
                                capitalController.selectDepositDateCon.text = formattedDate;
                              });
                            },
                            child: const Icon(Icons.calendar_month, color: ColorRes.textColor, size: 20),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomDropDownFormField(
                          value: controller.selectDepositorName,
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
                          sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                          onChanged: (val) {
                            controller.selectDepositorName = val!;
                            controller.update();
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomDropDownFormField(
                          value: controller.selectDepositPurpose,
                          titleText: "Select Deposit Purpose",
                          hintText: "Select Deposit Purpose",
                          isDense: true,
                          filled: true,
                          items: const [
                            "Monthly",
                            "Yearly",
                          ],
                          sufixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                          onChanged: (val) {
                            controller.selectDepositPurpose = val!;
                            controller.update();
                          },
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: capitalController.depositAmountCon,
                          titleText: 'Amount',
                          hintText: 'Enter Deposit Amount',
                          keyboardType: TextInputType.number,
                          decoration: borderDecoration,
                        ),
                        const SizedBox(height: 15),
                        GlobalButtonWidget(
                          str: 'Submit Capital',
                          height: 45,
                          onTap: () {
                            capitalController.addOrUpdateCapitalData();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),const SizedBox(height: 10),
              Column(
                children: [
                  const GlobalText(
                    str: "Summary",
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
                    child: GetBuilder<CapitalController>(
                      builder: (controller) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.capitalData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          var data = controller.capitalData[index];
                          return CapitalSummeryTableValueWidget(
                            firstColumn: data['id'] ?? '',
                            secondColumn: data['depositorName'] ?? '',
                            thirdColumn: data['amount'] ?? '',
                          );
                        },
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlobalText(
                        str: "Total Deposit (BDT) =",
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textColor,
                      ),
                      GlobalText(
                        // Displaying the total amount with two decimal places
                        //str: totalAmount.toStringAsFixed(2),
                        str: '5000.00',
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
              const SizedBox(height: 10),
              Column(
                children: [
                  GlobalContainer(
                    backgroundColor: ColorRes.backgroundColor,
                    width: Get.width,
                    child: const CapitalDetailsTableWidget(
                      firstRow: 'SL',
                      secondRow: 'Date',
                      thirdRow: 'Name',
                      fourRow: 'Purpose',
                      fiveRow: 'Amount',
                    ),
                  ),
                  GlobalContainer(
                    backgroundColor: ColorRes.white,
                    width: Get.width,
                    child: GetBuilder<CapitalController>(
                      builder: (controller) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.capitalData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          var detailsData = controller.capitalData[index];
                        return CapitalDetailsTableValueWidget(
                          firstColumn: detailsData['id'] ?? '',
                          secondColumn: detailsData['date'] ?? '',
                          thirdColumn: detailsData['depositorName'] ?? '',
                          fourColumn: detailsData['purpose'] ?? '',
                          fiveColumn: detailsData['amount'] ?? '',
                        );
                      },
                    ),
                  ),),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlobalText(
                        str: "Total Deposit (BDT) =",
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textColor,
                      ),
                      GlobalText(
                        // Displaying the total amount with two decimal places
                       // str: totalAmount.toStringAsFixed(2),
                        str: '60,000.00',
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}