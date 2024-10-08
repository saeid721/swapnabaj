import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/global_container.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import 'news_details.dart';
import '../../../global_widget/colors.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final List<Map<String, dynamic>> newsItems = [
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/saeid.jpg',
      'date': '22/03/2024',
      'description':
      """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'title': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'image': 'assets/images/saeid.jpg',
      'date': '23/03/2024',
      'description':
      """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'title': 'Lorem Ipsum is simply dummy text',
      'image': 'assets/images/saeid.jpg',
      'date': '23/03/2024',
      'description':
      """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'title': 'Lorem Ipsum is simply dummy text',
      'image': 'assets/images/saeid.jpg',
      'date': '23/03/2024',
      'description':
      """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/saeid.jpg',
      'date': '23/03/2024',
      'description':
      """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'title': 'Swapnobaj',
      'image': 'assets/images/saeid.jpg',
      'date': '23/03/2024',
      'description':
      """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    // Add more items as needed
  ];

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
            onPressed: () {
              Get.to(() => SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              GlobalContainer(
                backgroundColor: ColorRes.backgroundColor,
                child: SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: newsItems.length,
                    itemBuilder: (context, index) {
                      return Stack(children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => NewsDetailsScreen(
                              newsTitle: newsItems[index]['title'] ?? 'No Title', // Added null check
                              imagePath: newsItems[index]['image'] ?? 'assets/images/placeholder.png', // Added null check
                              date: newsItems[index]['date'] ?? 'No Date', // Added null check
                              details: newsItems[index]['description'] ?? 'No Description', // Added null check
                              index: index,
                            ));
                          },
                          child: Card(
                            margin: const EdgeInsets.only(top: 10),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      newsItems[index]['title'] ?? 'No Title', // Added null check
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: ColorRes.textColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Image.asset(
                                        newsItems[index]['image'] ?? 'assets/images/placeholder.png', // Added null check
                                        fit: BoxFit.cover,
                                      ),
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
                              color: ColorRes.primaryColor.withOpacity(0.05),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              newsItems[index]['date'] ?? 'No Date', // Added null check
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
            ],
          ),
        ),
      ),
    );
  }
}
