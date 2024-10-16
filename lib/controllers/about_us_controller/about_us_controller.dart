import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../global_widget/colors.dart';
import '../../models/about_us_model/about_us_model.dart';

class AboutUsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance; // Firebase Storage instance
  var aboutUsData = <AboutUsModel>[];

  final aboutUsDescriptionCon = TextEditingController();
  final ourVisionDescriptionCon = TextEditingController();
  final howWeOperateDescriptionCon = TextEditingController();
  final ourCommunityDescriptionCon = TextEditingController();
  final buildingLegacyDescriptionCon = TextEditingController();

  String? fileName; // To store the file name or URL
  bool isSubmitting = false; // Flag to prevent multiple submissions

  @override
  void onInit() {
    super.onInit();
    fetchAboutUsData(); // Fetch data when controller initializes
  }

  // Fetch About Us Data from Firestore
  Future<void> fetchAboutUsData() async {
    final snapshot = await _firestore.collection('aboutUsData').get();
    aboutUsData.clear();
    aboutUsData.addAll(snapshot.docs.map((doc) => AboutUsModel.fromDocument(doc.data(), doc.id)).toList());
    update(); // Notify UI to update
  }

  Future<void> submitAboutUsData() async {
    if (isSubmitting) return; // Prevent submission if a submission is in progress
    isSubmitting = true; // Set the flag to true to block further submissions

    if (aboutUsDescriptionCon.text.isEmpty) {
      Get.snackbar('Error', 'All  * fields must be completed', colorText: ColorRes.red);
      isSubmitting = false; // Reset the flag if there's an error
      return;
    }

    // Upload image file to Firebase Storage if fileName is available
    String? fileUrl;
    if (fileName != null) {
      fileUrl = await uploadFileToStorage(fileName!);
    }

    try {
      // Add News data to Firestore
      await _firestore.collection('aboutUsData').add({
        'aboutUsDescription': aboutUsDescriptionCon.text,
        'ourVisionDescription': ourVisionDescriptionCon.text,
        'howWeOperateDescription': howWeOperateDescriptionCon.text,
        'ourCommunityDescription': ourCommunityDescriptionCon.text,
        'buildingLegacyDescription': buildingLegacyDescriptionCon.text,
        'file_url': fileUrl, // Store file URL in Firestore
      });

      await fetchAboutUsData(); // Fetch updated data

      // Clear input fields, file name and notify success
      clearInputs();
      Get.snackbar('Success', 'About Us data saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save news data');
    } finally {
      isSubmitting = false; // Reset the flag after the submission completes
      update();
    }
  }

  Future<String> uploadFileToStorage(String filePath) async {
    String uniqueFileName = const Uuid().v1(); // Generate a unique file name
    File file = File(filePath); // File picked by the user

    try {
      TaskSnapshot taskSnapshot = await _storage.ref('aboutUs/$uniqueFileName').putFile(file); // Upload file to Firebase Storage
      return await taskSnapshot.ref.getDownloadURL(); // Return the download URL
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload file');
      return '';
    }
  }

  void clearInputs() {
    aboutUsDescriptionCon.clear();
    ourVisionDescriptionCon.clear();
    howWeOperateDescriptionCon.clear();
    ourCommunityDescriptionCon.clear();
    buildingLegacyDescriptionCon.clear();
    fileName = null;
  }

  @override
  void dispose() {
    aboutUsDescriptionCon.dispose();
    ourVisionDescriptionCon.dispose();
    howWeOperateDescriptionCon.dispose();
    ourCommunityDescriptionCon.dispose();
    buildingLegacyDescriptionCon.dispose();
    super.dispose();
  }
}
