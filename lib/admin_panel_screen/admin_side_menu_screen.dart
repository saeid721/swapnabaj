import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global_widget/chapter_item_widget.dart';
import 'admin_capital_screen/admin_capital_screen.dart';
import 'admin_expense_screen/admin_expense_screen.dart';
import 'admin_home_screen/admin_home_screen.dart';
import 'admin_invest_screen/admin_invest_screen.dart';
import 'admin_login_screen/admin_login_screen.dart';
import 'admin_menu_screen/admin_bangla_001.dart';
import 'admin_profit_screen/admin_profit_screen.dart';
import '../../global_widget/colors.dart';

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ChapterItem(
                  title: "Capital",
                  onTap: () {
                    Get.to(() => const AdminCapitalScreen());
                  },
                ),
                ChapterItem(
                  title: "Profit",
                  onTap: () {
                    Get.to(() => const AdminProfitScreen());
                  },
                ),
                ChapterItem(
                  title: "Invest",
                  onTap: () {
                    Get.to(() => const AdminInvestScreen());
                  },
                ),
                ChapterItem(
                  title: "Expense",
                  onTap: () {
                    Get.to(() => const AdminExpenseScreen());
                  },
                ),
                const SizedBox(height: 5),
                ChapterItem(
                  title: "Charity",
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                ChapterItem(
                  title: 'Galary',
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                ChapterItem(
                  title: 'News',
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                ChapterItem(
                  title: 'Event',
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                ChapterItem(
                  title: 'Notice',
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                const SizedBox(height: 5),
                ChapterItem(
                  title: "About Us",
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                ChapterItem(
                  title: 'Contact Us',
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                ChapterItem(
                  title: 'Admin',
                  onTap: () {
                    Get.to(() => const AdminHomeScreen());
                  },
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
