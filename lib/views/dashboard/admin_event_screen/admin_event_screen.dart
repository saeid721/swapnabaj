import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/date_time_formator.dart';
import '../../../global_widget/global_button.dart';
import '../../../global_widget/global_container.dart';
import '../../../global_widget/global_textform_field.dart';
import '../../../global_widget/input_decoration.dart';
import '../../../global_widget/show_date_time_picker.dart';
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
          """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
    },
    {
      'title': 'Event 2',
      'date': 'April 15, 2024',
      'location': 'Location 2',
      'description':
          """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
    },
    {
      'title': 'Event 3',
      'date': 'April 10, 2024',
      'location': 'Location 3',
      'description':
          """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
    },
    {
      'title': 'Event 4',
      'date': 'April 02, 2024',
      'location': 'Location 4',
      'description':
          """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""",
    },
  ];

  final TextEditingController selectEventDateCon = TextEditingController();
  final TextEditingController selectNewsDateCon = TextEditingController();
  final TextEditingController selectTitleCon = TextEditingController();
  final TextEditingController selectDescriptionCon = TextEditingController();
  final TextEditingController selectLocationCon = TextEditingController();

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
          'Event',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() =>  SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                      GlobalTextFormField(
                        controller: selectEventDateCon,
                        titleText: 'Select Date',
                        hintText: "Select Date".tr,
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
                                  selectEventDateCon.text = formattedDate;
                                });
                              }
                            },
                            child: const Icon(Icons.calendar_month, color: ColorRes.textColor, size: 20)),
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: selectTitleCon,
                        titleText: 'Title',
                        hintText: 'Enter Title',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: selectLocationCon,
                        titleText: 'Location',
                        hintText: 'Enter Location',
                        isDense: true,
                        decoration: inputDropDecoration,
                        filled: true,
                      ),
                      const SizedBox(height: 10),
                      GlobalTextFormField(
                        controller: selectDescriptionCon,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    events[index]['title'],
                                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
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
                                  style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
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

  @override
  void dispose() {
    selectEventDateCon.dispose();
    selectNewsDateCon.dispose();
    selectTitleCon.dispose();
    selectDescriptionCon.dispose();
    selectLocationCon.dispose();
    super.dispose();
  }
}
