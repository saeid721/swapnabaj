import 'package:flutter/material.dart';

import 'widget/colors.dart';

class SeeAllValuableMember extends StatelessWidget {
  SeeAllValuableMember({super.key});

  final List<String> imagePaths = [
    'assets/images/President.jpg',
    'assets/images/President.jpg',
    'assets/images/President.jpg',
    'assets/images/President.jpg',
  ];

  final List<String> titles = [
    'Mr. Raj Khan',
    'Mr Khan Saheb',
    'Mr. Raj Khan',
    'Mr Khan Saheb',
  ];
  final List<String> subtitles = [
    'President',
    'Secretery',
    'President',
    'Secretery',
  ];
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
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorRes.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePaths[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      titles[index],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      subtitles[index],
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
