import 'package:flutter/material.dart';
import '../../global_widget/colors.dart';
import '../bottom_navigation/component/bottom_navigation_widget.dart'; // Import the path correctly

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.primaryColor),
        centerTitle: false,
        title: const Text(
          'Swapnobaj',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Address:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Bogura, Dhaka, Bangladesh',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Phone:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '+88 01703 030 721',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Email:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'info@swapnobaj.com',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Website:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'www.swapnobaj.com',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        onPress: (index) {
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/homeScreen');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/memberScreen');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/investScreen');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/profitScreen');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/sideMenuScreen');
              break;
          }
        },
      ),
    );
  }
}
