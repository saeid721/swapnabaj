import 'package:flutter/material.dart';
import 'package:swapnabaj/global_widget/global_sizedbox.dart';

import '../../../../global_widget/colors.dart';

const double cardHeight = 80.0;
const double imageWidth = 30.0;
const double imageHeight = 30.0;

class CatagoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color titleColor; // Add dynamic title color
  final VoidCallback onTap;

  const CatagoryCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.titleColor, // Add dynamic title color
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          height: cardHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorRes.white,
          ),
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
              sizedBoxW(10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: titleColor, // Apply dynamic title color
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
