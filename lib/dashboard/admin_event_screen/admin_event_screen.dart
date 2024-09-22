import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../admin_login_screen/admin_login_screen.dart';

class AdminEventScreen extends StatelessWidget {
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
      'location': 'Location 3',
      'description':
          "Bangladesh Restaurant Owners' Association Secretary General Md Imran Hasan said this during the inspection of the burnt building on Bailey Road on Sunday.",
    },
  ];

  AdminEventScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Card(
              margin:
              const EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
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
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      events[index]['location'],
                      style: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w700),
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
