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

class AdminEventScreen extends StatefulWidget {
  const AdminEventScreen({super.key});

  @override
  State<AdminEventScreen> createState() => _AdminEventScreenState();
}

class _AdminEventScreenState extends State<AdminEventScreen> {
  final List<Map<String, dynamic>> events = [
    {
      'title': 'Event 1',
      'date': 'April 24, 2024',
      'location': 'Location 1',
      'description':
      "Bangladesh Restaurant Owners' Association Secretary General Md Imran Hasan said this during the inspection of the burnt building on Bailey Road on Sunday.",
    },
    {
      'title': 'Event 2',
      'date': 'April 15, 2024',
      'location': 'Location 2',
      'description':
      "Bangladesh Restaurant Owners' Association Secretary General Md Imran Hasan said this during the inspection of the burnt building on Bailey Road on Sunday.",
    },
    {
      'title': 'Event 3',
      'date': 'April 10, 2024',
      'location': 'Location 3',
      'description':
      "Bangladesh Restaurant Owners' Association Secretary General Md Imran Hasan said this during the inspection of the burnt building on Bailey Road on Sunday.",
    },
    {
      'title': 'Event 4',
      'date': 'April 02, 2024',
      'location': 'Location 4',
      'description':
      "Bangladesh Restaurant Owners' Association Secretary General Md Imran Hasan said this during the inspection of the burnt building on Bailey Road on Sunday.",
    },
  ];

  final TextEditingController selectEventDateCon = TextEditingController();

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
              const SizedBox(height: 10),
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
                        controller: selectEventDateCon,
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
                                  selectEventDateCon.text = formattedDate;
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
                elevation: 1,
                borderRadius: 8,
                child: SizedBox(
                  height: 300, // Set a height for the list view
                  child: ListView.builder(
                    itemCount: events.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(top: 3, bottom: 3),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  events[index]['title'],
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
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
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                events[index]['location'],
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                events[index]['description'],
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          onTap: () {
                            _showEventDetails(context, events[index]);
                          },
                        ),
                      );
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

  void _showEventDetails(BuildContext context, Map<String, dynamic> event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event['title']),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Date: ${event['date']}'),
              Text('Location: ${event['location']}'),
              const SizedBox(height: 10.0),
              Text(event['description']),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
