import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/news_model.dart';

class NewsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance; // Firebase Storage instance
  var newsData = <NewsModel>[];

  final newsDateCon = TextEditingController();
  final newsTitleCon = TextEditingController();
  final newsDescriptionCon = TextEditingController();

  String? fileName; // To store the file name or URL

  @override
  void onInit() {
    super.onInit();
    fetchNewsData(); // Fetch data when controller initializes
  }

  // Fetch News Data from Firestore
  Future<void> fetchNewsData() async {
    final snapshot = await _firestore.collection('newsData').orderBy('date', descending: true).get();
    newsData.clear();
    newsData.addAll(snapshot.docs.map((doc) => NewsModel.fromDocument(doc.data(), doc.id)).toList());
    update(); // Notify UI to update
  }
  Future<void> submitNewsData() async {
    if (newsDateCon.text.isEmpty || newsTitleCon.text.isEmpty || newsDescriptionCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
      return;
    }

    // Upload image file to Firebase Storage if fileName is available
    String? fileUrl;
    if (fileName != null) {
      fileUrl = await uploadFileToStorage(fileName!);
    }

    // Add News data to Firestore
    await _firestore.collection('newsData').add({
      'date': newsDateCon.text,
      'title': newsTitleCon.text,
      'description': newsDescriptionCon.text,
      'file_url': fileUrl, // Store file URL in Firestore
    });
    await fetchNewsData();

    // Clear input fields, file name and notify success
    clearInputs();
    Get.snackbar('Success', 'News data saved successfully');
    update();
  }

  Future<String> uploadFileToStorage(String filePath) async {
    String uniqueFileName = newsTitleCon.text; // Generate a unique file name
    File file = File(filePath); // File picked by the user

    try {
      TaskSnapshot taskSnapshot = await _storage.ref('news/$uniqueFileName').putFile(file); // Upload file to Firebase Storage
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
    fileName = null; // Clear the file name as well
  }

  @override
  void dispose() {
    newsDateCon.dispose();
    newsTitleCon.dispose();
    newsDescriptionCon.dispose();
    super.dispose();
  }
}
