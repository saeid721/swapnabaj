import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../global_widget/colors.dart';
import '../../models/about_us_model/update.dart';

class AboutUsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  AboutUsModel? aboutUsData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

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

  // Fetch About Us Data from Firestore (READ)
  Future<void> fetchAboutUsData() async {
    _isLoading = true;
    update();
    try {
      final snapshot = await _firestore.collection('aboutUsData').get();
      if (snapshot.docs.isNotEmpty) {
        aboutUsData = AboutUsModel.fromDocument(
          snapshot.docs.first.data(),
          snapshot.docs.first.id,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load data');
    } finally {
      _isLoading = false;
      update();
    }
  }

  // Create About Us Data in Firestore (CREATE)
  Future<void> submitAboutUsData() async {
    if (isSubmitting) return; // Prevent multiple submissions
    isSubmitting = true;

    if (aboutUsDescriptionCon.text.isEmpty) {
      Get.snackbar('Error', 'All * fields must be completed',
          colorText: ColorRes.red);
      isSubmitting = false;
      return;
    }

    String? fileUrl;
    if (fileName != null) {
      fileUrl = await uploadFileToStorage(fileName!);
    }

    try {
      await _firestore.collection('aboutUsData').add({
        'aboutUsDescription': aboutUsDescriptionCon.text,
        'ourVisionDescription': ourVisionDescriptionCon.text,
        'howWeOperateDescription': howWeOperateDescriptionCon.text,
        'ourCommunityDescription': ourCommunityDescriptionCon.text,
        'buildingLegacyDescription': buildingLegacyDescriptionCon.text,
        'file_url': fileUrl,
      });

      await fetchAboutUsData();
      clearInputs();
      Get.snackbar('Success', 'About Us data saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data');
    } finally {
      isSubmitting = false;
    }
  }

  // Update About Us Data in Firestore (UPDATE)
  Future<void> updateAboutUsData(String docId) async {
    String? fileUrl;
    if (fileName != null) {
      fileUrl = await uploadFileToStorage(fileName!);
    }

    try {
      await _firestore.collection('aboutUsData').doc(docId).update({
        'aboutUsDescription': aboutUsDescriptionCon.text,
        'ourVisionDescription': ourVisionDescriptionCon.text,
        'howWeOperateDescription': howWeOperateDescriptionCon.text,
        'ourCommunityDescription': ourCommunityDescriptionCon.text,
        'buildingLegacyDescription': buildingLegacyDescriptionCon.text,
        if (fileUrl != null) 'file_url': fileUrl,
      });

      await fetchAboutUsData();
      Get.snackbar('Success', 'About Us data updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update data');
    }
  }

  // Delete About Us Data from Firestore (DELETE)
  Future<void> deleteAboutUsData(String docId) async {
    try {
      await _firestore.collection('aboutUsData').doc(docId).delete();
      await fetchAboutUsData();
      Get.snackbar('Success', 'About Us data deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete data');
    }
  }

  // Upload image to Firebase Storage
  Future<String> uploadFileToStorage(String filePath) async {
    String uniqueFileName = const Uuid().v1();
    File file = File(filePath);

    try {
      TaskSnapshot taskSnapshot =
      await _storage.ref('aboutUs/$uniqueFileName').putFile(file);
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload file');
      return '';
    }
  }

  // Clear input fields
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
