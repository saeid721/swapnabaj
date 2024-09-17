import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_screen/login_screen.dart';
import '../menu_screen/bangla_001.dart';
import '../widget/colors.dart';
import '../widget/global_container.dart';
import 'component/home_member_widget.dart';
import 'component/home_summery_chapter_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double capital = 882000.00;
  final double profit = 194780.00;
  final double invest = 920000.00;
  final double expense = 11074.00;
  final double balance = 145706.00;

  List<PieChartSectionData> _buildPieChartSections() {
    double total = capital + profit + invest + expense + balance;

    return [
      PieChartSectionData(
        color: ColorRes.primaryColor,
        value: capital / total * 100,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: ColorRes.green,
        value: profit / total * 100,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: invest / total * 100,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: ColorRes.red,
        value: expense / total * 100,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: ColorRes.balck,
        value: balance / total * 100,
        title: '',
        radius: 50,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.borderColor,
        backgroundColor: ColorRes.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: false,
        title: const Text(
          'Future Hope Development Association',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorRes.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SignInScreen());
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      //drawer: const SideberMenuWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GlobalContainer(
                      width: 140,
                      height: 140, // Reduce the container width
                      backgroundColor: ColorRes.backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          width: 100, // Set width for the PieChart container
                          height: 100, // Set height for the PieChart container
                          child: PieChart(
                            PieChartData(
                              sections: _buildPieChartSections(),
                              borderData: FlBorderData(show: false),
                              sectionsSpace: 2, // Space between sections
                              centerSpaceRadius:
                                  16, // Reduce space in the center of the pie
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GlobalContainer(
                        backgroundColor: ColorRes.backgroundColor,
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              HomeSummeryChapterItem(
                                titleColor: ColorRes.primaryColor,
                                blanceColor: ColorRes.primaryColor,
                                borderColor: ColorRes.primaryColor,
                                title: "Capital",
                                blance: "৳ 8,82,000.00",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              HomeSummeryChapterItem(
                                titleColor: ColorRes.green,
                                blanceColor: ColorRes.green,
                                borderColor: ColorRes.green,
                                title: 'Profit',
                                blance: "৳ 1,94,780.00",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              HomeSummeryChapterItem(
                                titleColor: Colors.orange,
                                blanceColor: Colors.orange,
                                borderColor: Colors.orange,
                                title: 'Invest',
                                blance: "৳ 9,20,000.00",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              HomeSummeryChapterItem(
                                titleColor: ColorRes.red,
                                blanceColor: ColorRes.red,
                                borderColor: ColorRes.red,
                                title: 'Expense',
                                blance: "৳ 11,074.00",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              // HomeSummeryChapterItem(
                              //   titleColor: ColorRes.balck,
                              //   blanceColor: ColorRes.balck,
                              //   borderColor: ColorRes.balck,
                              //   title: 'Balance',
                              //   blance: "৳ 1,45,706.00",
                              //   onTap: () {
                              //     Get.to(() => const ());
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GlobalContainer(
                  backgroundColor: ColorRes.backgroundColor,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        HomeSummeryChapterItem(
                          titleColor: ColorRes.balck,
                          blanceColor: ColorRes.balck,
                          borderColor: ColorRes.balck,
                          title: 'Current Balance',
                          blance: "৳ 1,45,706.00",
                          onTap: () {
                            Get.to(() => const ());
                          },
                        ),
                        const SizedBox(height: 5),
                        HomeSummeryChapterItem(
                          titleColor: ColorRes.primaryColor,
                          blanceColor: ColorRes.primaryColor,
                          borderColor: ColorRes.primaryColor,
                          title: "Net Balance",
                          blance: "৳ 10,65,706.00",
                          onTap: () {
                            Get.to(() => const ());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      GlobalContainer(
                        backgroundColor:
                            ColorRes.backgroundColor.withOpacity(.5),
                        width: Get.width,
                        child: const HomeMemberTableWidget(
                          firstRow: 'SL',
                          secondRow: 'Name',
                          thirdRow: '%',
                          fourRow: 'Diposit',
                          fiveRow: 'Profit',
                          sixRow: 'Blance',
                        ),
                      ),
                      GlobalContainer(
                        backgroundColor: ColorRes.backgroundColor,
                        width: Get.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return const HomeMemberTableValueWidget(
                              firstColumn: '01',
                              secondColumn: 'Mr. Mizan',
                              thirdColumn: '1',
                              fourColumn: '68,500',
                              fiveColumn: '13,326',
                              sixColumn: '81,826',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
