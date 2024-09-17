import 'package:flutter/material.dart';

import '../../widget/colors.dart';

class GlobalMenuModel {
  IconData icon;
  String text;

  GlobalMenuModel({required this.icon, required this.text});
}

class BottomNavigationWidget extends StatefulWidget {
  // static const String id = "/dashboardScreen";
  final Function(int index)? onPress;
  const BottomNavigationWidget({super.key, this.onPress});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;

  Color _onBottomBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    return Colors.grey.withOpacity(0.8);
  }

  List<GlobalMenuModel> deshboardItem = [
    GlobalMenuModel(icon: Icons.dashboard, text: 'Home'),
    GlobalMenuModel(icon: Icons.person_3, text: 'Members'),
    GlobalMenuModel(icon: Icons.inventory, text: 'Invest'),
    GlobalMenuModel(icon: Icons.bar_chart, text: 'Profit'),
    GlobalMenuModel(icon: Icons.menu_rounded, text: 'Menu'),
  ];

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return Container(
      height: 70,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: deshboardItem
                .asMap()
                .entries
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      widget.onPress!(item.key);
                      _onBottomBarTapped(item.key);
                    },
                    child: Column(
                      children: [
                        Icon(
                          item.value.icon,
                          size: 25,
                          color: selectedIndex == item.key
                              ? ColorRes.primaryColor
                              : ColorRes.green,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GlobalText(
                          str: item.value.text,
                          color: selectedIndex == item.key
                              ? ColorRes.primaryColor
                              : ColorRes.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                          fontFamily: 'Rubik',
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class GlobalText extends StatelessWidget {
  final String str;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? softwrap;
  final double? height;
  final String? fontFamily;

  const GlobalText({
    super.key,
    required this.str,
    this.fontWeight,
    this.fontSize,
    this.fontStyle,
    this.color,
    this.letterSpacing,
    this.decoration,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.softwrap,
    this.height,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final h = height ?? .08;
    final fw = fontSize ?? 14;
    final double fontHeight = h * fw;
    return Text(
      str,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softwrap,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration,
        height: height == null ? null : fontHeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
      ),
    );
  }
}
