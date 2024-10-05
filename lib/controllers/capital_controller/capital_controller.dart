import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';

class CapitalController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final List<Map<String, dynamic>> capitalData = [];

  final TextEditingController selectDepositDateCon = TextEditingController();
  final TextEditingController depositAmountCon = TextEditingController();
  String selectDepositorName = '0';
  String selectDepositPurpose = '0';

  @override
  void onInit() {
    super.onInit();
    fetchCapitalData();
  }

  void fetchCapitalData() {
    _firestore.collection('capitalData').snapshots().listen((snapshot) {
      capitalData.clear();
      capitalData.addAll(snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>));
      update();
    });
  }

  double get totalCapitalAmount {
    return capitalData.fold(0.0, (sum, item) => sum + (double.tryParse(item['amount'].toString()) ?? 0.0));
  }

  void updateCapitalData() {
    if (selectDepositorName.isNotEmpty && selectDepositPurpose.isNotEmpty && depositAmountCon.text.isNotEmpty) {
      _firestore.collection('capitalData').add({
        'date': selectDepositDateCon.text,
        'depositorName': selectDepositorName,
        'depositPurpose': selectDepositPurpose,
        'amount': double.tryParse(depositAmountCon.text) ?? 0.0,
      }).then((_) {
        selectDepositDateCon.clear();
        depositAmountCon.clear();
        selectDepositorName = '0';
        selectDepositPurpose = '0';
        fetchCapitalData();
        update();
      });
    } else {
      Get.snackbar('Error', 'Please fill in all fields.', backgroundColor: ColorRes.red, colorText: ColorRes.white);
    }
  }
}
