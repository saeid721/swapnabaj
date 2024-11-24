
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart';
import 'global_sizedbox.dart';
import 'global_text.dart';

class TrueFalseContainer extends StatelessWidget {
  final bool currentValue;
  final String trueText;
  final String falseText;
  final ValueChanged<bool> onChange;

  const TrueFalseContainer({
    super.key,
    required this.currentValue,
    required this.trueText,
    required this.falseText,
    required this.onChange,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(left: 5, right: 5, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: ColorRes.black.withOpacity(0.5)
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => onChange(true),
              child: Column(
                children: [
                  GlobalText(
                    str: trueText,
                    color: ColorRes.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    fontFamily: 'Rubik',
                  ),
                  sizedBoxH(3),
                  Container(
                    height: 5,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        color: currentValue ? ColorRes.textColor.withOpacity(0.7) : Colors.transparent,
                        borderRadius: BorderRadius.circular(4)
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onChange(false),
              highlightColor: Colors.black38,
              child: Column(
                children: [
                  GlobalText(
                    str: falseText,
                    color: ColorRes.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    fontFamily: 'Rubik',
                  ),

                  sizedBoxH(3),
                  Container(
                    height: 5,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        color: currentValue ? Colors.transparent : ColorRes.textColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4)
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

