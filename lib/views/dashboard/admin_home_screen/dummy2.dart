// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controllers/capital_controller/capital_controller.dart';
// import '../../../controllers/expense_controller/expense_controller.dart';
// import '../../../controllers/investment_controller/investment_controller.dart';
// import '../../../controllers/profit_controller/profit_controller.dart';
// import '../../../global_widget/colors.dart';
// import '../../../global_widget/global_container.dart';
// import '../../user_panel/capital_screen/capital_screen.dart';
// import '../../user_panel/expense_screen/expense_screen.dart';
// import '../../user_panel/invest_screen/invest_screen.dart';
// import '../../user_panel/profit_screen/profit_screen.dart';
// import '../admin_capital_screen/admin_capital_screen.dart';
// import '../admin_expense_screen/admin_expense_screen.dart';
// import '../admin_invest_screen/admin_invest_screen.dart';
// import '../admin_login_screen/login_screen.dart';
// import '../admin_profit_screen/admin_profit_screen.dart';
// import '../admin_custom_drawer_widget.dart';
// import 'component/admin_home_member_widget.dart';
// import 'component/catagory_card.dart';
// import 'component/home_summery_chapter_item_widget.dart';
// import 'pie_chart_section.dart';
//
// class AdminHomeScreen extends StatefulWidget {
//   const AdminHomeScreen({super.key});
//
//   @override
//   State<AdminHomeScreen> createState() => _AdminHomeScreenState();
// }
//
// class _AdminHomeScreenState extends State<AdminHomeScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         shadowColor: ColorRes.borderColor,
//         backgroundColor: ColorRes.white,
//         iconTheme: const IconThemeData(color: ColorRes.capitalColor),
//         centerTitle: true,
//         title: const Text(
//           'Swapnobaj',
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w700,
//             color: ColorRes.capitalColor,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.to(() => SignInScreen());
//             },
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       drawer: const AdminSideBerMenuWidget(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10),
//             child: Column(
//               children: [
//                 const SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GlobalContainer(
//                       width: 140,
//                       height: 140,
//                       backgroundColor: ColorRes.backgroundColor,
//                       child: Padding(
//                         padding: const EdgeInsets.all(5),
//                         child: SizedBox(
//                           width: 100,
//                           height: 100,
//                           child: PieChart(
//                             PieChartData(
//                               sections: buildPieChartSections(),
//                               borderData: FlBorderData(show: false),
//                               sectionsSpace: 2,
//                               centerSpaceRadius: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: GlobalContainer(
//                         backgroundColor: ColorRes.backgroundColor,
//                         width: Get.width,
//                         child: Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Column(
//                             children: [
//                               GetBuilder<CapitalController>(builder: (capitalController) {
//                                 return HomeSummeryChapterItem(
//                                   titleColor: ColorRes.capitalColor,
//                                   blanceColor: ColorRes.capitalColor,
//                                   borderColor: ColorRes.capitalColor,
//                                   title: "Capital",
//                                   blance: capitalController.totalCapitalAmount.toStringAsFixed(2),
//                                   onTap: () {
//                                     Get.to(() => CapitalScreen());
//                                   },
//                                 );
//                               }),
//                               GetBuilder<ProfitController>(builder: (profitController) {
//                                 return HomeSummeryChapterItem(
//                                   titleColor: ColorRes.profitColor,
//                                   blanceColor: ColorRes.profitColor,
//                                   borderColor: ColorRes.profitColor,
//                                   title: 'Profit',
//                                   blance: profitController.totalProfitAmount.toStringAsFixed(2),
//                                   onTap: () {
//                                     Get.to(() => const ProfitScreen());
//                                   },
//                                 );
//                               }),
//                               GetBuilder<InvestmentController>(builder: (investmentController) {
//                                 return HomeSummeryChapterItem(
//                                   titleColor: ColorRes.investColor,
//                                   blanceColor: ColorRes.investColor,
//                                   borderColor: ColorRes.investColor,
//                                   title: 'Invest',
//                                   blance: investmentController.totalInvestAmount.toStringAsFixed(2),
//                                   onTap: () {
//                                     Get.to(() => const InvestScreen());
//                                   },
//                                 );
//                               }),
//                               GetBuilder<ExpenseController>(builder: (expenseController) {
//                                 return HomeSummeryChapterItem(
//                                   titleColor: ColorRes.expenseColor,
//                                   blanceColor: ColorRes.expenseColor,
//                                   borderColor: ColorRes.expenseColor,
//                                   title: 'Expense',
//                                   blance: expenseController.totalExpenseAmount.toStringAsFixed(2),
//                                   onTap: () {
//                                     Get.to(() => const ExpenseScreen());
//                                   },
//                                 );
//                               }),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 GlobalContainer(
//                   backgroundColor: ColorRes.backgroundColor,
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Column(
//                       children: [
//                         GetBuilder<CapitalController>(
//                           builder: (capitalController) {
//                             return GetBuilder<ProfitController>(
//                               builder: (profitController) {
//                                 final totalInvest = Get.find<InvestmentController>().totalInvestAmount;
//                                 final totalExpense = Get.find<ExpenseController>().totalExpenseAmount;
//                                 final currentBalance = (capitalController.totalCapitalAmount + profitController.totalProfitAmount - (totalInvest + totalExpense)).toStringAsFixed(2);
//                                 return HomeSummeryChapterItem(
//                                   titleColor: ColorRes.green,
//                                   blanceColor: ColorRes.green,
//                                   borderColor: ColorRes.green,
//                                   title: 'Current Balance',
//                                   blance: "৳ $currentBalance",
//                                   onTap: () {
//                                     // Navigate to the respective screen if needed
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 5),
//                         GetBuilder<CapitalController>(
//                           builder: (capitalController) {
//                             return GetBuilder<ExpenseController>(
//                               builder: (expenseController) {
//                                 final netBalance = (capitalController.totalCapitalAmount + Get.find<ProfitController>().totalProfitAmount - expenseController.totalExpenseAmount).toStringAsFixed(2);
//                                 return HomeSummeryChapterItem(
//                                   titleColor: ColorRes.black,
//                                   blanceColor: ColorRes.black,
//                                   borderColor: ColorRes.black,
//                                   title: "Net Balance",
//                                   blance: "৳ $netBalance",
//                                   onTap: () {
//                                     // Navigate to the respective screen if needed
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 GlobalContainer(
//                   backgroundColor: ColorRes.backgroundColor,
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: CatagoryCard(
//                               imagePath: 'assets/icons/capital.png',
//                               title: 'Deposit',
//                               titleColor: ColorRes.capitalColor,
//                               onTap: () => Get.to(() => AdminCapitalScreen()),
//                             ),
//                           ),
//                           Expanded(
//                             child: CatagoryCard(
//                               imagePath: 'assets/icons/profit.png',
//                               title: 'Profit',
//                               titleColor: ColorRes.profitColor,
//                               onTap: () => Get.to(() => AdminProfitScreen()),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: CatagoryCard(
//                               imagePath: 'assets/icons/invest.png',
//                               title: 'Invest',
//                               titleColor: ColorRes.investColor,
//                               onTap: () => Get.to(() => AdminInvestScreen()),
//                             ),
//                           ),
//                           Expanded(
//                             child: CatagoryCard(
//                               imagePath: 'assets/icons/expense.png',
//                               title: 'Expense',
//                               titleColor: ColorRes.expenseColor,
//                               onTap: () => Get.to(() => AdminExpenseScreen()),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Column(
//                   children: [
//                     GlobalContainer(
//                       backgroundColor: ColorRes.backgroundColor,
//                       width: Get.width,
//                       child: const HomeMemberTableWidget(
//                         firstRow: 'SL',
//                         secondRow: 'Name',
//                         thirdRow: 'Deposit',
//                         fourRow: 'Profit',
//                         fiveRow: 'Balance',
//                       ),
//                     ),
//                     GlobalContainer(
//                       backgroundColor: ColorRes.white,
//                       child: GetBuilder<CapitalController>(
//                         builder: (controller) {
//                           return ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: controller.capitalData.length,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemBuilder: (ctx, index) {
//                               var data = controller.capitalData[index];
//                               final depositAmount = data.totalDepositAmount; // Assuming data has totalDepositAmount
//                               final profitAmount = Get.find<ProfitController>().totalProfitAmount / 16; // Corrected here
//                               final balance = (depositAmount + (profitAmount / 16)).toStringAsFixed(2); // Calculate balance
//
//                               return HomeMemberTableValueWidget(
//                                 firstColumn: data.memberId, // Ensure this displays correctly
//                                 secondColumn: data.depositorName,
//                                 thirdColumn: depositAmount.toStringAsFixed(2),
//                                 fourColumn: profitAmount.toStringAsFixed(2),
//                                 fiveColumn: balance,
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
