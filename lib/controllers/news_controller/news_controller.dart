import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../global_widget/colors.dart';
import '../../models/news_model/news_model.dart';

class NewsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  //var newsData = <NewsModel>[];
  List<NewsModel> newsData = [];

  final newsDateCon = TextEditingController();
  final newsTitleCon = TextEditingController();
  final newsDescriptionCon = TextEditingController();

  String? fileName; // To store the file name or URL
  bool isSubmitting = false; // Flag to prevent multiple submissions

  @override
  void onInit() {
    super.onInit();
    fetchNewsData();
  }

  // Fetch News Data from Firestore
  Future<void> fetchNewsData() async {
    final snapshot = await _firestore.collection('newsData').orderBy('date', descending: true).get();
    newsData.clear();
    newsData.addAll(snapshot.docs.map((doc) => NewsModel.fromDocument(doc.data(), doc.id)).toList());
    update(); // Notify UI to update
  }

  Future<void> submitNewsData() async {
    if (isSubmitting) return; // Prevent submission if a submission is in progress
    isSubmitting = true; // Set the flag to true to block further submissions

    if (newsDateCon.text.isEmpty || newsTitleCon.text.isEmpty || newsDescriptionCon.text.isEmpty) {
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
      // Add News data to Firestore
      await _firestore.collection('newsData').add({
        'date': newsDateCon.text,
        'title': newsTitleCon.text,
        'description': newsDescriptionCon.text,
        'file_url': fileUrl, // Store file URL in Firestore
      });

      await fetchNewsData(); // Fetch updated data

      // Clear input fields, file name and notify success
      clearInputs();
      Get.snackbar('Success', 'News data saved successfully');
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
      TaskSnapshot taskSnapshot = await _storage.ref('news/$uniqueFileName').putFile(file);
      return await taskSnapshot.ref.getDownloadURL(); // Return the download URL
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload file');
      return '';
    }
  }

  void clearInputs() {
    newsDateCon.clear();
    newsTitleCon.clear();
    newsDescriptionCon.clear();
    fileName = null;
  }

  @override
  void dispose() {
    newsDateCon.dispose();
    newsTitleCon.dispose();
    newsDescriptionCon.dispose();
    super.dispose();
  }
}
