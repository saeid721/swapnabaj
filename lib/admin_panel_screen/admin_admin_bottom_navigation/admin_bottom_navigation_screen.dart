import 'package:flutter/material.dart';
import '../admin_home_screen/admin_home_screen.dart';
import '../admin_profit_screen/admin_profit_screen.dart';
import '../admin_side_menu_screen.dart';
import '../admin_invest_screen/admin_invest_screen.dart';
import '../admin_member_screen/admin_member_screen.dart';
import 'component/bottom_navigation_widget.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const String id = "/dashboardScreen";
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static final List<Widget> _deshBoardBottomScreen = <Widget>[
    //const HomeScreen(),
    const AdminHomeScreen(),
    const MemberScreen(),
    const AdminInvestScreen(),
    const AdminProfitScreen(),
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
