import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../../controllers/member_controller/member_controller.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/input_decoration.dart';
import '../admin_login_screen/admin_login_screen.dart';
import 'component/admin_member_card_widget.dart';

class AdminMemberScreen extends StatefulWidget {
  const AdminMemberScreen({super.key});

  @override
  State<AdminMemberScreen> createState() => _AdminMemberScreenState();
}

class _AdminMemberScreenState extends State<AdminMemberScreen> {
  final MembersController controller = Get.put(MembersController());
  String? fileName;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jepg', 'png', 'gif', 'webp'],
    );
    if (result != null && result.files.isNotEmpty) {
      controller.fileName = result.files.first.path; // Get the file path
      Get.snackbar('Success', 'File selected successfully', colorText: ColorRes.green);
    } else {
      Get.snackbar('Error', 'No file selected', colorText: ColorRes.red);
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
              Get.to(() =>  SignInScreen());
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
                        controller: controller.memberNameCon,
                        titleText: 'Name',
                        hintText: 'Enter Name',
                        decoration: inputDropDecoration,
                        isDense: true,
                        filled: true,
                      ),
                      sizedBoxH(10),
                      GlobalTextFormField(
                        controller: controller.memberFatherNameCon,
                        titleText: 'Father Name',
                        hintText: 'Enter Father Name',
                        decoration: inputDropDecoration,
                        isDense: true,
                        filled: true,
                      ),
                      sizedBoxH(10),
                      GlobalTextFormField(
                        controller: controller.memberMotherNameCon,
                        titleText: 'Mother Name',
                        hintText: 'Enter Mother Name',
                        decoration: inputDropDecoration,
                        isDense: true,
                        filled: true,
                      ),
                      sizedBoxH(10),
                      GlobalTextFormField(
                        controller: controller.memberNidCon,
                        titleText: 'NID',
                        hintText: 'Enter NID',
                        keyboardType: TextInputType.phone,
                        decoration: inputDropDecoration,
                        isDense: true,
                        filled: true,
                      ),
                      sizedBoxH(10),
                      GlobalTextFormField(
                        controller: controller.memberPhoneCon,
                        titleText: 'Phone',
                        hintText: 'Enter Phone',
                        keyboardType: TextInputType.phone,
                        decoration: inputDropDecoration,
                        isDense: true,
                        filled: true,
                      ),
                      sizedBoxH(10),
                      GlobalTextFormField(
                        controller: controller.memberEmailCon,
                        titleText: 'Email',
                        hintText: 'Enter Email',
                        keyboardType: TextInputType.emailAddress,
                        decoration: inputDropDecoration,
                        isDense: true,
                        filled: true,
                      ),
                      sizedBoxH(10),
                      GlobalTextFormField(
                        controller: controller.memberAddressCon,
                        titleText: 'Address',
                        hintText: 'Enter Address',
                        maxLine: 3,
                        decoration: inputDropDecoration,
                        isDense: true,
                        filled: true,
                      ),
                      sizedBoxH(10),
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
                        onTap: pickFile,
                      ),
                      if (fileName != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Selected file: ${fileName!.split('/').last}',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      sizedBoxH(20),
                      GlobalButtonWidget(
                        str: 'Submit',
                        height: 50,
                        width: Get.width,
                        textSize: 14,
                        onTap: controller.submitMemberData,
                      ),
                    ],
                  ),
                ),
              ),
              sizedBoxH(20),

              buildTableHeaders(),
              GetBuilder<MembersController>(builder: (controller) {
                if (controller.membersData.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Members Data Found',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                }
                return GlobalContainer(
                    backgroundColor: ColorRes.white,
                    width: Get.width,
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.membersData.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final member = controller.membersData[index];
                    return MemberCardTableValueWidget(
                      memberId: (index + 1).toString(),
                      name: member.name,
                      fatherName: member.fatherName,
                      motherName: member.motherName,
                      nid: member.nid,
                      contact: member.phone,
                      email: member.email,
                      address: member.address,
                      imagePath: member.fileUrl ?? 'assets/images/placeholder.png',
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

  Widget buildTableHeaders() {
    return const Row(
      children: [
        MemberCardTableWidget(flex: 1, text: 'No.'),
        MemberCardTableWidget(flex: 7, text: 'Details'),
        MemberCardTableWidget(flex: 3, text: 'Image'),
      ],
    );
  }
}
