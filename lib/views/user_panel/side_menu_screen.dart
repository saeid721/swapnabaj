import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/chapter_item_widget.dart';
import '../../global_widget/colors.dart';
import 'about_screen/about.dart';
import 'capital_screen/capital_screen.dart';
import 'charity_screen/charity_screen.dart';
import 'contact_screen/contact.dart';
import 'event_screen/event.dart';
import 'expense_screen/expense_screen.dart';
import 'gallery_screen/gallery.dart';
import 'invest_screen/invest_screen.dart';
import 'member_screen/member_screen.dart';
import 'news_screen/news_screen.dart';
import 'notices_screen/notices_screen.dart';
import 'profit_screen/profit_screen.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({super.key});

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
          // ChapterItem(
          //   leadingImage: 'assets/icons/capital.png',
          //   title: "Capital",
          //   onTap: () {
          //     Get.to(() => CapitalScreen());
          //   },
          // ),
          // ChapterItem(
          //   leadingImage: 'assets/icons/profit.png',
          //   title: "Profit",
          //   onTap: () {
          //     Get.to(() =>  ProfitScreen());
          //   },
          // ),
          // ChapterItem(
          //   leadingImage: 'assets/icons/invest.png',
          //   title: "Invest",
          //   onTap: () {
          //     Get.to(() => InvestScreen());
          //   },
          // ),
          // ChapterItem(
          //   leadingImage: 'assets/icons/expense.png',
          //   title: "Expense",
          //   onTap: () {
          //     Get.to(() => ExpenseScreen());
          //   },
          // ),
          ChapterItem(
            leadingImage: 'assets/icons/charity.png',
            title: "Charity",
            onTap: () {
              Get.to(() => CharityScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/gallery.png',
            title: "Gallery",
            onTap: () {
              Get.to(() => GalleryScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/news.png',
            title: "News",
            onTap: () {
              Get.to(() => NewsScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/event.png',
            title: "Event",
            onTap: () {
              Get.to(() => EventScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/notice.png',
            title: "Notice",
            onTap: () {
              Get.to(() => NoticesScreen());
            },
          ),
          // ChapterItem(
          //   leadingImage: 'assets/icons/about.png',
          //   title: "Members",
          //   onTap: () {
          //     Get.to(() => MemberScreen());
          //   },
          // ),
          ChapterItem(
            leadingImage: 'assets/icons/about.png',
            title: "About Us",
            onTap: () {
              Get.to(() => AboutScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/contact.png',
            title: "Contact Us",
            onTap: () {
              Get.to(() => ContactUsScreen());
            },
          ),
        ],
      ),
    );
  }
}