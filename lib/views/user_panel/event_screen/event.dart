import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/event_controller/event_controller.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../../models/event_model/event_model.dart';
import '../../dashboard/admin_login_screen/login_screen.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final EventController controller = Get.put(EventController());

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
              Get.to(() => const SignInScreen());
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
                GetBuilder<EventController>(builder: (eventController) {
                  if (eventController.eventsData.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Events Found',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    );
                  }
                  return GlobalContainer(
                    backgroundColor: ColorRes.backgroundColor,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: eventController.eventsData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final event = eventController.eventsData[index];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              event.title,
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        event.location,
                                        style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        event.date,
                                        style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  event.description,
                                  style: const TextStyle(fontSize: 14),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            onTap: () {
                              _showEventDetails(context, event);
                            },
                          ),
                        );
                      },
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
  void _showEventDetails(BuildContext context, EventModel event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GlobalContainer(
            backgroundColor: ColorRes.white,
            width: Get.width,
            borderRadius: 10,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjusts size based on content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  event.title,
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        event.location,
                        style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Date: ${event.date}',
                        style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(event.description),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
