import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/chapter_item_widget.dart';
import '../../global_widget/global_image_loader.dart';
import '../../global_widget/images.dart';
import '../dashboard/admin_login_screen/change_password_screen.dart';
import 'about_screen/about.dart';
import 'charity_screen/charity_screen.dart';
import 'contact_screen/contact.dart';
import 'event_screen/event.dart';
import 'gallery_screen/gallery.dart';
import 'news_screen/news_screen.dart';
import 'notices_screen/notices_screen.dart';

class UserCustomDrawerWidget extends StatelessWidget {
  const UserCustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 170,
            child: DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFFa8e2a8), Color(0xFFcfe7b7)],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalImageLoader(
                    imagePath: Images.appLogo,
                    width: 220,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
          ChapterItem(
            leadingImage: 'assets/icons/charity.png',
            title: "Charity",
            onTap: () {
              Get.to(() => const CharityScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/gallery.png',
            title: "Gallery",
            onTap: () {
              Get.to(() => const GalleryScreen());
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
              Get.to(() => const EventScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/notice.png',
            title: "Notice",
            onTap: () {
              Get.to(() => NoticesScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/about.png',
            title: "About Us",
            onTap: () {
              Get.to(() => const AboutScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/contact.png',
            title: "Contact Us",
            onTap: () {
              Get.to(() => const ContactUsScreen());
            },
          ),
          ChapterItem(
            leadingImage: 'assets/icons/reset-password.png',
            title: "Change Password",
            onTap: () {
              Get.to(() => const ChangePasswordScreen());
            },
          ),
        ],
      ),
    );
  }
}