import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/member_model/member_model.dart';

class AdminMemberController extends GetxController {
  final memberNameCon = TextEditingController();
  final memberFatherNameCon = TextEditingController();
  final memberMotherNameCon = TextEditingController();
  final memberPhoneCon = TextEditingController();
  final memberEmailCon = TextEditingController();
  final memberAddressCon = TextEditingController();

  var members = <Member>[].obs;

  Future<void> submitData() async {
    await FirebaseFirestore.instance.collection('members').add({
      'name': memberNameCon.text,
      'father_name': memberFatherNameCon.text,
      'mother_name': memberMotherNameCon.text,
      'phone': memberPhoneCon.text,
      'email': memberEmailCon.text,
      'address': memberAddressCon.text,
      // file_name can be added if required
    });

    clearFields();
    await fetchMembers();
  }

  void clearFields() {
    memberNameCon.clear();
    memberFatherNameCon.clear();
    memberMotherNameCon.clear();
    memberPhoneCon.clear();
    memberEmailCon.clear();
    memberAddressCon.clear();
  }

  Future<void> fetchMembers() async {
    final snapshot = await FirebaseFirestore.instance.collection('members').get();
    members.assignAll(snapshot.docs.map((doc) => Member.fromDocument(doc.data(), doc.id)).toList());
  }
}
