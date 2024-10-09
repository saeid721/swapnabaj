import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../../models/member_model/member_model.dart';

class MembersController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var membersData = <Member>[];

  final memberNameCon = TextEditingController();
  final memberFatherNameCon = TextEditingController();
  final memberMotherNameCon = TextEditingController();
  final memberPhoneCon = TextEditingController();
  final memberEmailCon = TextEditingController();
  final memberAddressCon = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchMembersData(); // Fetch data when controller initializes
  }

// Fetch Member Data from Firestore and sort by memberId descending
  Future<void> fetchMembersData() async {
    final snapshot = await _firestore.collection('membersData').get();
    membersData.clear();
    membersData.addAll(snapshot.docs.map((doc) => Member.fromDocument(doc.data(), doc.id)).toList());
    update(); // Notify UI to update
  }

  Future<void> submitMemberData() async {
    if (memberNameCon.text.isEmpty || memberFatherNameCon.text.isEmpty || memberMotherNameCon.text.isEmpty || memberPhoneCon.text.isEmpty || memberEmailCon.text.isEmpty || memberAddressCon.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be completed', colorText: ColorRes.red);
      return;
    }

    await FirebaseFirestore.instance.collection('membersData').add({
      'name': memberNameCon.text,
      'father_name': memberFatherNameCon.text,
      'mother_name': memberMotherNameCon.text,
      'phone': memberPhoneCon.text,
      'email': memberEmailCon.text,
      'address': memberAddressCon.text,
      // file_name can be added if required
    });
    await fetchMembersData();

    // Clear input fields and notify success
    clearInputs();
    Get.snackbar('Success', 'Member data saved successfully');
    update();
  }

  void clearInputs() {
    memberNameCon.clear();
    memberFatherNameCon.clear();
    memberMotherNameCon.clear();
    memberPhoneCon.clear();
    memberEmailCon.clear();
    memberAddressCon.clear();
  }
}
