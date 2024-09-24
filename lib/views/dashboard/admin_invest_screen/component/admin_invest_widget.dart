import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global_widget/colors.dart';
import '../../../../global_widget/global_text.dart';

class InvestTableWidget extends StatelessWidget {
  final String firstRow;
  final String secondRow;
  final String thirdRow;
  final String fourRow;

  const InvestTableWidget({
    super.key,
    required this.firstRow,
    required this.secondRow,
    required this.thirdRow,
    required this.fourRow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: Get.width,
      decoration: const BoxDecoration(
        color: ColorRes.secondaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
              ),
              border: Border(
                left: BorderSide(color: ColorRes.borderColor, width: 1),
                right: BorderSide(color: ColorRes.borderColor, width: 1),
                top: BorderSide(color: ColorRes.borderColor, width: 1),
                bottom: BorderSide(color: ColorRes.borderColor, width: 1),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: GlobalText(
                str: firstRow,
                color: ColorRes.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          Container(
            width: 90,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: ColorRes.borderColor, width: 1),
                top: BorderSide(color: ColorRes.borderColor, width: 1),
                bottom: BorderSide(color: ColorRes.borderColor, width: 1),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: GlobalText(
                  str: secondRow,
                  color: ColorRes.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: ColorRes.borderColor, width: 1),
                  top: BorderSide(color: ColorRes.borderColor, width: 1),
                  bottom: BorderSide(color: ColorRes.borderColor, width: 1),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: GlobalText(
                  str: thirdRow,
                  color: ColorRes.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ),
          Container(
            width: 75,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
              ),
              border: Border(
                right: BorderSide(color: ColorRes.borderColor, width: 1),
                top: BorderSide(color: ColorRes.borderColor, width: 1),
                bottom: BorderSide(color: ColorRes.borderColor, width: 1),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: GlobalText(
                str: fourRow,
                color: ColorRes.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvestTableValueWidget extends StatelessWidget {
  final String firstColumn;
  final String secondColumn;
  final String thirdColumn;
  final String fourColumn;

  const InvestTableValueWidget({
    super.key,
    required this.firstColumn,
    required this.secondColumn,
    required this.thirdColumn,
    required this.fourColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(color: ColorRes.borderColor, width: 1),
                    bottom: BorderSide(color: ColorRes.borderColor, width: 1),
                    right: BorderSide(color: ColorRes.borderColor, width: 1))),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Align(
              alignment: Alignment.center,
              child: GlobalText(
                str: firstColumn,
                color: ColorRes.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            width: 90,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: ColorRes.borderColor, width: 1),
                    right: BorderSide(color: ColorRes.borderColor, width: 1))),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Align(
              alignment: Alignment.center,
              child: GlobalText(
                str: secondColumn,
                color: ColorRes.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: ColorRes.borderColor, width: 1),
                      right:
                          BorderSide(color: ColorRes.borderColor, width: 1))),
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: GlobalText(
                    str: thirdColumn,
                    color: ColorRes.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 75,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: ColorRes.borderColor, width: 1),
                    right: BorderSide(color: ColorRes.borderColor, width: 1))),
            child: Center(
              child: GlobalText(
                str: fourColumn,
                color: ColorRes.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
