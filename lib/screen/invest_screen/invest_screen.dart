import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_screen/login_screen.dart';
import '../widget/colors.dart';
import '../widget/global_container.dart';
import '../widget/global_text.dart';
import 'component/invest_widget.dart';

class InvestScreen extends StatelessWidget {
  const InvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
        title: const Text(
          'Future Hope Development Association',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorRes.white,
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
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const GlobalText(
                  str: """Invest""",
                  fontSize: 20,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  color: ColorRes.primaryColor,
                ),
                const SizedBox(height: 10),
                GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  width: Get.width,
                  child: const InvestTableWidget(
                    firstRow: 'SL',
                    secondRow: 'Date',
                    thirdRow: 'Comments',
                    fourRow: 'Amount',
                  ),
                ),
                GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  width: Get.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return const InvestTableValueWidget(
                        firstColumn: '001',
                        secondColumn: '10/09/2024',
                        thirdColumn:
                            "মোফাজ্জল ভাইয়ের জমি ভাড়া বাবদ ২০২২৪ সালের জন্য।",
                        fourColumn: '1,00,000',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
