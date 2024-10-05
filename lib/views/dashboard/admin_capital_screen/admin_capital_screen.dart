import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/capital_controller/capital_controller.dart';
import '../../../global_widget/colors.dart';
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

class AdminCapitalScreen extends StatelessWidget {
  AdminCapitalScreen({super.key});

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
                          isDense: true,
                          decoration: inputDropDecoration,
                          filled: true,
                          sufixIcon: GestureDetector(
                            onTap: () async {
                              var pickedDate = await showDateOnlyPicker(context);
                              if (pickedDate != null) {
                                capitalController.selectDepositDateCon.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                              }
                            },
                            child: const Icon(Icons.calendar_today, color: ColorRes.textColor),
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
                            capitalController.updateCapitalData();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  const GlobalText(
                    str: "Capital",
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    color: ColorRes.primaryColor,
                  ),
                  const SizedBox(height: 10),
                  GlobalContainer(
                    backgroundColor: ColorRes.backgroundColor,
                    width: Get.width,
                    child: const CapitalTableWidget(
                      firstRow: 'SL',
                      secondRow: 'Name',
                      thirdRow: 'Capital',
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
                          return CapitalTableValueWidget(
                            firstColumn: data['id'] ?? '',
                            secondColumn: data['depositorName'] ?? '',
                            thirdColumn: data['amount'] ?? '',
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GetBuilder<CapitalController>(
                    builder: (controller) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const GlobalText(
                            str: "Total Capital (BDT) =",
                            fontSize: 14,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                            color: ColorRes.textColor,
                          ),
                          GlobalText(
                            str: controller.totalCapitalAmount.toStringAsFixed(2),
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
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  const GlobalText(
                    str: "Deposit",
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    color: ColorRes.primaryColor,
                  ),
                  const SizedBox(height: 10),
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
                          return DepositTableValueWidget(
                            firstColumn: (index + 1).toString(),
                            secondColumn: detailsData['date'] ?? '',
                            thirdColumn: detailsData['depositorName'] ?? '',
                            fourColumn: detailsData['purpose'] ?? '',
                            fiveColumn: detailsData['amount'] ?? '',
                          );
                        },
                      ),
                    ),
                  ),
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
