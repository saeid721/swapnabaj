import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../../controllers/member_controller/member_controller.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_sizedbox.dart';
import '../../../global_widget/global_text.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/input_decoration.dart';
import 'component/admin_member_card_widget.dart';

class AdminMemberScreen extends StatefulWidget {
  @override
  State<AdminMemberScreen> createState() => _AdminMemberScreenState();
}

class _AdminMemberScreenState extends State<AdminMemberScreen> {
  final AdminMemberController controller = Get.put(AdminMemberController());
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
  void initState() {
    super.initState();
    controller.fetchMembers(); // Fetch members on screen load
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
                        controller: controller.memberPhoneCon,
                        titleText: 'Phone',
                        hintText: 'Enter Phone',
                        decoration: inputDropDecoration,
                        isDense: true,
                        filled: true,
                      ),
                      sizedBoxH(10),
                      GlobalTextFormField(
                        controller: controller.memberEmailCon,
                        titleText: 'Email',
                        hintText: 'Enter Email',
                        decoration: inputDropDecoration,
                        isDense: true,
                        filled: true,
                      ),
                      sizedBoxH(10),
                      GlobalTextFormField(
                        controller: controller.memberAddressCon,
                        titleText: 'Address',
                        hintText: 'Enter Address',
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
                      sizedBoxH(20),
                      GlobalButtonWidget(
                        str: 'Submit',
                        height: 45,
                        onTap: () async {
                          await controller.submitData(); // Call submit data in the controller
                        },
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
                      child: Obx(() {
                        return controller.members.isEmpty
                            ? const Center(child: Text('No members found.'))
                            : ListView.builder(
                          itemCount: controller.members.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var member = controller.members[index];
                            return MemberCardTableValueWidget(
                              memberId: member.memberId,
                              name: member.name,
                              fatherName: member.fatherName,
                              motherName: member.motherName,
                              nid: member.nid,
                              contact: member.phone,
                              email: member.email,
                              address: member.address,
                              imagePath: member.fileName ?? 'assets/images/placeholder.png',
                            );
                          },
                        );
                      }),
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
}
