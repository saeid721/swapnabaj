import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../global_widget/colors.dart';
import '../../models/gallery_model/gallery_model.dart';

class GalleryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  List<GalleryModel> galleryData = [];

  final galleryImageTitleCon = TextEditingController();
  final galleryImageDescriptionCon = TextEditingController();

  String? fileName; // To store the file name or URL
  bool isSubmitting = false; // Flag to prevent multiple submissions

  @override
  void onInit() {
    super.onInit();
    fetchGalleryData(); // Fetch gallery data when the controller is initialized
  }

  // Fetch Gallery Data from Firestore
  Future<void> fetchGalleryData() async {
    try {
      final snapshot = await _firestore.collection('galleryData').orderBy('date', descending: true).get();
      galleryData = snapshot.docs.map((doc) => GalleryModel.fromDocument(doc.data(), doc.id)).toList();
      update(); // Notify UI to update
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch gallery data');
    }
  }

  Future<void> submitGalleryData() async {
    if (isSubmitting) return; // Prevent submission if a submission is in progress
    isSubmitting = true; // Set the flag to true to block further submissions

    if (galleryImageTitleCon.text.isEmpty || galleryImageDescriptionCon.text.isEmpty) {
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
      // Add Gallery data to Firestore
      await _firestore.collection('galleryData').add({
        'date': DateTime.now(),
        'title': galleryImageTitleCon.text,
        'description': galleryImageDescriptionCon.text,
        'file_url': fileUrl, // Store file URL in Firestore
      });

      await fetchGalleryData(); // Fetch updated data

      // Clear input fields, file name and notify success
      clearInputs();
      Get.snackbar('Success', 'Image saved successfully');
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
      TaskSnapshot taskSnapshot = await _storage.ref('gallery/$uniqueFileName').putFile(file);
      return await taskSnapshot.ref.getDownloadURL(); // Return the download URL
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload file');
      return '';
    }
  }

  void clearInputs() {
    galleryImageTitleCon.clear();
    galleryImageDescriptionCon.clear();
    fileName = null;
  }

  @override
  void dispose() {
    galleryImageTitleCon.dispose();
    galleryImageDescriptionCon.dispose();
    super.dispose();
  }
}
