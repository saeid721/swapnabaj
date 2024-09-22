import 'package:flutter/material.dart';
import '../../global_widget/colors.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String newsTitle;

  const NewsDetailsScreen({super.key, required this.newsTitle});

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
            onPressed: () {},
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.justify,
                newsTitle,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/Logo.png',
              ),
              const SizedBox(height: 10),
              const Text(
                textAlign: TextAlign.justify,
                "The Bangladesh Restaurant Owners Association officials hold a press conference at the association's headquarters in Bijoynagar, Dhaka, on Tuesday to discuss the recent crisis in the restaurant industry followed by the Bailey Road fire and peaceful business operations during the holy month of Ramadan. Photo: TBS",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              const Text(
                textAlign: TextAlign.justify,
                "The Bangladesh Restaurant Owners Association has demanded the formation of a task force to end random harassment and arrests in the name of raids aimed at ensuring standard practices.",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                textAlign: TextAlign.justify,
                "The demand was made today (5 March) morning during a press conference held at the association's headquarters in Bijoynagar, Dhaka, organised to discuss the recent crisis in the restaurant industry followed by the Bailey Road fire and peaceful business operations during the holy month of Ramadan.",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
