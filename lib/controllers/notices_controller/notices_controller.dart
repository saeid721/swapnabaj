import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/notices_model/notices_model.dart';

class NoticesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var noticesData = <NoticesModel>[];

  final selectNoticeDateCon = TextEditingController();
  final noticeTitleCon = TextEditingController();
  final noticeDescriptionCon = TextEditingController();

  bool isSubmitting = false; // Flag to prevent multiple submissions

  @override
  void onInit() {
    super.onInit();
    fetchNoticeData();
  }

  // Fetch Notices Data from Firestore
  Future<void> fetchNoticeData() async {
    final snapshot = await _firestore.collection('noticesData').orderBy('date', descending: true).get();
    noticesData.clear();
    noticesData.addAll(snapshot.docs.map((doc) => NoticesModel.fromDocument(doc.data(), doc.id)).toList());
    update(); // Notify UI to update
  }

  Future<void> submitNoticeData() async {
    if (isSubmitting) return; // Prevent submission if a submission is in progress
    isSubmitting = true; // Set the flag to true to block further submissions

    if (selectNoticeDateCon.text.isEmpty || noticeTitleCon.text.isEmpty || noticeDescriptionCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
      isSubmitting = false; // Reset the flag if there's an error
      return;
    }

    try {
      // Add Notice data to Firestore
      await _firestore.collection('noticesData').add({
        'date': selectNoticeDateCon.text,
        'title': noticeTitleCon.text,
        'description': noticeDescriptionCon.text,
      });

      await fetchNoticeData(); // Fetch updated data

      // Clear input fields, file name and notify success
      clearInputs();
      Get.snackbar('Success', 'Notice data saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save news data');
    } finally {
      isSubmitting = false; // Reset the flag after the submission completes
      update();
    }
  }

  void clearInputs() {
    selectNoticeDateCon.clear();
    noticeTitleCon.clear();
    noticeDescriptionCon.clear();
  }

  @override
  void dispose() {
    selectNoticeDateCon.dispose();
    noticeTitleCon.dispose();
    noticeDescriptionCon.dispose();
    super.dispose();
  }
}
