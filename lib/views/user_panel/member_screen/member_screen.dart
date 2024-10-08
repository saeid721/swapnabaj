import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../side_menu_screen.dart';
import 'component/member_card_widget.dart';
import 'component/member_data.dart';

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
      drawer: const SideMenuScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                          serial: sl[index],
                          name: name[index],
                          faterName: fatherName[index],
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
        MemberCardTableWidget(flex: 1, text: 'No.'),
        MemberCardTableWidget(flex: 7, text: 'Details'),
        MemberCardTableWidget(flex: 3, text: 'Image'),
      ],
    );
  }
}
