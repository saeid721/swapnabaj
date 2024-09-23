import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../global_widget/date_time_formator.dart';
import '../../global_widget/global_button.dart';
import '../../global_widget/global_container.dart';
import '../../global_widget/global_textform_field.dart';
import '../../global_widget/input_decoration.dart';
import '../../global_widget/show_date_time_picker.dart';
import '../admin_login_screen/admin_login_screen.dart';

class AdminNoticesScreen extends StatefulWidget {
  const AdminNoticesScreen({super.key});

  @override
  _AdminNoticesScreenState createState() => _AdminNoticesScreenState();
}

class _AdminNoticesScreenState extends State<AdminNoticesScreen> {
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

  final TextEditingController selectNoticesDateCon = TextEditingController();

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
          'Swapnobaj',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
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
                        controller: selectNoticesDateCon,
                        titleText: 'Select Date',
                        hintText: "Select Date".tr,
                        titleStyle: const TextStyle(
                            color: ColorRes.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                        sufixIcon: GestureDetector(
                            onTap: () async {
                              var pickedDate = await showDateOnlyPicker(context);
                              if (pickedDate != null) {
                                String formattedDate = DateTimeFormatter
                                    .showDateOnlyYear
                                    .format(pickedDate);
                                setState(() {
                                  selectNoticesDateCon.text = formattedDate;
                                });
                              }
                            },
                            child: const Icon(Icons.calendar_month,
                                color: ColorRes.textColor, size: 20)),
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        titleText: 'Title',
                        hintText: 'Enter Title',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
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
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GlobalContainer(
                backgroundColor: ColorRes.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
