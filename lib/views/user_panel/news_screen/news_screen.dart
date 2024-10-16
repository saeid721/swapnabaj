import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/news_controller/news_controller.dart';
import '../../../global_widget/global_container.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import 'news_details.dart';
import '../../../global_widget/colors.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsController controller = Get.put(NewsController());

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              GetBuilder<NewsController>(builder: (newsController) {
                if (newsController.newsData.isEmpty) {
                  return const Center(
                    child: Text(
                      'No News Data Found',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                }
                return GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  child: SizedBox(
                    height: Get.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: newsController.newsData.length,
                      itemBuilder: (context, index) {
                        final newsItems = newsController.newsData[index];
                        return Stack(children: [
                          InkWell(
                            onTap: () {
                              Get.to(
                                    () => NewsDetailsScreen(
                                  imagePath: newsItems.fileUrl ?? 'assets/images/placeholder.png', // Added null check
                                  newsTitle: newsItems.title,
                                  date: newsItems.date,
                                  description: newsItems.description,
                                  index: index,
                                ),
                              );
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
                                        newsItems.title,
                                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: ColorRes.textColor),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Image.network(
                                          newsItems.fileUrl!,
                                          width: Get.width,
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
                                newsItems.date,
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
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
