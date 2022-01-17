import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:fore_cash/common_widget/common_mobile_appbar.dart';
import 'package:fore_cash/common_widget/common_web_appbar_with_user_name.dart';
import 'package:fore_cash/getx/dashboard_container_visibility.dart';
import 'package:fore_cash/getx/pageview_pageindex_controller.dart';
import 'package:fore_cash/getx/selected_dropdown_controller.dart';
import 'package:fore_cash/getx/switch_controller.dart';
import 'package:fore_cash/model/monthly_income_model.dart';
import 'package:fore_cash/utility/colors.dart';
import 'package:fore_cash/utility/const.dart';
import 'package:fore_cash/utility/string.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final switchController = Get.put(SwitchController());

  final pageIndexController = Get.put(PageViewPageIndex());

  @override
  Widget build(BuildContext context) {
    List<String> dataDateList = [
      "Sep,1",
      "Dec,1",
      "Jun,15",
      "May,15",
      "Mar,6",
      "Jul,28",
      "Jun,7",
      "Dec,3",
      "Nov,20",
      "Oct,25",
      "Aug,18",
      "Sep,23",
      "Aug,29",
      "Jul,25",
      "Jun,11",
      "Mar,22",
      "Feb,12",
      "Aug,17",
      "Aug,21",
      "Aug,30",
      "Jan,25",
      "Sep,2",
      "Nov,15",
      "Nov,5",
      "Nov,12",
      "Oct,1",
      "Dec,1",
    ];
    List<String> incomes = [
      '\$1200',
      '-',
      '\$800',
      '-',
      '\$1000',
      '\$1800',
      '\$2000',
      '-',
      '\$200',
      '-',
      '\$300',
      '-',
      '200',
      '\$500',
      '-',
      '\$8000',
      '-',
      '-',
      '-',
      '\$400',
      '\$500',
      '-',
      '-',
      '\$3000',
      '\$5444',
      '-',
      '-',
    ];

    final visibilityController = Get.put(DashBoardVisibilityController());
    final controller = Get.put(SelectedDropDownItem());
    ScrollController scrollController = ScrollController();

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth > 1000;
        PageController _pageController = PageController(
            keepPage: false,
            // initialPage: 5,
            // viewportFraction: 0.34,

            viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17);
        PageController _pageController2 = PageController(
          keepPage: false,
          // initialPage: 5,
          // viewportFraction: 0.34,

          viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
        );
        // List<PageController> pageControllerList = <PageController>[
        //   PageController(
        //     viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
        //   ),
        //   PageController(
        //     viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
        //   ),
        // ];

        List<PageController> pageControllerList = List.generate(
            2,
            (index) => PageController(
                  viewportFraction: maxWidth ? 1 / 7 : 1 / Get.size.aspectRatio * 0.17 / 1,
                ));
        return Scaffold(
          backgroundColor: const Color(0xffE5E5E5),
          appBar: maxWidth
              ? AppBarWithUserName.appBarWithUserNAme()
              : CommonMobileAppbar.commonMobileAppbar(
                  color: Colors.white,
                  title: Text(
                    'DashBoard',
                    style: mobileAppBarStyle,
                  ),
                  actions: [
                      Padding(
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
                      SizedBox(
                        width: Get.width * 0.007,
                      ),
                      Container(
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
                    ]
                  // titleTextStyle: mobileAppBarStyle,
                  ),
          body: Column(
            children: [
              SizedBox(
                height: Get.height * 0.015,
              ),
              maxWidth ? webHeaderRow() : mobileHeaderColumn(),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    margin: const EdgeInsets.only(top: 14),
                    height: 300,
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        maxWidth
                            ? Container()
                            : Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        currentWeek,
                                        style: currentWeekTextStyle,
                                      ),
                                      Text(
                                        currentWeekDate,
                                        style: currentWeekDateTextStyle,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  GetBuilder<SwitchController>(
                                    builder: (controller) {
                                      return Row(
                                        children: [
                                          Text(
                                            simulateMode,
                                            style: TextStyle(
                                                fontFamily: AppTheme.fontName,
                                                color: switchController.switchValue == true ? commonButtonColor : Colors.black54,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp),
                                          ),
                                          Switch(
                                            // onChanged: toggleSwitch,
                                            // value: isSwitched,
                                            activeColor: commonButtonColor,
                                            activeTrackColor: Colors.grey.withOpacity(0.3),
                                            inactiveThumbColor: commonTextColor2,
                                            // thumbColor: commonTextColor2,
                                            inactiveTrackColor: Colors.grey.withOpacity(0.3),
                                            value: switchController.switchValue,
                                            onChanged: (bool value) {
                                              switchController.changeSwitchValue(value: value);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                ],
                              ),
                        // Expanded(
                        //   child: Row(
                        //     children: [
                        //       // IconButton(
                        //       //     onPressed: () {
                        //       //       _pageController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                        //       //     },
                        //       //     icon: Icon(Icons.ten_k_rounded)),
                        //       SizedBox(
                        //         height: 100,
                        //         child: PageView.builder(
                        //           scrollDirection: Axis.horizontal,
                        //           itemCount: dataDateList.length,
                        //           controller: _pageController,
                        //           itemBuilder: (context, index) {
                        //             return Container(height: 50, width: 50, color: Colors.red, child: Text(dataDateList[index]));
                        //           },
                        //         ),
                        //       ),
                        //       // IconButton(
                        //       //     onPressed: () {
                        //       //       _pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                        //       //     },
                        //       //     icon: Icon(Icons.one_x_mobiledata_sharp)),
                        //     ],
                        //   ),
                        // ),

                        // IconButton(
                        //     onPressed: () {
                        //       buttonCarouselController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                        //     },
                        //     icon: Icon(Icons.ten_k_rounded)),
                        Container(
                          width: double.infinity,
                          color: const Color(0xffEDF2F6),
                          height: 45,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        'assets/image/png/calendarImage.png',
                                        height: 30,
                                        width: 30,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      calendar,
                                      style: blackCalendarStyle11W300,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _pageController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          List.generate(
                                              pageControllerList.length, (index) => pageControllerList[index].previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));

                                          // _pageController2.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                        },
                                        child: const Icon(
                                          // onPressed: () {
                                          //   _pageController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          // },

                                          Icons.arrow_back_ios,
                                          // size: 20,
                                        ),
                                      ),
                                      Flexible(child: GetBuilder<PageViewPageIndex>(
                                        builder: (controller) {
                                          return PageView.builder(
                                            itemCount: dataDateList.length,
                                            scrollDirection: Axis.horizontal,
                                            controller: _pageController,
                                            itemBuilder: (context, index) {
                                              return Align(
                                                alignment: const FractionalOffset(0.0, 0.5),
                                                child: Text(
                                                  dataDateList[index],
                                                  style: greyDateTexStyle10W300,
                                                  textAlign: TextAlign.center,
                                                ),
                                              );
                                            },
                                            onPageChanged: (value) {
                                              pageIndexController.updatePageIndex(index: value);
                                              List.generate(pageControllerList.length, (index) => pageControllerList[index].jumpToPage(value));

                                              // _pageController2.jumpToPage(value);
                                              // print(value);
                                            },
                                          );
                                        },
                                      )),
                                      InkWell(
                                        onTap: () {
                                          print('>>>>>>>>>>${_pageController.position}');
                                          print(_pageController.page);
                                          // if (dataDateList.length == pageIndexController.pageIndex) {
                                          //   _pageController.animateTo(0, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          // } else {
                                          _pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          // _pageController2.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          List.generate(pageControllerList.length, (index) => pageControllerList[index].nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut));
                                          // }
                                          print(_pageController.viewportFraction);
                                        },
                                        child: const Icon(
                                          Icons.arrow_forward_ios,

                                          // size: 20,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: MonthlyIncomeModel.monthlyincomeList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: Get.height * 0.019),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            width: constraints.maxWidth < 1000 ? Get.width * 0.29 : Get.width * 0.15,
                                            height: Get.height * 0.044,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                            child: Text(
                                              '${MonthlyIncomeModel.monthlyincomeList[index].expenseName}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName),
                                            ),
                                            // child: const TextField(
                                            //   style: textFieldStyle,
                                            //   decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                                            // ),
                                            decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          ),
                                          // Visibility(
                                          //     child: Row(
                                          //   children: [
                                          //     Container(
                                          //       padding: const EdgeInsets.only(left: 6),
                                          //       width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          //       height: Get.height * 0.044,
                                          //       alignment: Alignment.center,
                                          //       child: GetBuilder<SelectedDropDownItem>(
                                          //         builder: (controller1) {
                                          //           // return commonDropDown(itemList: months, value: controller.selectedItemValueList[index]);
                                          //           return DropdownButtonHideUnderline(
                                          //             child: DropdownButton(
                                          //               value: controller.selectedDateItemValueList[index],
                                          //               // value: controller.selectedItem,
                                          //               style: dropDownStyle,
                                          //
                                          //               items: dateList.map((String items) {
                                          //                 return DropdownMenuItem(
                                          //                   value: items,
                                          //                   child: Text(
                                          //                     items,
                                          //                     style: dropDownStyle2,
                                          //                   ),
                                          //                 );
                                          //               }).toList(),
                                          //               onChanged: (item) {
                                          //                 controller.changeDate(item: item, index: index);
                                          //               },
                                          //               isExpanded: true,
                                          //
                                          //               icon: const Icon(
                                          //                 Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                          //                 // color: AppTheme.colorGrey,
                                          //               ),
                                          //             ),
                                          //           );
                                          //         },
                                          //       ),
                                          //       margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                          //       decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          //     ),
                                          //     Container(
                                          //       padding: const EdgeInsets.only(
                                          //         left: 6,
                                          //       ),
                                          //       width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                                          //       height: Get.height * 0.044,
                                          //       alignment: Alignment.center,
                                          //       child: GetBuilder<SelectedDropDownItem>(
                                          //         builder: (controller1) {
                                          //           // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                                          //           return DropdownButtonHideUnderline(
                                          //             child: DropdownButton(
                                          //               value: controller.selectedItemValueList[index],
                                          //               // value: controller.selectedItem,
                                          //               style: dropDownStyle,
                                          //               items: months.map((String items) {
                                          //                 return DropdownMenuItem(
                                          //                   value: items,
                                          //                   child: Text(
                                          //                     items,
                                          //                     style: dropDownStyle2,
                                          //                   ),
                                          //                 );
                                          //               }).toList(),
                                          //               onChanged: (item) {
                                          //                 controller.changeItem(item: item, index: index);
                                          //               },
                                          //               isExpanded: true,
                                          //
                                          //               icon: const Icon(
                                          //                 Icons.keyboard_arrow_down, color: Color(0xff777C90),
                                          //                 // color: AppTheme.colorGrey,
                                          //               ),
                                          //             ),
                                          //           );
                                          //         },
                                          //       ),
                                          //       margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                                          //       decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          //     ),
                                          //     Expanded(
                                          //       child: Container(
                                          //         // width: sequenceSize.width * 0.14,
                                          //         height: Get.height * 0.044,
                                          //         // width: Get.width * 0.14,
                                          //         alignment: Alignment.center,
                                          //         padding: const EdgeInsets.only(left: 10),
                                          //         child: const Text(
                                          //           '\$500',
                                          //           style: TextStyle(color: commonGreyColor, fontFamily: AppTheme.fontName),
                                          //           maxLines: 1,
                                          //           overflow: TextOverflow.ellipsis,
                                          //         ),
                                          //         // child: const TextField(
                                          //         //   style: textFieldStyle,
                                          //         //   decoration: InputDecoration(prefixStyle: prefixTextStyle, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                                          //         // ),
                                          //         margin: EdgeInsets.only(right: Get.width * 0.04),
                                          //         decoration: BoxDecoration(color: const Color(0xffEDF2F6), borderRadius: BorderRadius.circular(4)),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ))
                                        ],
                                      ),
                                    );
                                  },
                                )),
                            Expanded(
                              flex: 2,

                              // child: ListView.builder(
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   // controller: _scrollController,
                              //   shrinkWrap: true,
                              //   itemCount: 3,
                              //   itemBuilder: (context, index) {
                              //     return SizedBox(
                              //       height: 50,
                              //       child: PageView(
                              //         scrollDirection: Axis.horizontal,
                              //         onPageChanged: (value) {
                              //           _pageController.animateToPage(value, duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
                              //         },
                              //         // itemCount: incomes.length,
                              //         controller: _pageController2,
                              //
                              //         children: List.generate(
                              //             incomes.length,
                              //             (index) => Text(
                              //                   incomes[index],
                              //                   style: greyDateTexStyle10W300,
                              //                   textAlign: TextAlign.center,
                              //                 )),
                              //       ),
                              //     );
                              //     // return Padding(
                              //     //   padding: EdgeInsets.only(left: maxWidth ? 27 : Get.width * 0.045, right: maxWidth ? 5 : Get.width * 0.06),
                              //     //   child: PageView.builder(
                              //     //     controller: _pageController2,
                              //     //     itemCount: incomes.length,
                              //     //     onPageChanged: (value) {
                              //     //       // _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                              //     //     },
                              //     //     itemBuilder: (BuildContext context, int index1) {
                              //     //       return Text(
                              //     //         incomes[index1],
                              //     //         style: greyDateTexStyle10W300,
                              //     //         textAlign: TextAlign.center,
                              //     //       );
                              //     //     },
                              //     //   ),
                              //     // );
                              //   },
                              // ),
                              child: SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  itemCount: pageControllerList.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height: 100,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: maxWidth ? 27 : Get.width * 0.045, right: maxWidth ? 5 : Get.width * 0.06),
                                        child: PageView.builder(
                                          onPageChanged: (value) {
                                            _pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                                          },
                                          controller: pageControllerList[index],
                                          itemCount: incomes.length,
                                          itemBuilder: (BuildContext context, int index1) {
                                            return Text(
                                              incomes[index1],
                                              style: greyDateTexStyle10W300,
                                              textAlign: TextAlign.center,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  maxWidth
                      ? Container()
                      : Positioned(
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
              )
            ],
          ),
        );
      },
    );
  }

  Widget webHeaderRow() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: 220,
            height: Get.height * 0.06,
            decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(7)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$5,000',
                  style: foreCashWeeklyBalanceStyleWeb,
                ),
                Text(
                  endOfTheWeekBalance,
                  style: foreCashWeeklyBalanceTextStyleWeb,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: Get.height * 0.06,
          // width: 250,
          decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(7)),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$4.200',
                    style: foreCashWeeklyBalanceStyleWeb,
                  ),
                  Text(
                    incomeThisWeek,
                    style: foreCashWeeklyBalanceTextStyleWeb,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$150',
                    style: foreCashWeeklyBalanceStyleWeb,
                  ),
                  Text(
                    expenseThisWeek,
                    style: foreCashWeeklyBalanceTextStyleWeb,
                  )
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentWeek,
              style: currentWeekTextStyle,
            ),
            Text(
              currentWeekDate,
              style: currentWeekDateTextStyle,
            )
          ],
        ),
        const Spacer(),
        GetBuilder<SwitchController>(
          builder: (controller) {
            return Row(
              children: [
                Text(
                  simulateMode,
                  style: TextStyle(fontFamily: AppTheme.fontName, color: switchController.switchValue == true ? commonButtonColor : Colors.black54, fontWeight: FontWeight.w400, fontSize: 10.sp),
                ),
                Switch(
                  // onChanged: toggleSwitch,
                  // value: isSwitched,
                  activeColor: commonButtonColor,
                  activeTrackColor: Colors.white,
                  inactiveThumbColor: commonTextColor2,
                  // thumbColor: commonTextColor2,
                  inactiveTrackColor: Colors.white,
                  value: switchController.switchValue,
                  onChanged: (bool value) {
                    switchController.changeSwitchValue(value: value);
                  },
                ),
              ],
            );
          },
        )
      ],
    );
  }

  Widget mobileHeaderColumn() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                const Spacer(),
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
      ],
    );
  }
}
