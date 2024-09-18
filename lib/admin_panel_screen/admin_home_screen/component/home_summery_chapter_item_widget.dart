import 'package:flutter/material.dart';
import '../../../global_widget/colors.dart';

class HomeSummeryChapterItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String blance;
  final Color backgroundColor;
  final Color titleColor; // Dynamic title color
  final Color blanceColor; // Dynamic blance color
  final Color borderColor; // Dynamic border color

  const HomeSummeryChapterItem({
    required this.title,
    required this.onTap,
    required this.blance,
    this.backgroundColor = Colors.white, // Default background color
    this.titleColor = ColorRes.primaryColor, // Default title color
    this.blanceColor = ColorRes.primaryColor, // Default blance color
    this.borderColor = ColorRes.secondaryColor, // Default border color
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        elevation: 1.0,
        shadowColor: Colors.black.withOpacity(0.25),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
            border: Border(
              bottom: BorderSide(
                color: borderColor, // Apply dynamic border color
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: titleColor, // Apply dynamic title color
                ),
              ),
              Text(
                blance,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: blanceColor, // Apply dynamic blance color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
