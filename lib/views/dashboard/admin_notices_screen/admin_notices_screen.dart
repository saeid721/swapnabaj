import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/notices_controller/notices_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/date_time_formator.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/login_screen.dart';

class AdminNoticesScreen extends StatefulWidget {
  const AdminNoticesScreen({super.key});

  @override
  State<AdminNoticesScreen> createState() => _AdminNoticesScreenState();
}

class _AdminNoticesScreenState extends State<AdminNoticesScreen> {
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
                GlobalContainer(
                  backgroundColor: ColorRes.white,
                  elevation: 1,
                  width: Get.width,
                  borderRadius: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: controller.selectNoticeDateCon,
                          titleText: 'Select Date',
                          hintText: "Select Date".tr,
                          keyboardType: TextInputType.datetime,
                          titleStyle: const TextStyle(color: ColorRes.textColor, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
                          isDense: true,
                          decoration: inputDropDecoration,
                          filled: true,
                          sufixIcon: GestureDetector(
                              onTap: () async {
                                var pickedDate = await showDateOnlyPicker(context);
                                if (pickedDate != null) {
                                  String formattedDate = DateTimeFormatter.showDateOnlyYear.format(pickedDate);
                                  setState(() {
                                    controller.selectNoticeDateCon.text = formattedDate;
                                  });
                                }
                              },
                              child: const Icon(Icons.calendar_month, color: ColorRes.textColor, size: 20)),
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: controller.noticeTitleCon,
                          titleText: 'Title',
                          hintText: 'Enter Title',
                          isDense: true,
                          decoration: inputDropDecoration,
                          filled: true,
                        ),
                        const SizedBox(height: 10),
                        GlobalTextFormField(
                          controller: controller.noticeDescriptionCon,
                          titleText: 'Description',
                          hintText: 'Enter Description',
                          isDense: true,
                          decoration: inputDropDecoration,
                          maxLine: 5,
                          filled: true,
                        ),
                        const SizedBox(height: 20),
                        GlobalButtonWidget(
                          str: 'Submit',
                          height: 45,
                          onTap: controller.submitNoticeData,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
