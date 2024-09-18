import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widget/colors.dart';
import '../admin_login_screen/admin_login_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Certificate on Incorporation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/images/incorporation.jpeg',
                height: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                'Constitution সংবিধান বা ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Column(
                children: [
                  Text.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                      children: [
                        TextSpan(
                            text:
                                "The constitution of the Bangladesh Restaurant Owners Association is a set of rules and regulations governing the organization's structure, functions, and operations. While the specific details of the constitution may vary, it typically outlines the following key aspects:\n \n"),
                        TextSpan(
                          text: "Name and Objectives: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "The constitution specifies the name of the association (Bangladesh Restaurant Owners Association) and outlines its objectives, which may include promoting the interests of restaurant owners, advocating for favorable policies and regulations, fostering unity and collaboration within the industry, and supporting the growth and development of the restaurant sector in Bangladesh."),
                      ],
                    ),
                  ),
                  Text.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Membership: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "The constitution defines the criteria for membership in the association, including eligibility requirements, membership categories, rights, and responsibilities. It may outline the process for admission, suspension, and termination of membership, as well as procedures for membership dues and fees."),
                      ],
                    ),
                  ),
                  Text.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Organizational Structure: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "The constitution establishes the organizational structure of the association, including the roles and responsibilities of office bearers such as the president, vice president, general secretary, treasurer, and executive committee members. It may also outline the procedures for elections, terms of office, and decision-making processes within the association."),
                      ],
                    ),
                  ),
                  Text.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Meetings and Governance: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "The constitution governs the conduct of meetings, including general assembly meetings, executive committee meetings, and other gatherings of the association's members. It specifies procedures for convening meetings, setting agendas, voting, and recording minutes. It may also outline mechanisms for resolving disputes and grievances within the association."),
                      ],
                    ),
                  ),
                  Text.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Financial Management: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "The constitution outlines principles and procedures for financial management, including budgeting, accounting, auditing, and reporting. It may establish guidelines for the collection, disbursement, and management of funds, as well as mechanisms for ensuring transparency and accountability in financial matters."),
                      ],
                    ),
                  ),
                  Text.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Amendments and Bylaws:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                "The constitution may include provisions for amending its provisions and adopting bylaws to address specific operational or procedural matters not covered in the main document. It may specify the process for amending the constitution, including requirements for notice, voting, and approval by members."),
                      ],
                    ),
                  ),
                  Text.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                      children: [
                        TextSpan(
                            text:
                                "Overall, the constitution of the Bangladesh Restaurant Owners Association serves as a foundational document that guides the organization's activities, ensures compliance with legal requirements, and upholds the principles of democracy, transparency, and accountability in its governance and operations."),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
