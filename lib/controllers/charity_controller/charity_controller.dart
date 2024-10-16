import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../global_widget/colors.dart';
import '../../models/charity_model/charity_model.dart';

class CharityController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var charityData = <CharityModel>[];

  final selectCharityDateCon = TextEditingController();
  final charityTitleCon = TextEditingController();
  final charityNumberCon = TextEditingController();
  final charityDescriptionCon = TextEditingController();

  String? fileName; // To store the file name or URL
  bool isSubmitting = false; // Flag to prevent multiple submissions

  @override
  void onInit() {
    super.onInit();
    fetchCharityData();
  }

  // Fetch Charity Data from Firestore
  Future<void> fetchCharityData() async {
    final snapshot = await _firestore.collection('charityData').orderBy('date', descending: true).get();
    charityData.clear();
    charityData.addAll(snapshot.docs.map((doc) => CharityModel.fromDocument(doc.data(), doc.id)).toList());
    update(); // Notify UI to update
  }

  Future<void> submitCharityData() async {
    if (isSubmitting) return; // Prevent submission if a submission is in progress
    isSubmitting = true; // Set the flag to true to block further submissions

    if (selectCharityDateCon.text.isEmpty || charityTitleCon.text.isEmpty || charityNumberCon.text.isEmpty || charityDescriptionCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
      isSubmitting = false; // Reset the flag if there's an error
      return;
    }

    // Upload image file to Firebase Storage if fileName is available
    String? fileUrl;
    if (fileName != null) {
      fileUrl = await uploadFileToStorage(fileName!);
    }

    try {
      // Add Charity data to Firestore
      await _firestore.collection('charityData').add({
        'date': selectCharityDateCon.text,
        'title': charityTitleCon.text,
        'number': charityNumberCon.text,
        'description': charityDescriptionCon.text,
        'file_url': fileUrl, // Store file URL in Firestore
      });

      await fetchCharityData(); // Fetch updated data

      // Clear input fields, file name and notify success
      clearInputs();
      Get.snackbar('Success', 'Charity data saved successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save Charity data');
    } finally {
      isSubmitting = false; // Reset the flag after the submission completes
      update();
    }
  }

  Future<String> uploadFileToStorage(String filePath) async {
    String uniqueFileName = const Uuid().v1(); // Generate a unique file name
    File file = File(filePath); // File picked by the user

    try {
      TaskSnapshot taskSnapshot = await _storage.ref('charity/$uniqueFileName').putFile(file);
      return await taskSnapshot.ref.getDownloadURL(); // Return the download URL
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload file');
      return '';
    }
  }

  void clearInputs() {
    selectCharityDateCon.clear();
    charityTitleCon.clear();
    charityNumberCon.clear();
    charityDescriptionCon.clear();
    fileName = null;
  }

  @override
  void dispose() {
    selectCharityDateCon.dispose();
    charityTitleCon.dispose();
    charityNumberCon.dispose();
    charityDescriptionCon.dispose();
    super.dispose();
  }
}
