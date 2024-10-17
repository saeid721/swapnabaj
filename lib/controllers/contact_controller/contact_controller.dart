import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/contact_model/contact_model.dart';

class ContactController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var contactData = <ContactModel>[];

  final phoneCon = TextEditingController();
  final emailCon = TextEditingController();
  final websiteCon = TextEditingController();
  final addressCon = TextEditingController();

  bool isSubmitting = false; // Flag to prevent multiple submissions

  @override
  void onInit() {
    super.onInit();
    fetchContactData(); // Fetch data when controller initializes
  }

  // Fetch Contact Us Data from Firestore
  Future<void> fetchContactData() async {
    final snapshot = await _firestore.collection('contactData').get();
    contactData.clear();
    contactData.addAll(snapshot.docs.map((doc) => ContactModel.fromDocument(doc.data(), doc.id)).toList());
    update(); // Notify UI to update
  }

  Future<void> submitContactData() async {
    if (isSubmitting) return; // Prevent submission if a submission is in progress
    isSubmitting = true; // Set the flag to true to block further submissions

    if (phoneCon.text.isEmpty) {
      Get.snackbar('Error', 'All  * fields must be completed', colorText: ColorRes.red);
      isSubmitting = false; // Reset the flag if there's an error
      return;
    }

    try {
      // Add Contact data to Firestore
      await _firestore.collection('contactData').add({
        'phone': phoneCon.text,
        'email': emailCon.text,
        'website': websiteCon.text,
        'address': addressCon.text,
      });

      await fetchContactData(); // Fetch updated data

      // Clear input fields, file name and notify success
      clearInputs();
      Get.snackbar('Success', 'Contact Us data saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save news data');
    } finally {
      isSubmitting = false; // Reset the flag after the submission completes
      update();
    }
  }

  void clearInputs() {
    phoneCon.clear();
    emailCon.clear();
    websiteCon.clear();
    addressCon.clear();
  }

  @override
  void dispose() {
    phoneCon.dispose();
    emailCon.dispose();
    websiteCon.dispose();
    addressCon.dispose();
    super.dispose();
  }
}
