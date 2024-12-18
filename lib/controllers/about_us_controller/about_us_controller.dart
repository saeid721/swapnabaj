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
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var aboutUsData = <AboutUsModel>[];

  final aboutUsDescriptionCon = TextEditingController();
  final ourVisionDescriptionCon = TextEditingController();
  final howWeOperateDescriptionCon = TextEditingController();
  final ourCommunityDescriptionCon = TextEditingController();
  final buildingLegacyDescriptionCon = TextEditingController();

  String? fileName;
  bool isSubmitting = false;
  var isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchAboutUsData();
  }

  Future<void> fetchAboutUsData() async {
    final snapshot = await _firestore.collection('aboutUsData').get();
    aboutUsData.clear();
    aboutUsData.addAll(
      snapshot.docs.map((doc) => AboutUsModel.fromDocument(doc.data(), doc.id)).toList(),
    );
    update();
  }

  Future<void> submitAboutUsData() async {
    if (isSubmitting) return;
    isSubmitting = true;

    if (aboutUsDescriptionCon.text.isEmpty) {
      Get.snackbar('Error', 'All * fields must be completed', colorText: ColorRes.red);
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
      Get.snackbar('Error', 'Failed to save About Us data');
    } finally {
      isSubmitting = false;
      update();
    }
  }

  Future<String> uploadFileToStorage(String filePath) async {
    String uniqueFileName = const Uuid().v1();
    File file = File(filePath);

    try {
      TaskSnapshot taskSnapshot = await _storage.ref('aboutUs/$uniqueFileName').putFile(file);
      return await taskSnapshot.ref.getDownloadURL();
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
