import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/getx/dashboard_container_visibility.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:fore_cash/view/notifications/notifications_screen.dart';
import 'package:fore_cash/view/transactions/verify_transactions_screen.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {

  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visibilityController = Get.put(DashBoardVisibilityController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 1000;
        return Scaffold(
          backgroundColor: const Color(0xffE5E5E5),
          appBar: CommonMobileAppbar.commonMobileAppbar(
                  color: Colors.white,
                  title: const Text(
                    'DashBoard',
                    style: mobileAppBarStyle,
                  ),
                  actions: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VerifyTransactionsScreen(),
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.01),
                          child: Stack(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                padding: const EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appBarActionColor,
                                ),
                                child: Image.asset('assets/image/png/notificationIcon.png'),
                              ),
                              const Positioned(
                                right: 3,
                                top: 4,
                                child: CircleAvatar(
                                  backgroundColor: cameraBackGroundColor,
                                  radius: 6,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.007,
                      ),
                      GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationsScreen(),
                            ));
                      },
                        child: Container(
                          width: 86,
                          margin: EdgeInsets.only(top: Get.height * 0.01, bottom: Get.height * 0.01, right: Get.width * 0.015),
                          padding: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(color: appBarActionColor, borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 17,
                                backgroundImage: AssetImage(
                                  'assets/image/png/profilePhoto.png',
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ]
                  // titleTextStyle: mobileAppBarStyle,
                  ),
          body: Column(
            children: [
              SizedBox(
                height: Get.height * 0.015,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          foreCashWeeklyBalance,
                          style: foreCashWeeklyBalanceTextStyle,
                        ),
                      ),
                      Image.asset(
                        'assets/image/png/vector2.png',
                        // fit: BoxFit.contain,
                        width: Get.width * 0.035,
                        // height: Get.height * 0.06,
                      ),
                      Spacer(),
                      Text(
                        '\$5,000',
                        style: foreCashWeeklyBalanceStyle,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              GetBuilder<DashBoardVisibilityController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.visibility,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          margin: const EdgeInsets.only(left: 10, right: 5),
                          height: Get.height * 0.07,
                          decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(7)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$4.200',
                                style: foreCashWeeklyBalanceStyle,
                              ),
                              Text(
                                incomeThisWeek,
                                style: incomeExpenseTExtStyle,
                              )
                            ],
                          ),
                        )),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: Get.height * 0.07,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(7)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$150',
                                style: foreCashWeeklyBalanceStyle,
                              ),
                              Text(
                                expenseThisWeek,
                                style: incomeExpenseTExtStyle,
                              )
                            ],
                          ),
                        )),
                        SizedBox(
                          height: controller.visibility ? Get.height * 0.09 : Get.height * 0.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Stack(
                children: [
                  AnimatedContainer(
                    margin: const EdgeInsets.only(top: 14),
                    height: 300,
                    color: Colors.white,
                    duration: const Duration(seconds: 5),
                    curve: Curves.elasticInOut,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        visibilityController.changeDashBoardVisibility();
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        child: const Icon(
                          Icons.arrow_upward_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
