import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';

class CharityDetailsScreen extends StatelessWidget {
  final String date;
  final String number;
  final String charityTitle;
  final String imagePath;
  final String details;
  final int index;

  const CharityDetailsScreen({
    super.key,
    required this.date,
    required this.number,
    required this.charityTitle,
    required this.imagePath,
    required this.details,
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
              Get.to(() =>  SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          height: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Text(number,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: ColorRes.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              GlobalContainer(
                backgroundColor: ColorRes.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Last Update: $date"
                          ,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      charityTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                          color: ColorRes.secondaryColor
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      details,
                      textAlign: TextAlign.justify,
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
    );
  }
}
