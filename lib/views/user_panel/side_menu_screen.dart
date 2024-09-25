import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/chapter_item_widget.dart';
import '../../global_widget/colors.dart';
import '../dashboard/admin_home_screen/admin_home_screen.dart';
import '../dashboard/admin_login_screen/admin_login_screen.dart';
import 'about_screen/about.dart';
import 'capital_screen/capital_screen.dart';
import 'contact_screen/contact.dart';
import 'event_screen/event.dart';
import 'expense_screen/expense_screen.dart';
import 'gallery_screen/gallery.dart';
import 'home_screen/home_screen.dart';
import 'invest_screen/invest_screen.dart';
import 'news_screen/news_screen.dart';
import 'notices_screen/notices_screen.dart';
import 'profit_screen/profit_screen.dart';

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
              Get.to(() => SignInScreen());
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
                    Get.to(() => const CapitalScreen());
                  },
                ),
                ChapterItem(
                  title: "Profit",
                  onTap: () {
                    Get.to(() => const ProfitScreen());
                  },
                ),
                ChapterItem(
                  title: "Invest",
                  onTap: () {
                    Get.to(() => const InvestScreen());
                  },
                ),
                ChapterItem(
                  title: "Expense",
                  onTap: () {
                    Get.to(() => const ExpenseScreen());
                  },
                ),
                const SizedBox(height: 5),
                ChapterItem(
                  title: "Charity",
                  onTap: () {
                    Get.to(() => const HomeScreen());
                  },
                ),
                ChapterItem(
                  title: 'Galary',
                  onTap: () {
                    Get.to(() => const GalleryScreen());
                  },
                ),
                ChapterItem(
                  title: 'News',
                  onTap: () {
                    Get.to(() =>  NewsScreen());
                  },
                ),
                ChapterItem(
                  title: 'Event',
                  onTap: () {
                    Get.to(() =>  EventScreen());
                  },
                ),
                ChapterItem(
                  title: 'Notice',
                  onTap: () {
                    Get.to(() =>  NoticesScreen());
                  },
                ),
                const SizedBox(height: 5),
                ChapterItem(
                  title: "About Us",
                  onTap: () {
                    Get.to(() => const AboutScreen());
                  },
                ),
                ChapterItem(
                  title: 'Contact Us',
                  onTap: () {
                    Get.to(() => const ContactUsScreen());
                  },
                ),
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
