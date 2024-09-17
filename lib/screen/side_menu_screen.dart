import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen/login_screen.dart';
import 'menu_screen/bangla_001.dart';
import 'widget/colors.dart';
import 'widget/chapter_item_widget.dart';

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
                  title: "Charity",
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                const SizedBox(height: 5),
                ChapterItem(
                  title: 'Galary',
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                const SizedBox(height: 5),
                ChapterItem(
                  title: 'News',
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                const SizedBox(height: 5),
                ChapterItem(
                  title: 'Event',
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
                  },
                ),
                const SizedBox(height: 5),
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
                const SizedBox(height: 5),
                ChapterItem(
                  title: 'Contact Us',
                  onTap: () {
                    Get.to(() => const BanglaSongOneScreen());
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
