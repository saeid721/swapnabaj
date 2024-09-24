import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_details.dart';
import '../../../global_widget/colors.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final List<Map<String, dynamic>> newsItems = [
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/Logo.png',
      'date': '22/03/2024',
    },
    {
      'title':
          'Swapnobaj',
      'image': 'assets/images/Logo.png',
      'date': '23/03/2024',
    },
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/Logo.png',
      'date': '24/03/2024',
    },
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/Logo.png',
      'date': '24/03/2024',
    },
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/Logo.png',
      'date': '24/03/2024',
    },
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/Logo.png',
      'date': '24/03/2024',
    },
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/Logo.png',
      'date': '24/03/2024',
    },
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/Logo.png',
      'date': '24/03/2024',
    },
  ];

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
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SizedBox(
          height: Get.height,
          child: ListView.builder(
            itemCount: newsItems.length,
            itemBuilder: (context, index) {
              return Stack(children: [
                InkWell(
                  onTap: () {
                    Get.to(() => NewsDetailsScreen(
                        newsTitle: newsItems[index]['title']));
                  },
                  child: Card(
                    margin: const EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 30),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    newsItems[index]['title'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: ColorRes.primaryColor
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              newsItems[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: ColorRes.primaryColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      newsItems[index]['date'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
