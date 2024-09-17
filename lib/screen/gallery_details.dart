import 'package:flutter/material.dart';
import 'widget/colors.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String details;
  final int index;
  const DetailsPage(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.details,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        //centerTitle: true,
        title: const Text(
          'Future Hope Development Association',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorRes.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo$index',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: SizedBox(
              height: 500,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        color: ColorRes.primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      details,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
