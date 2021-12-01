import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_divider_line.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_switch.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:for_cash/app/widgets/common_text_field.dart';
import 'package:for_cash/app/widgets/common_vertical_container.dart';

Widget weeklyBalanceBox() {
  return Container(
    width: 200.0,
    height: 60.0,
    decoration: BoxDecoration(
      color: AppTheme.colorAccent,
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          "\$5,000",
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          maxline: 1,
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
        ),
        CommonText(
          "End of Week Balance",
          color: Colors.white,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}

Widget incomeExpenseWeekBox() {
  return Container(
    width: 336.0,
    height: 60.0,
    decoration: BoxDecoration(
      color: AppTheme.colorPrimary,
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              "\$4,200",
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              maxline: 1,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            CommonText(
              "Income This Week",
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        CommonDividerLine(
          height: 40.0,
          width: 1.3,
          color: AppTheme.white,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              "\$150",
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              maxline: 1,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            CommonText(
              "Expenses This Week",
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget currentWeekBox() {
  return Container(
    width: 245.0,
    height: 60.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CommonText(
          "Current Week",
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          maxline: 1,
          color: AppTheme.colorGrey,
          overflow: TextOverflow.ellipsis,
        ),
        CommonText(
          "September 11 - September 16",
          color: AppTheme.colorGrey,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ],
    ),
  );
}

Widget simulateTextSwitch({onChanged, switchControl}) {
  return Row(
    children: [
      Center(
        child: CommonText(
          "Simulate Mode OFF",
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          maxline: 1,
          color: AppTheme.colorGreyDark,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Center(
        child: CustomSwitch(
          onChanged: onChanged,
          value: switchControl,
          enableColor: AppTheme.colorAccent,
          disableColor: Colors.white,
          width: 55.0,
          height: 24.0,
        ),
      ),
    ],
  );
}

Widget calenderListWidget(List<String> dateList) {
  return Container(
    width: double.infinity,
    height: 78,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              CommonImageAsset(
                image: Constants.ic_calender_primary,
                height: 30.0,
                width: 30.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              CommonText(
                "Calender",
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                maxline: 1,
                color: AppTheme.colorBlack,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Container(
          color: AppTheme.colorBackground,
          width: 2.0,
        ),
        Container(
          width: 1050,
          child: Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonImageAsset(
                  image: Constants.ic_arrow_left,
                  width: 15.0,
                  height: 15.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  width: 900.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CommonText(
                            dateList[index],
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            maxline: 1,
                            color: AppTheme.colorGreyDark,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            width: 90.0,
                          )
                        ],
                      );
                    },
                  ),
                ),
                CommonImageAsset(
                  image: Constants.ic_arrow_right,
                  width: 15.0,
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget monthlyIncomeBox(
  columnList,
  item,
  everyList,
  paidOnList,
) {
  return Container(
    width: double.infinity,
    height: 290,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        CommonText(
                          "Monthly Income",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          maxline: 1,
                          color: AppTheme.colorBlack,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        CommonImageAsset(
                          image: Constants.ic_edit,
                          height: 20.0,
                          width: 20.0,
                        )
                      ],
                    ),
                    CommonImageAsset(
                      image: Constants.ic_minimize,
                      height: 20.0,
                      width: 20.0,
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: AppTheme.colorBackground,
              width: 2.0,
            ),
            Container(
              width: 1050,
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
          // Column(
          //   children: [
          //     buildTableColumn(columnList),
          //     buildTableRow(paidOnList),
          //   ],
          // ),
          // itemAndIncomeList(item)
      ],
    ),
  );
}

buildTableColumn(columnList) {
  return Row(
    children: List.generate(
        columnList.length,
        (index) => Expanded(
              flex: index == 0
                  ? 6
                  : (index == 1 || index == 2)
                      ? 3
                      : 5,
              child: CommonText(
                columnList[index].toString(),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.colorGrey,
                textAlign: TextAlign.center,
              ),
            )),
  );
}

buildTableRow(paidOnList) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(
              width: 10,
            ),
            CommonVerticalContainer(
              containerColor: AppTheme.colorAccent,
            ),

            ///expense text field
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.fromLTRB(6, 10, 0, 6),
                child: CommonText(
                  'Apple Inc.',
                  // controller: expenseControllerList[index],
                ),
              ),
            ),

            ///paid on
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 10, 0, 6),
                child: CommonText(paidOnList),
              ),
            ),

            ///paid on
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 10, 0, 6),
                child: CommonText(paidOnList),
              ),
            ),

            /* ///every list
                Flexible(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(8, 10, 0, 6),
                    child: CommonDropDown(
                      colorBackground: widget.isShowColor
                          ? AppTheme.colorBackground
                          : Colors.transparent,
                      height: 50,
                      items: widget.everyList,
                      value: widget.everySelectedValue,
                      onChanged: (item) {
                        setState(() {});
                      },
                    ),
                  ),
                ),
*/

            ///amount
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 10, 10, 6),
                child: CommonTextField(
                  // controller: amountControllerList[index],
                  controller: TextEditingController(text: "\$500"),
                  text: '\$500',
                  inputType: TextInputType.name,
                  isFill: true,
                ),
              ),
            ),
          ],
        );
      });
}

itemAndIncomeList(item) {
  return Stack(
    alignment: Alignment.centerLeft,
    children: [
      Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 14.0),
                    child: Center(
                      child: CommonText(
                        item[i].toString(),
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        maxline: 1,
                        color: AppTheme.colorBlack,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          CommonDividerLine(
            width: 1.0,
            color: AppTheme.colorWhite,
          ),
          Expanded(
              flex: 3,
              child: Container(
                height: 240,
                color: Colors.white,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.5,
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                  crossAxisCount: 3,
                  children: List.generate(18, (index) {
                    return Center(
                      child: CommonText(
                        "-",
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        maxline: 1,
                        color: AppTheme.colorBlack,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }),
                ),
              )),
        ],
      ),
      Container(
        height: 25.0,
        width: 25.0,
        decoration: BoxDecoration(color: AppTheme.colorWhite, borderRadius: BorderRadius.circular(50.0)),
        child: Center(
          child: CommonImageAsset(
            image: Constants.ic_arrow_right,
            height: 15.0,
            width: 15.0,
            color: AppTheme.colorGreyDark,
          ),
        ),
      ),
    ],
  );
}
