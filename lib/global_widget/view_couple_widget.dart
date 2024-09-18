import 'package:flutter/material.dart';
import 'colors.dart';
import 'global_container.dart';
import 'global_text.dart';

class ViewCoupleTextWidget extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final double? firstTextSize;
  final double? secondTextSize;
  final Color? secondTextColor;

  const ViewCoupleTextWidget(
      {super.key,
      this.firstText,
      this.secondText,
      this.firstTextSize,
      this.secondTextSize,
      this.secondTextColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalContainer(
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                str: "$firstText",
                color: ColorRes.primaryColor,
                fontSize: firstTextSize ?? 13,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),
            ],
          ),
        ),
        Expanded(
          child: GlobalContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: "$secondText",
                  color: secondTextColor ?? ColorRes.primaryColor,
                  fontSize: secondTextSize ?? 13,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
