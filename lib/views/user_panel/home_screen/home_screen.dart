import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/capital_controller/capital_controller.dart';
import '../../../controllers/expense_controller/expense_controller.dart';
import '../../../controllers/investment_controller/investment_controller.dart';
import '../../../controllers/profit_controller/profit_controller.dart';
import '../../dashboard/admin_home_screen/pie_chart_section.dart';
import '../../dashboard/admin_login_screen/admin_login_screen.dart';
import '../capital_screen/capital_screen.dart';
import '../expense_screen/expense_screen.dart';
import '../invest_screen/invest_screen.dart';
import '../../../global_widget/colors.dart';
import '../../../global_widget/global_container.dart';
import '../profit_screen/profit_screen.dart';
import 'component/home_member_widget.dart';
import 'component/home_summery_chapter_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              Get.to(() =>  SignInScreen());
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      //drawer: const SideMenuScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            children: [
              const SizedBox(height: 5),
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
                            GetBuilder<CapitalController>(builder: (capitalController) {
                              return HomeSummeryChapterItem(
                                titleColor: ColorRes.capitalColor,
                                blanceColor: ColorRes.capitalColor,
                                borderColor: ColorRes.capitalColor,
                                title: "Capital",
                                blance: '৳ ${capitalController.totalCapitalAmount.toStringAsFixed(2)}',
                                onTap: () {
                                  Get.to(() => CapitalScreen());
                                },
                              );
                            }),
                            GetBuilder<ProfitController>(builder: (profitController) {
                              return HomeSummeryChapterItem(
                                titleColor: ColorRes.profitColor,
                                blanceColor: ColorRes.profitColor,
                                borderColor: ColorRes.profitColor,
                                title: 'Profit',
                                blance: '৳ ${profitController.totalProfitAmount.toStringAsFixed(2)}',
                                onTap: () {
                                  Get.to(() => ProfitScreen());
                                },
                              );
                            }),
                            GetBuilder<InvestmentController>(builder: (investmentController) {
                              return HomeSummeryChapterItem(
                                titleColor: ColorRes.investColor,
                                blanceColor: ColorRes.investColor,
                                borderColor: ColorRes.investColor,
                                title: 'Invest',
                                blance: '৳ ${investmentController.totalInvestAmount.toStringAsFixed(2)}',
                                onTap: () {
                                  Get.to(() => const InvestScreen());
                                },
                              );
                            }),
                            GetBuilder<ExpenseController>(builder: (expenseController) {
                              return HomeSummeryChapterItem(
                                titleColor: ColorRes.expenseColor,
                                blanceColor: ColorRes.expenseColor,
                                borderColor: ColorRes.expenseColor,
                                title: 'Expense',
                                blance: '৳ ${expenseController.totalExpenseAmount.toStringAsFixed(2)}',
                                onTap: () {
                                  Get.to(() => ExpenseScreen());
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GlobalContainer(
                backgroundColor: ColorRes.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      GetBuilder<CapitalController>(
                        builder: (capitalController) {
                          return GetBuilder<ProfitController>(
                            builder: (profitController) {
                              final totalInvest = Get.find<InvestmentController>().totalInvestAmount;
                              final totalExpense = Get.find<ExpenseController>().totalExpenseAmount;
                              final currentBalance = (capitalController.totalCapitalAmount + profitController.totalProfitAmount - (totalInvest + totalExpense)).toStringAsFixed(2);
                              return HomeSummeryChapterItem(
                                titleColor: ColorRes.green,
                                blanceColor: ColorRes.green,
                                borderColor: ColorRes.green,
                                title: 'Current Balance',
                                blance: "৳ $currentBalance",
                                onTap: () {
                                  // Navigate to the respective screen if needed
                                },
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 5),
                      GetBuilder<CapitalController>(
                        builder: (capitalController) {
                          return GetBuilder<ExpenseController>(
                            builder: (expenseController) {
                              final netBalance = (capitalController.totalCapitalAmount + Get.find<ProfitController>().totalProfitAmount - expenseController.totalExpenseAmount).toStringAsFixed(2);
                              return HomeSummeryChapterItem(
                                titleColor: ColorRes.black,
                                blanceColor: ColorRes.black,
                                borderColor: ColorRes.black,
                                title: "Net Balance",
                                blance: "৳ $netBalance",
                                onTap: () {
                                  // Navigate to the respective screen if needed
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  GlobalContainer(
                    backgroundColor: ColorRes.backgroundColor,
                    width: Get.width,
                    child: const HomeMemberTableWidget(
                      firstRow: 'SL',
                      secondRow: 'Name',
                      thirdRow: 'Deposit',
                      fourRow: 'Profit',
                      fiveRow: 'Balance',
                    ),
                  ),
                  GlobalContainer(
                    backgroundColor: ColorRes.white,
                    child: GetBuilder<CapitalController>(
                      builder: (controller) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.capitalData.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            var data = controller.capitalData[index];
                            final depositAmount = data.totalDepositAmount; // Assuming data has totalDepositAmount
                            final profitAmount = Get.find<ProfitController>().totalProfitAmount / 16; // Corrected here
                            final balance = (depositAmount + (profitAmount)).toStringAsFixed(1); // Calculate balance

                            return HomeMemberTableValueWidget(
                              firstColumn: data.memberId, // Ensure this displays correctly
                              secondColumn: data.depositorName,
                              thirdColumn: depositAmount.toStringAsFixed(0),
                              fourColumn: profitAmount.toStringAsFixed(1),
                              fiveColumn: balance,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

