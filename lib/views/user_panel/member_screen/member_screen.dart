import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/member_controller/member_controller.dart';
import '../../dashboard/admin_login_screen/login_screen.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../user_custom_drawer_widget.dart';
import 'component/member_card_widget.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({super.key});

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
          'Members list',
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
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      drawer: const UserCustomDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

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
