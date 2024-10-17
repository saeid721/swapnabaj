import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/member_model/member_model.dart';

class MembersController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance; // Firebase Storage instance
  //var membersData = <MemberModel>[];
  List<MemberModel> membersData = [];


  final memberNameCon = TextEditingController();
  final memberFatherNameCon = TextEditingController();
  final memberMotherNameCon = TextEditingController();
  final memberNidCon = TextEditingController();
  final memberPhoneCon = TextEditingController();
  final memberEmailCon = TextEditingController();
  final memberAddressCon = TextEditingController();

  String? fileName; // To store the file name or URL

  @override
  void onInit() {
    super.onInit();
    fetchMembersData(); // Fetch data when controller initializes
  }

  // Fetch Member Data from Firestore and sort by memberId descending
  Future<void> fetchMembersData() async {
    final snapshot = await _firestore.collection('membersData').get();
    membersData.clear();
    membersData.addAll(snapshot.docs.map((doc) => MemberModel.fromDocument(doc.data(), doc.id)).toList());
    update(); // Notify UI to update
  }

  Future<void> submitMemberData() async {
    if (memberNameCon.text.isEmpty || memberFatherNameCon.text.isEmpty || memberMotherNameCon.text.isEmpty || memberPhoneCon.text.isEmpty || memberEmailCon.text.isEmpty || memberAddressCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
      return;
    }

    // Upload image file to Firebase Storage if fileName is available
    String? fileUrl;
    if (fileName != null) {
      fileUrl = await uploadFileToStorage(fileName!);
    }

    // Add member data to Firestore
    await _firestore.collection('membersData').add({
      'name': memberNameCon.text,
      'father_name': memberFatherNameCon.text,
      'mother_name': memberMotherNameCon.text,
      'nid': memberNidCon.text,
      'phone': memberPhoneCon.text,
      'email': memberEmailCon.text,
      'address': memberAddressCon.text,
      'file_url': fileUrl, // Store file URL in Firestore
    });
    await fetchMembersData();

    // Clear input fields and notify success
    clearInputs();
    Get.snackbar('Success', 'Member data saved successfully');
    update();
  }

  Future<String> uploadFileToStorage(String filePath) async {
    String uniqueFileName = memberNameCon.text; // Generate a unique file name
    File file = File(filePath); // File picked by the user

    try {
      TaskSnapshot taskSnapshot = await _storage.ref('members/$uniqueFileName').putFile(file); // Upload file to Firebase Storage
      return await taskSnapshot.ref.getDownloadURL(); // Return the download URL
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload file');
      return '';
    }
  }

  void clearInputs() {
    memberNameCon.clear();
    memberFatherNameCon.clear();
    memberMotherNameCon.clear();
    memberNidCon.clear();
    memberPhoneCon.clear();
    memberEmailCon.clear();
    memberAddressCon.clear();
    fileName = null; // Clear the file name as well
  }
}
