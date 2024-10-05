import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapnabaj/views/dashboard/admin_capital_screen/component/admin_capital_summery_table_widget.dart';
import 'global_widget/colors.dart';
import 'global_widget/date_time_formator.dart';
import 'global_widget/global_button.dart';
import 'global_widget/global_container.dart';
import 'global_widget/global_dropdown_fromfield.dart';
import 'global_widget/global_textform_field.dart';
import 'global_widget/input_decoration.dart';
import 'global_widget/show_date_time_picker.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  final TextEditingController selectDepositDateCon = TextEditingController();
  final TextEditingController depositAmountCon = TextEditingController();
  String selectDepositorName = '0';
  String selectDepositPurpose = '0';
  CollectionReference _capitalData = FirebaseFirestore.instance.collection("capitalData");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.green),
        centerTitle: true,
        title: const Text(
          'Firebase Test',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  "Md. Shakhawat Hossen",
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
                  setState(() {
                    selectDepositorName = val!;
                  });
                },
              ),
              const SizedBox(height: 10),
              CustomDropDownFormField(
                value: selectDepositPurpose,
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
                  setState(() {
                    selectDepositPurpose = val!;
                  });
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
              const SizedBox(height: 15),
              GlobalButtonWidget(
                str: 'Submit Capital',
                height: 45,
                onTap: () {
                  // Your submit logic here
                },
              ),
              const SizedBox(height: 10),
              GlobalContainer(
                backgroundColor: ColorRes.backgroundColor,
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
                child: StreamBuilder(
                  stream: _capitalData.snapshots(),
                  builder: (context, snapshots) {
                    if(!snapshots.hasData){
                      return CircularProgressIndicator();
                    }
                    return ListView.builder(
                      itemCount: snapshots.data!.docs.length,
                      itemBuilder: (context, index) {
                        var capital = snapshots.data!.docs[index];
                        return CapitalTableValueWidget(
                          firstColumn: capital['id'] ?? '',
                          secondColumn: capital['depositorName'] ?? '',
                          thirdColumn: capital['amount'] ?? '',
                        );
                      },
                    );
                  }
                ),
              ),

            ],

          ),

        ),
      ),
    );
  }
}
