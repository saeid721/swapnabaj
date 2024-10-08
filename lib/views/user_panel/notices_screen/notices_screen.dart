import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';

class NoticesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {
      'title': 'Notices 1',
      'date': 'April 10, 2024',
      'description':
          "No one can escape the responsibility for the fire incident at Green Cozy Cottage on Bailey Road in the capital. Building owners, restaurant owners and restaurant owner associations or related government offices are all responsible.\n Bangladesh Restaurant Owners' Association Secretary General Md Imran Hasan said this during the inspection of the burnt building on Bailey Road on Sunday.",
    },
    {
      'title': 'Notices 2',
      'date': 'April 15, 2024',
      'description':
          "No one can escape the responsibility for the fire incident at Green Cozy Cottage on Bailey Road in the capital. Building owners, restaurant owners and restaurant owner associations or related government offices are all responsible.",
    },
    {
      'title': 'Notices 3',
      'date': 'April 20, 2024',
      'description':
          "No one can escape the responsibility for the fire incident at Green Cozy Cottage on Bailey Road in the capital. Building owners, restaurant owners and restaurant owner associations or related government offices are all responsible.\n Bangladesh Restaurant Owners' Association Secretary General Md Imran Hasan said this during the inspection of the burnt building on Bailey Road on Sunday.",
    },
    {
      'title': 'Notices 4',
      'date': 'April 20, 2024',
      'description':
          "No one can escape the responsibility for the fire incident at Green Cozy Cottage on Bailey Road in the capital. Building owners, restaurant owners and restaurant owner associations or related government offices are all responsible.\n Bangladesh Restaurant Owners' Association Secretary General Md Imran Hasan said this during the inspection of the burnt building on Bailey Road on Sunday.",
    },
  ];

  NoticesScreen({super.key});

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
          'Notice',
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
          child: SizedBox(
            height: Get.height,
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Text(
                            events[index]['title'],
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            events[index]['date'],
                            style: const TextStyle(fontSize: 12.0),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        events[index]['description'],
                        style: const TextStyle(fontSize: 14.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
