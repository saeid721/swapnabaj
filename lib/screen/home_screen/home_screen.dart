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
        color: ColorRes.capitalColor,
        value: capital / total * 100,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: ColorRes.profitColor,
        value: profit / total * 100,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: ColorRes.investColor,
        value: invest / total * 100,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: ColorRes.expenseColor,
        value: expense / total * 100,
        title: '',
        radius: 50,
      ),
      PieChartSectionData(
        color: ColorRes.green,
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
        backgroundColor: ColorRes.white,
        iconTheme: const IconThemeData(color: ColorRes.capitalColor),
        centerTitle: false,
        title: const Text(
          'Swapnobaj',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: ColorRes.capitalColor,
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
                                titleColor: ColorRes.capitalColor,
                                blanceColor: ColorRes.capitalColor,
                                borderColor: ColorRes.capitalColor,
                                title: "Capital",
                                blance: "৳ 8,82,000.00",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              HomeSummeryChapterItem(
                                titleColor: ColorRes.profitColor,
                                blanceColor: ColorRes.profitColor,
                                borderColor: ColorRes.profitColor,
                                title: 'Profit',
                                blance: "৳ 1,94,780.00",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              HomeSummeryChapterItem(
                                titleColor: ColorRes.investColor,
                                blanceColor: ColorRes.investColor,
                                borderColor: ColorRes.investColor,
                                title: 'Invest',
                                blance: "৳ 9,20,000.00",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              HomeSummeryChapterItem(
                                titleColor: ColorRes.expenseColor,
                                blanceColor: ColorRes.expenseColor,
                                borderColor: ColorRes.expenseColor,
                                title: 'Expense',
                                blance: "৳ 11,074.00",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
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
                          titleColor: ColorRes.green,
                          blanceColor: ColorRes.green,
                          borderColor: ColorRes.green,
                          title: 'Current Balance',
                          blance: "৳ 1,45,706.00",
                          onTap: () {
                            Get.to(() => const ());
                          },
                        ),
                        const SizedBox(height: 5),
                        HomeSummeryChapterItem(
                          titleColor: ColorRes.balck,
                          blanceColor: ColorRes.balck,
                          borderColor: ColorRes.balck,
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
                        backgroundColor: ColorRes.white,
                        width: Get.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return const HomeMemberTableValueWidget(
                              firstColumn: '01',
                              secondColumn: 'Mr. Atiq',
                              thirdColumn: '1',
                              fourColumn: '60,000',
                              fiveColumn: '5,000',
                              sixColumn: '65,000',
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
