import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_screen/login_screen.dart';
import '../widget/colors.dart';
import '../widget/global_container.dart';
import '../widget/global_text.dart';
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
        centerTitle: false,
        title: const Text(
          'Swapnobaj',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const GlobalText(
              str: "Members list",
              fontSize: 20,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              color: ColorRes.primaryColor,
            ),
            const SizedBox(height: 10),
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
