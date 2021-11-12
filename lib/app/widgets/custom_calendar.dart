import 'package:flutter/material.dart';
import 'package:for_cash/app/constants/constants.dart';
import 'package:for_cash/app/theme/app_theme.dart';
import 'package:for_cash/app/widgets/common_image_asset.dart';
import 'package:for_cash/app/widgets/common_text.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {

  PageController pageController = PageController(initialPage: 0);
  List<Widget> calList;
  DateTime showDate;
  DateTime currentDate = DateTime.now();

  /// The date var that handles the changing months on click
  DateTime displayDate =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showDate = displayDate;
    addDateData();
  }

  addDateData(){
    print('-> calling add data');
    // [returnRowList] called and stored in [rowListReturned] to make use of in the next occurrences
    List<Widget> rowListReturned = returnRowList(DateTime(displayDate.year, displayDate.month, 1));

    //calList contains the list of week Rows of the displayed month
    calList = [
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: rowListReturned)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        calendarHeader(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftArrow(),
            Expanded(
              flex: 6,
              child: Container(
                width: 200.0,
                alignment: Alignment.center,
                height: 300,
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: calList,
                  //the pageview is not swipable as this affects the changing months
                  physics: CustomScrollPhysics(),
                ),
              ),
            ),
            rightArrow()
          ],
        ),
      ],
    );
  }

  // Returns a list of Rows containing the weeks of a month
  List<Widget> returnRowList(DateTime start) {
    List<Widget> rowList = <Widget>[
      Padding(
        //do not change this padding
        padding: EdgeInsets.only(bottom: 10,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            calendarWeekday('Mon'),
            calendarWeekday('Tue'),
            calendarWeekday('Wed'),
            calendarWeekday('Thu'),
            calendarWeekday('Fri'),
            calendarWeekday('Sat'),
            calendarWeekday('Sun'),
          ],
        ),
      ),
    ];
    List<List<int>> rowValueList = generateMonth(start);
    for (int i = 0; i < rowValueList.length; i++) {
      List<Widget> itemList = [];
      for (int j = 0; j < rowValueList[i].length; j++) {
        itemList.add(Expanded(
          child: InkWell(
            onTap: (){
              print('-> selected date --> ${rowValueList[i][j]}-${start.month}-${start.year}');
              setState(() {
                currentDate = DateTime(start.year,start.month,rowValueList[i][j]);
              });
              addDateData();
              print('-> currentDate --> $currentDate');
            },
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: rowValueList[i][j] == currentDate.day &&
                        start.month == currentDate.month &&
                        start.year == currentDate.year &&
                        !((i == 0 && rowValueList[i][j] > 7) ||
                            (i >= 4 && rowValueList[i][j] < 7)) ? AppTheme.colorAccent : Colors.transparent) ,
                    color: Colors.transparent),
                child: Center(
                  child: Text(
                    rowValueList[i][j].toString(),
                    style: (rowValueList[i][j] ==currentDate.day &&
                        start.month == currentDate.month &&
                        start.year ==currentDate.year) &&
                        !((i == 0 && rowValueList[i][j] > 7) || (i >= 4 && rowValueList[i][j] < 7))
                        ? TextStyle(
                      fontWeight: FontWeight.w500 ,
                      fontFamily: AppTheme.fontName,
                      fontSize: 12.0,
                      color: AppTheme.colorAccent
                    )
                    //Grey out the previous month's and next month's values or dates
                        : TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: ((i == 0 && rowValueList[i][j] > 7) ||
                            (i >= 4 && rowValueList[i][j] < 7))
                            ? Color(0xFF3C3844)
                            : AppTheme.colorGrey),

                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ));
      }
      Widget temp = Padding(
        //this padding seems important
          padding: EdgeInsets.only(bottom: 12,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: itemList,
          ));
      rowList.add(temp);
    }
    return rowList;
  }

  //Return a Text with Style according to input String, used for the days
  Widget calendarWeekday(String day) {
    return Text(
      day,
      style: TextStyle(fontSize: 12, color: AppTheme.colorPrimary
        , fontWeight: FontWeight.w700,
        fontFamily: AppTheme.fontName,
      ),
    );
  }

  // Utility functions to compare Dates:
  bool areDaysSame(DateTime a, DateTime b) {
    return areMonthsSame(a, b) && a.day == b.day;
  }

  bool areMonthsSame(DateTime a, DateTime b) {
    return areYearsSame(a, b) && a.month == b.month;
  }

  bool areYearsSame(DateTime a, DateTime b) {
    return a.year == b.year;
  }

  ///Generate a month given the start date of month as a list of list of integers
  /// e.g. [[30, 1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12, 13],..]. Weeks start
  /// from Monday.
  List<List<int>> generateMonth(DateTime firstOfMonth) {
    List<List<int>> rowValueList = [];

    //Adding the first week
    DateTime endWeek =
    firstOfMonth.add(Duration(days: 7 - firstOfMonth.weekday));
    DateTime startWeek = endWeek.subtract(Duration(days: 6));
    List<int> first = [];
    for (DateTime j = startWeek;
    j.compareTo(endWeek) <= 0;
    j = j.add(Duration(days: 1))) {
      first.add(j.day);
    }
    rowValueList.add(first);

    //Moving the counters
    int i = endWeek.day + 1;
    endWeek = endWeek.add(Duration(days: 7));

    //Looping to add the other weeks inside the month
    while (endWeek.month == firstOfMonth.month) {
      List<int> temp = [];
      for (int j = i; j <= endWeek.day; j++) {
        temp.add(j);
      }
      rowValueList.add(temp);
      i = 1 + endWeek.day;
      endWeek = endWeek.add(Duration(days: 7));
    }

    //Adding the last week
    if(endWeek.day < 7) {
      List<int> last = [];
      startWeek = endWeek.subtract(Duration(days: 6));
      for (DateTime j = startWeek;
      j.compareTo(endWeek) <= 0;
      j = j.add(Duration(days: 1))) {
        last.add(j.day);
      }
      rowValueList.add(last);
    }
    //print(rowValueList);
    return rowValueList;
  }

  calendarHeader(){
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      child: Center(
        child: CommonText(
            formatDate(showDate),
          fontSize: 16,
        ),
      ),
    );  }


    leftArrow(){
    return Container(
      child: InkWell(
       child: CommonImageAsset(image: Constants.ic_arrow_left_full,height: 25.0,width: 25.0,),
        onTap: () {
          DateTime curr = showDate;
          setState(() {
            //set calList to previous month to showDate and showDate
            calList = [
              Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: returnRowList(DateTime(
                      showDate.year,
                      showDate.month - 1,
                      1))),
              Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: returnRowList(DateTime(
                      showDate.year, showDate.month, 1))),
            ];
            //Decrement the showDate by 1 month
            showDate = DateTime(
                showDate.year, showDate.month - 1, 1);
          });

          //Fade in/out the expand icon if current month is not displayed month
          if (areMonthsSame(curr, DateTime.now())) {
            Future.delayed(Duration(milliseconds: 1), () {
              setState(() {});
            });
          } else if (areMonthsSame(
              showDate, DateTime.now())) {
            Future.delayed(Duration(milliseconds: 300), () {
              setState(() {});
            });
          }
          pageController.jumpToPage(1);
          pageController.previousPage(
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        },
      ),
    );
    }

    rightArrow(){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        // enableFeedback: _expanded,
          child: CommonImageAsset(image: Constants.ic_arrow_right_full,height: 25.0,width: 25.0,),
          onTap: () {
            DateTime curr = showDate;
            setState(() {
              //set calList to showDate and showDate incremented by 1 month
              calList = [
                Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: returnRowList(DateTime(
                        showDate.year, showDate.month, 1))),
                Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: returnRowList(DateTime(
                        showDate.year,
                        showDate.month + 1,
                        1))),
              ];
              //Increment showDate by a month
              showDate = DateTime(
                  showDate.year, showDate.month + 1, 1);
            });

            //Fade in/out the expand icon if current month is not displayed month
            if (areMonthsSame(curr, DateTime.now())) {
              Future.delayed(Duration(milliseconds: 1), () {
                setState(() {});
              });
            } else if (areMonthsSame(
                showDate, DateTime.now())) {
              Future.delayed(Duration(milliseconds: 300), () {
                setState(() {});
              });
            }
            pageController.jumpToPage(0);
            pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }
      ),
    );
    }

  //Format the received date into full month and year format
  String formatDate(DateTime date) => new DateFormat("MMMM yyyy").format(date);

}



class CustomScrollPhysics extends ScrollPhysics {
  final double itemDimension;

  const CustomScrollPhysics(
      {@required this.itemDimension, ScrollPhysics parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(
        itemDimension: itemDimension, parent: buildParent(ancestor));
  }

  double _getPage(ScrollMetrics position, double portion) {
    // <--
    return (position.pixels + portion) / itemDimension;
    // -->
  }

  double _getPixels(double page, double portion) {
    // <--
    return (page * itemDimension) - portion;
    // -->
  }

  double _getTargetPixels(
      ScrollMetrics position,
      Tolerance tolerance,
      double velocity,
      double portion,
      ) {
    // <--
    double page = _getPage(position, portion);
    // -->
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    // <--
    return _getPixels(page.roundToDouble(), portion);
    // -->
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    final Tolerance tolerance = this.tolerance;
    // <--
    final portion = (position.extentInside - itemDimension) / 2;
    final double target =
    _getTargetPixels(position, tolerance, velocity, portion);
    // -->
    if (target != position.pixels) {
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}