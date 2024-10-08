import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import 'charity_details.dart';

class CharityScreen extends StatefulWidget {
  const CharityScreen({super.key});

  @override
  State<CharityScreen> createState() => _CharityScreenState();
}

class _CharityScreenState extends State<CharityScreen> {
  final List<Map<String, dynamic>> charityItems = [
    {
      'number': '10,000',
      'title': 'Families received emergency relief',
      'image': 'assets/icons/sack.png',
      'date': '22/03/2024',
      'description': """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'number': '10',
      'title': 'Families received Tube wells',
      'image': 'assets/icons/tubeWells.png',
      'date': '23/03/2024',
      'description': """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'number': '500',
      'title': 'Families received of liters mineral water',
      'image': 'assets/icons/water.png',
      'date': '23/03/2024',
      'description': """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'number': '15',
      'title': 'Rickshaws have been given to people',
      'image': 'assets/icons/rickshaw.png',
      'date': '23/03/2024',
      'description': """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'number': '150',
      'title': 'Cloths have been given to people',
      'image': 'assets/icons/clothes.png',
      'date': '23/03/2024',
      'description': """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'number': '150',
      'title': 'Medicine have been given to people',
      'image': 'assets/icons/medicine.png',
      'date': '23/03/2024',
      'description': """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'number': '250',
      'title': 'Money have been given to people',
      'image': 'assets/icons/donation.png',
      'date': '23/03/2024',
      'description': """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    {
      'number': '150',
      'title': 'Charity Fund have been given to 150 people',
      'image': 'assets/icons/charityFund.png',
      'date': '23/03/2024',
      'description': """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""",
    },
    // Add more items as needed
  ];

  final TextEditingController selectNewsDateCon = TextEditingController();
  final TextEditingController selectTitleCon = TextEditingController();
  final TextEditingController selectDescriptionCon = TextEditingController();

  String? _fileName;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.primaryColor),
        centerTitle: true,
        title: const Text(
          'Charity',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() =>  SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              GlobalContainer(
                backgroundColor: ColorRes.backgroundColor,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: charityItems.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => CharityDetailsScreen(
                            imagePath: charityItems[index]['image'] ?? 'assets/images/placeholder.svg',
                            number: charityItems[index]['number'] ?? 'Number',
                            charityTitle: charityItems[index]['title'] ?? 'No Title',
                            date: charityItems[index]['date'] ?? 'No Date',
                            details: charityItems[index]['description'] ?? 'No Description',
                            index: index,
                          ));
                        },
                        child: Card(
                          margin: const EdgeInsets.only(top: 10),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GlobalContainer(
                                  width: Get.width,
                                  child: Image.asset(
                                    charityItems[index]['image'] ?? 'assets/images/placeholder.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                Text(
                                  charityItems[index]['number'] ?? 'Number',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: ColorRes.secondaryColor),
                                ),
                                Text(
                                  charityItems[index]['title'] ?? 'No Title',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: ColorRes.textColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    selectNewsDateCon.dispose();
    selectTitleCon.dispose();
    selectDescriptionCon.dispose();
    super.dispose();
  }

}
