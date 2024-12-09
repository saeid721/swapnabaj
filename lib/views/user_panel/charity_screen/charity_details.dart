import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../dashboard/admin_login_screen/login_screen.dart';

class CharityDetailsScreen extends StatelessWidget {
  final String date;
  final String number;
  final String title;
  final String imagePath;
  final String description;
  final int index;

  const CharityDetailsScreen({
    super.key,
    required this.date,
    required this.number,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.primaryColor),
        centerTitle: true,
        title: const Text(
          'Charity - Details',
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
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GlobalContainer(
                  backgroundColor: ColorRes.white,
                  borderRadius: 10,
                  elevation: 2,
                  child: Column(
                    children: [
                      Hero(
                        tag: 'logo$index',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(imagePath), // Corrected image provider
                                fit: BoxFit.cover,

                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        number,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: ColorRes.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Last Update: $date",
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorRes.secondaryColor),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
