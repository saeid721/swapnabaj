import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_screen/login_screen.dart';
import '../menu_screen/bangla_001.dart';
import '../widget/colors.dart';
import '../widget/global_container.dart';
import 'component/home_member_widget.dart';
import 'component/home_summery_chapter_item_widget.dart';
import 'component/member_data.dart';

class HomeScreenDummyDataScreen extends StatefulWidget {
  const HomeScreenDummyDataScreen({super.key});

  @override
  State<HomeScreenDummyDataScreen> createState() =>
      _HomeScreenDummyDataScreenState();
}

class _HomeScreenDummyDataScreenState extends State<HomeScreenDummyDataScreen> {
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
          'Future Hope Development Association',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ColorRes.primaryColor,
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                      height: 140,
                      backgroundColor: ColorRes.backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: PieChart(
                            PieChartData(
                              sections: buildPieChartSections(),
                              borderData: FlBorderData(show: false),
                              sectionsSpace: 2,
                              centerSpaceRadius: 16,
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
                                blance:
                                    "৳ ${currencyFormat.format(totalCapital)}",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              HomeSummeryChapterItem(
                                titleColor: ColorRes.green,
                                blanceColor: ColorRes.green,
                                borderColor: ColorRes.green,
                                title: 'Profit',
                                blance:
                                    "৳ ${currencyFormat.format(totalProfit)}",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              HomeSummeryChapterItem(
                                titleColor: Colors.orange,
                                blanceColor: Colors.orange,
                                borderColor: Colors.orange,
                                title: 'Invest',
                                blance:
                                    "৳ ${currencyFormat.format(totalInvest)}",
                                onTap: () {
                                  Get.to(() => const BanglaSongOneScreen());
                                },
                              ),
                              HomeSummeryChapterItem(
                                titleColor: ColorRes.red,
                                blanceColor: ColorRes.red,
                                borderColor: ColorRes.red,
                                title: 'Expense',
                                blance:
                                    "৳ ${currencyFormat.format(totalExpense)}",
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
                          titleColor: ColorRes.balck,
                          blanceColor: ColorRes.balck,
                          borderColor: ColorRes.balck,
                          title: 'Current Balance',
                          blance: "৳ ${currencyFormat.format(currentBalance)}",
                          onTap: () {
                            Get.to(() => const BanglaSongOneScreen());
                          },
                        ),
                        const SizedBox(height: 5),
                        HomeSummeryChapterItem(
                          titleColor: ColorRes.primaryColor,
                          blanceColor: ColorRes.primaryColor,
                          borderColor: ColorRes.primaryColor,
                          title: "Net Balance",
                          blance: "৳ ${currencyFormat.format(netBalance)}",
                          onTap: () {
                            Get.to(() => const BanglaSongOneScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                buildMemberTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMemberTable() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          GlobalContainer(
            backgroundColor: ColorRes.white,
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
              itemCount: members.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                final member = members[index];
                return HomeMemberTableValueWidget(
                  firstColumn: member.sl,
                  secondColumn: member.name,
                  thirdColumn: member.percent,
                  fourColumn: member.deposit,
                  fiveColumn: member.profit,
                  sixColumn: member.balance,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
