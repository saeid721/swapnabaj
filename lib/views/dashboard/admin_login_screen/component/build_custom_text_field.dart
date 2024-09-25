
import 'package:flutter/material.dart';

import '../../../../global_widget/colors.dart';

Widget buildCustomTextField(String hintText, IconData icon, {bool isPassword = false, Color? iconColor, Color? hintTextColor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor ?? Colors.grey, fontWeight: FontWeight.w400, fontSize: 13), // Dynamic hint text color
        prefixIcon: Icon(icon, color: iconColor ?? ColorRes.secondaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorRes.secondaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorRes.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ColorRes.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}