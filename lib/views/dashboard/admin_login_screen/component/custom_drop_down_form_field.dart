
import 'package:flutter/material.dart';

import '../../../../global_widget/colors.dart';

class CustomDropDownFormField extends StatelessWidget {
  final String? value;
  final String hintText;
  final Color? hintTextColor;
  final bool isDense;
  final bool filled;
  final List<String> items;
  final Icon sufixIcon;
  final Function(String?)? onChanged;
  final Color? prefixIconColor;

  const CustomDropDownFormField({
    super.key,
    required this.value,
    required this.hintText,
    this.hintTextColor,
    this.isDense = false,
    this.filled = false,
    required this.items,
    required this.sufixIcon,
    this.onChanged,
    this.prefixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor ?? Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
          filled: true,
          fillColor: ColorRes.white,
          prefixIcon: Icon(Icons.person, color: prefixIconColor ?? ColorRes.textColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: ColorRes.borderColor),
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
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value!.isNotEmpty ? value : null,
            hint: Text(
              hintText,
              style: TextStyle(
                color: hintTextColor ?? Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            isDense: isDense,
            isExpanded: true,
            icon: sufixIcon,
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
