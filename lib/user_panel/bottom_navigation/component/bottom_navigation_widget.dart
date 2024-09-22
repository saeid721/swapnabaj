import 'package:flutter/material.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_text.dart';
import '../../../global_widget/images.dart';

class GlobalMenuModel {
  final String imagePath; // Updated to accept image path
  final String text;

  GlobalMenuModel({required this.imagePath, required this.text});
}

class BottomNavigationWidget extends StatefulWidget {
  static const String id = "/dashboardScreen";
  final Function(int index)? onPress;
  const BottomNavigationWidget({super.key, this.onPress});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;

  void _onBottomBarTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<GlobalMenuModel> deshboardItem = [
    GlobalMenuModel(imagePath: Images.home, text: 'Home'),
    GlobalMenuModel(imagePath: Images.groupUsers, text: 'Members'),
    GlobalMenuModel(imagePath: Images.invest, text: 'Invest'),
    GlobalMenuModel(imagePath: Images.profit, text: 'Profit'),
    GlobalMenuModel(imagePath: Images.menu, text: 'Menu'),
  ];

  @override
  Widget build(BuildContext context) {
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
                  widget.onPress?.call(item.key);
                  _onBottomBarTapped(item.key);
                },
                child: Column(
                  children: [
                    Image.asset(
                      item.value.imagePath,
                      height: 25,
                      width: 25,
                      color: selectedIndex == item.key
                          ? ColorRes.capitalColor
                          : ColorRes.profitColor,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GlobalText(
                      str: item.value.text,
                      color: selectedIndex == item.key
                          ? ColorRes.capitalColor
                          : ColorRes.profitColor,
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
