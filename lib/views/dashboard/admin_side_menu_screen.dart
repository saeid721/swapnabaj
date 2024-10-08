import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/chapter_item_widget.dart';
import '../../global_widget/colors.dart';
import 'admin_about_screen/admin_about_screen.dart';
import 'admin_capital_screen/admin_capital_screen.dart';
import 'admin_charity_screen/admin_charity_screen.dart';
import 'admin_contact_screen/admin_contact_screen.dart';
import 'admin_event_screen/admin_event_screen.dart';
import 'admin_expense_screen/admin_expense_screen.dart';
import 'admin_gallery_screen/admin_gallery_screen.dart';
import 'admin_invest_screen/admin_invest_screen.dart';
import 'admin_member_screen/admin_member_screen.dart';
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
                color: ColorRes.secondaryColor,
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
            leadingImage: 'assets/icons/capital.png',
            title: "Capital",
            onTap: () {
              Get.to(() => AdminCapitalScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/profit.png',
            title: "Profit",
            onTap: () {
              Get.to(() =>  AdminProfitScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/invest.png',
            title: "Invest",
            onTap: () {
              Get.to(() => AdminInvestScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/expense.png',
            title: "Expense",
            onTap: () {
              Get.to(() => AdminExpenseScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/charity.png',
            title: "Charity",
            onTap: () {
              Get.to(() => AdminCharityScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/gallery.png',
            title: "Gallery",
            onTap: () {
              Get.to(() => AdminGalleryScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/news.png',
            title: "News",
            onTap: () {
              Get.to(() => AdminNewsScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/event.png',
            title: "Event",
            onTap: () {
              Get.to(() => AdminEventScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/notice.png',
            title: "Notice",
            onTap: () {
              Get.to(() => AdminNoticesScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/about.png',
            title: "Members",
            onTap: () {
              Get.to(() => AdminMemberScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/about.png',
            title: "About Us",
            onTap: () {
              Get.to(() => AdminAboutScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/contact.png',
            title: "Contact Us",
            onTap: () {
              Get.to(() => AdminContactUsScreen());
            },
          ),
        ],
      ),
    );
  }
}