import 'package:flutter/material.dart';
import '../../../global_widget/colors.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String newsTitle;
  final String newsDetails;

  const NewsDetailsScreen({
    super.key,
    required this.newsTitle,
    required this.newsDetails,});

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
          'News',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.justify,
                  newsTitle,
                  style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.justify,
                  newsDetails,
                  style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
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
