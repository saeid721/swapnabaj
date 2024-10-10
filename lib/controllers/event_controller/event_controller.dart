import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/event_model/event_model.dart';

class EventController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<EventModel> eventsData = []; // Use EventModel list

  final TextEditingController selectEventDateCon = TextEditingController();
  final TextEditingController eventLocationCon = TextEditingController();
  final TextEditingController eventTitleCon = TextEditingController();
  final TextEditingController eventDescriptionCon = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchEventsData(); // Fetch data when controller initializes
  }

  // Fetch Event Data from Firestore
  void fetchEventsData() {
    _firestore.collection('eventsData').orderBy('date', descending: true).snapshots().listen((snapshot) {
      eventsData.clear();
      // Add event models with document IDs
      eventsData.addAll(snapshot.docs.map((doc) => EventModel.fromDocument(doc.data(), doc.id)));
      update(); // Notify UI to update
    });
  }

  // Submit Event Data to Firestore
  Future<void> submitEventsData() async {
    if (selectEventDateCon.text.isEmpty || eventLocationCon.text.isEmpty || eventTitleCon.text.isEmpty || eventDescriptionCon.text.isEmpty) {
      Get.snackbar('Error', 'All * fields must be completed', colorText: ColorRes.red);
      return;
    }

    try {
      // Add event data to Firestore
      await _firestore.collection('eventsData').add({
        'date': selectEventDateCon.text,
        'location': eventLocationCon.text,
        'title': eventTitleCon.text,
        'description': eventDescriptionCon.text,
      });

      // Clear input fields and notify success
      clearInputs();
      Get.snackbar('Success', 'Event data saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save event data', colorText: ColorRes.red);
    }
    update();
  }

  // Clear the input fields
  void clearInputs() {
    selectEventDateCon.clear();
    eventLocationCon.clear();
    eventTitleCon.clear();
    eventDescriptionCon.clear();
  }

  @override
  void dispose() {
    selectEventDateCon.dispose();
    eventLocationCon.dispose();
    eventTitleCon.dispose();
    eventDescriptionCon.dispose();
    super.dispose();
  }
}
