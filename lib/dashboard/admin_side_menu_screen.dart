import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapnabaj/dashboard/admin_gallery_screen/admin_gallery_screen.dart';
import '../global_widget/chapter_item_widget.dart';
import '../global_widget/colors.dart';
import '../user_panel/home_screen/home_screen.dart';
import 'admin_about_screen/admin_about_screen.dart';
import 'admin_capital_screen/admin_capital_screen.dart';
import 'admin_contact_screen/admin_contact_screen.dart';
import 'admin_event_screen/admin_event_screen.dart';
import 'admin_expense_screen/admin_expense_screen.dart';
import 'admin_home_screen/admin_home_screen.dart';
import 'admin_invest_screen/admin_invest_screen.dart';
import 'admin_news_screen/admin_news_screen.dart';
import 'admin_notices_screen/admin_notices_screen.dart';
import 'admin_profit_screen/admin_profit_screen.dart';

class AdminSideBerMenuWidget extends StatelessWidget {
  const AdminSideBerMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 170,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: ColorRes.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo2.png',
                    width: 220,
                  ),
                ],
              ),
            ),
          ),
          ChapterItem(
            leadingImage: 'assets/images/capital.png',
            title: "Capital",
            onTap: () {
              Get.to(() => const AdminCapitalScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/profit.png',
            title: "Profit",
            onTap: () {
              Get.to(() => const AdminProfitScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/invest.png',
            title: "Invest",
            onTap: () {
              Get.to(() => const AdminInvestScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/expense.png',
            title: "Expense",
            onTap: () {
              Get.to(() => const AdminExpenseScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/charity.png',
            title: "Charity",
            onTap: () {
              Get.to(() => const AdminHomeScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/gallery.png',
            title: "Gallery",
            onTap: () {
              Get.to(() => const AdminGalleryScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/news.png',
            title: "News",
            onTap: () {
              Get.to(() => AdminNewsScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/event.png',
            title: "Event",
            onTap: () {
              Get.to(() => AdminEventScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/notice.png',
            title: "Notice",
            onTap: () {
              Get.to(() => AdminNoticesScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/about.png',
            title: "About Us",
            onTap: () {
              Get.to(() => const AdminAboutScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/images/contact.png',
            title: "Contact Us",
            onTap: () {
              Get.to(() => const AdminContactUsScreen());
            },
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Get.to(() => const HomeScreen());
            },
          ),
        ],
      ),
    );
  }
}