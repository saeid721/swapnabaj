import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/notices_controller/notices_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';

class NoticesScreen extends StatelessWidget {

  NoticesScreen({super.key});

  final NoticesController controller = Get.put(NoticesController());

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
          'Notices',
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
              children: [
                GetBuilder<NoticesController>(builder: (noticesController) {
                  if (noticesController.noticesData.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Notice Data Found',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    );
                  }
                  return GlobalContainer(
                    backgroundColor: ColorRes.backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.noticesData.length,
                          itemBuilder: (context, index) {
                            final notices = noticesController.noticesData[index];
                            return Card(
                              color: Colors.white,
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        notices.title,
                                        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        notices.date,
                                        style: const TextStyle(fontSize: 12.0),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    notices.description,
                                    style: const TextStyle(fontSize: 14.0),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
