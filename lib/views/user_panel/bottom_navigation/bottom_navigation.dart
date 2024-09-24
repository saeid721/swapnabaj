import 'package:flutter/material.dart';
import '../home_screen/home_screen.dart';
import '../profit_screen/profit_screen.dart';
import '../invest_screen/invest_screen.dart';
import '../member_screen/member_screen.dart';
import '../side_menu_screen.dart';
import 'component/bottom_navigation_widget.dart';

class BottomNavigation extends StatefulWidget {
  static const String id = "/dashboardScreen";
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static final List<Widget> _deshBoardBottomScreen = <Widget>[
    const HomeScreen(),
    const MemberScreen(),
    const InvestScreen(),
    const ProfitScreen(),
    const SideMenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _deshBoardBottomScreen.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationWidget(
        onPress: _onItemTapped,
      ),
    );
  }
}
