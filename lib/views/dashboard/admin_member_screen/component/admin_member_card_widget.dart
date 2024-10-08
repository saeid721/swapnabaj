import 'package:flutter/material.dart';

import '../../../../global_widget/colors.dart';

class MemberCardTableWidget extends StatelessWidget {
  final int flex;
  final String text;

  const MemberCardTableWidget({
    super.key,
    required this.flex,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: 45,
        child: Container(
          decoration: const BoxDecoration(
            color: ColorRes.secondaryColor,
            border: Border(
              top: BorderSide(color: ColorRes.borderColor, width: 1),
              bottom: BorderSide(color: ColorRes.borderColor, width: 1),
              left: BorderSide(color: ColorRes.borderColor, width: 1),
              right: BorderSide(color: ColorRes.borderColor, width: 1),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: ColorRes.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MemberCardTableValueWidget extends StatelessWidget {
  final String memberId;
  final String name;
  final String fatherName;
  final String motherName;
  final String contact;
  final String nid;
  final String email;
  final String address;
  final String imagePath;

  const MemberCardTableValueWidget({
    super.key,
    required this.memberId,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.contact,
    required this.nid,
    required this.email,
    required this.address,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: buildContainer(
            Center(child: Text(memberId, style: const TextStyle(fontSize: 12))),
          ),
        ),
        Expanded(
          flex: 7,
          child: buildContainer(
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                          color: ColorRes.textColor
                      )),
                  Text(fatherName,
                      style: const TextStyle(
                        fontSize: 12,
                          color: ColorRes.textColor
                      )),
                  Text(motherName,
                      style: const TextStyle(
                        fontSize: 12,
                          color: ColorRes.textColor
                      )),
                  Text(contact,
                      style: const TextStyle(
                        fontSize: 12,
                          color: ColorRes.textColor
                      )),
                  Text(nid,
                      style: const TextStyle(
                        fontSize: 12,
                          color: ColorRes.textColor
                      )),
                  Text(email,
                      style: const TextStyle(
                        fontSize: 12,
                          color: ColorRes.textColor
                      )),
                  Text(address,
                      style: const TextStyle(
                        fontSize: 10,
                        color: ColorRes.textColor
                      )),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: buildContainer(
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(imagePath, width: 250, fit: BoxFit.contain),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContainer(Widget child) {
    return SizedBox(
      height: 160,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorRes.borderColor, width: 1),
            right: BorderSide(color: ColorRes.borderColor, width: 1),
            left: BorderSide(color: ColorRes.borderColor, width: 1),
          ),
        ),
        child: child,
      ),
    );
  }
}
