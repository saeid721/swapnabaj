import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../admin_login_screen/admin_login_screen.dart';
import 'admin_gallery_details_screen.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'assets/images/10.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/02.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/03.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/05.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/06.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/07.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/08.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/09.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/01.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/10.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/02.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/03.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/04.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/05.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        "Bangladesh Restaurant Owners Association (Broa) has asked permission to import chicken, beef and mutton in the face of commodity price hikes in the kitchen market. \nThe organisation also demanded effective market management to control the soaring prices of most products, including fish, meat, eggs, potatoes and onions, in recent times. \nDuring a press conference held at the Police Convention Center in the capital yesterday, the association leaders proposed to reduce the tax rate along with tax exemption to sustain the restaurant sector.\n 'Inflation has been rising at a rate of more than 8% over the past few months, which is reducing the purchasing power of the people. This is affecting the restaurant sector and the daily sales of most restaurants have come down to a great extent,' Broa Secretary General Imran Hasan said at the event. \n'Around 25%-30% of sales have dropped in the restaurant sector due to soaring commodity prices, he added. \n He urged the government to give permission to them or others to import meat.  \n 'At present, arbitrary taxes are being levied along with VAT. We want 0.5% of the daily sales to be collected with VAT as tax. We also want to pay it at the end of the month,' said Imran Hasan.\nThe country has around 60,000 restaurants employing around 30 lakh people, according to Broa.\n Rising commodity prices have squeezed profit margins for most eateries as the restaurateurs are not able to raise their food price to match the rising costs, Syed Mohammad Andalib, a restaurant owner and also the organising secretary, Broa told TBS. \n'It is not that we want to harm local farmers. To keep the market in a check and balance, we demand permission to import meat,' he added. \nAshfaq Rahman Asif, managing director of a Gulshan restaurant told TBS that 'The sales started dropping just after the Eid-ul-Azha which now declined to 30%-40% in our area. Many owners are thinking of closing their businesses.\n 'The leaders of Broa also said restaurants using electronic fiscal devices are suffering business losses because most eateries are not using the device. \nThey demanded the machine be set up at all the restaurants.",
  ),
  ImageDetails(
    imagePath: 'assets/images/06.jpg',
    title: 'Bangladesh Restaurant Owners Association',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
];

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

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
            onPressed: () {
              Get.to(() => const SignInScreen());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Get.to(
                          () => DetailsPage(
                            imagePath: _images[index].imagePath,
                            title: _images[index].title,
                            details: _images[index].details,
                            index: index,
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String title;
  final String details;
  ImageDetails({
    required this.imagePath,
    required this.title,
    required this.details,
  });
}
