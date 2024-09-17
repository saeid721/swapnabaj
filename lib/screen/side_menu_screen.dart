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
        backgroundColor: ColorRes.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        //centerTitle: true,
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
            padding: const EdgeInsets.only(left: 5, right: 0),
            child: Column(
              children: [
                const SizedBox(height: 10),
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
