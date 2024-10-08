import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_text.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../admin_login_screen/admin_login_screen.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import 'component/admin_member_card_widget.dart';
import 'component/admin_member_data.dart';

class AdminMemberScreen extends StatefulWidget {
  const AdminMemberScreen({super.key});

  @override
  State<AdminMemberScreen> createState() => _AdminMemberScreenState();
}

class _AdminMemberScreenState extends State<AdminMemberScreen> {

  final TextEditingController memberNameCon = TextEditingController();
  final TextEditingController memberFatherNameCon = TextEditingController();
  final TextEditingController memberMotherNameCon = TextEditingController();
  final TextEditingController memberPhoneCon = TextEditingController();
  final TextEditingController memberEmailCon = TextEditingController();
  final TextEditingController memberAddressCon = TextEditingController();

  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

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
          'Members',
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GlobalContainer(
                backgroundColor: ColorRes.white,
                elevation: 1,
                width: Get.width,
                borderRadius: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalTextFormField(
                        controller: memberNameCon,
                        titleText: 'Name',
                        hintText: 'Enter Name',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: memberFatherNameCon,
                        titleText: 'Father Name',
                        hintText: 'Enter Father Name',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: memberMotherNameCon,
                        titleText: 'Mother Name',
                        hintText: 'Enter Mother Name',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: memberPhoneCon,
                        titleText: 'Phone',
                        hintText: 'Enter Phone',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: memberEmailCon,
                        titleText: 'Email',
                        hintText: 'Enter Email',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: memberAddressCon,
                        titleText: 'Address',
                        hintText: 'Enter Address',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Attachment',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: ColorRes.textColor, fontFamily: 'Rubik'),
                        textAlign: TextAlign.left,
                      ),
                      sizedBoxH(5),
                      GlobalButtonWidget(
                        str: 'Choose File',
                        height: 50,
                        width: Get.width,
                        textSize: 14,
                        textColor: ColorRes.textColor,
                        radius: 5,
                        borderColor: ColorRes.borderColor,
                        buttomColor: Colors.transparent,
                        onTap: _pickFile,
                      ),
                      if (_fileName != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Selected file: $_fileName',
                            style: const TextStyle(fontSize: 16),
                          ),
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
              const SizedBox(height: 20),
              GlobalContainer(
                width: Get.width,
                borderRadius: 8,
                child: Column(
                  children: [
                    const GlobalText(
                      str: "Members list",
                      fontSize: 20,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      color: ColorRes.primaryColor,
                    ),
                    GlobalContainer(
                      child: Column(
                        children: [
                          buildTableHeaders(),
                          ListView.builder(
                            itemCount: name.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return MemberCardTableValueWidget(
                                memberId: sl[index],
                                name: name[index],
                                fatherName: fatherName[index],
                                motherName: motherName[index],
                                contact: contact[index],
                                nid: nid[index],
                                email: email[index],
                                address: address[index],
                                imagePath: image[index],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTableHeaders() {
    return const Row(
      children: [
        MemberCardTableWidget(flex: 1, text: 'MemberWidget'),
      ],
    );
  }
}
