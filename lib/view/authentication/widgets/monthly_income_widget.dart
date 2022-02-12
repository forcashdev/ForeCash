/*Widget monthlyIncomeWidget({BoxConstraints? constraints}) {
  int lengthOfMonthlyIncome = 0;
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate({BuildContext? context}) async {
    final pickedDate = await showDatePicker(context: context!, initialDate: currentDate, firstDate: DateTime(2015), lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      currentDate = pickedDate;
    }
  }

  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());

  // return ListView.builder(
  //   // physics: constraints!.maxWidth > 1000 ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
  //   shrinkWrap: true, itemCount: MonthlyIncomeModelOld.monthlyIncomeList.length,
  //   // itemCount: MonthlyIncomeModelOld.monthlyIncomeList.length,
  //   itemBuilder: (context, index) {
  //     final DataGridController controllerGrid = DataGridController();
  //     // print("name");
  //     // print(snapshot.data?.data?[index].name);
  //     return Padding(
  //       padding: const EdgeInsets.only(bottom: 10.0),
  //       child: InkWell(
  //         onTap: () {
  //           controllerGrid.scrollToHorizontalOffset(300);
  //         },
  //         child: Table(
  //             // gridLinesVisibility: GridLinesVisibility.both,
  //             // headerGridLinesVisibility: GridLinesVisibility.both,
  //             // controller: controllerGrid,
  //             // shrinkWrapRows: true,
  //             // source: MonthlyIncomeModelOld(),
  //             // defaultColumnWidth: Get.width * 0.3,
  //             columnWidths: <int, TableColumnWidth>{
  //               0: FixedColumnWidth(Get.width * 0.035),
  //               1: FixedColumnWidth(Get.width * 0.3),
  //               2: FixedColumnWidth(Get.width * 0.2),
  //               3: FixedColumnWidth(Get.width * 0.2),
  //               4: FixedColumnWidth(Get.width * 0.2),
  //               5: FixedColumnWidth(Get.width * 0.2),
  //             },
  //
  //             // columns: [
  //             //   constraints!.maxWidth < 1000
  //             //       ? GridColumn(
  //             //           columnName: '1',
  //             //           label: Container(
  //             //             height: Get.height * 0.044,
  //             //             margin: EdgeInsets.only(right: Get.width * 0.02),
  //             //             decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(2)),
  //             //           ),
  //             //         )
  //             //       : GridColumn(
  //             //           columnName: '1',
  //             //           label: SizedBox(
  //             //             height: Get.height * 0.044,
  //             //             child: Padding(
  //             //               padding: const EdgeInsets.only(left: 5.0),
  //             //               child: GetBuilder<CheckBoxController>(
  //             //                 builder: (controller) {
  //             //                   return Checkbox(
  //             //                     activeColor: cameraBackGroundColor,
  //             //                     checkColor: Colors.white,
  //             //                     value: checkBoxController.monthlyIncomeCheckBoxValueList[index],
  //             //                     onChanged: (value) {
  //             //                       checkBoxController.selectCheckBox(value: value, index: index);
  //             //                     },
  //             //                   );
  //             //                 },
  //             //               ),
  //             //             ),
  //             //           ),
  //             //         ),
  //             //   GridColumn(
  //             //     columnName: '2',
  //             //     label: Padding(
  //             //       padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth > 1000 ? 5 : 0.0),
  //             //       child: commonTextFormField(
  //             //           inputAction: TextInputAction.done,
  //             //           inputFormatter: [characterInputFormatter()],
  //             //           contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
  //             //           textStyle: incomeNameStyle,
  //             //           textEditingController: TextEditingController(text: MonthlyIncomeModelOld.monthlyIncomeList[index].expenseName)),
  //             //     ),
  //             //   ),
  //             //   GridColumn(
  //             //     columnName: '3',
  //             //     label: Container(
  //             //       padding: const EdgeInsets.symmetric(horizontal: 4),
  //             //       // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
  //             //       // height: Get.height * 0.044,
  //             //       alignment: Alignment.center,
  //             //       child: GetBuilder<SelectedDropDownItem>(
  //             //         builder: (controller1) {
  //             //           return commonDropDown(
  //             //               selectedItemTextStyle: dropDownStyle2,
  //             //               valueTextStyle: dropDownStyle,
  //             //               // value: snapshot.data?.data?[index].paidOn,
  //             //               value: controller.selectedMonthlyIncomeDateList[index],
  //             //               itemList: dateList,
  //             //               onChanged: (item) {
  //             //                 controller.changeDate(item: item, index: index);
  //             //                 print(item);
  //             //               });
  //             //         },
  //             //       ),
  //             //       margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
  //             //       decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
  //             //     ),
  //             //   ),
  //             //   GridColumn(
  //             //     columnName: '4',
  //             //     label: Container(
  //             //       padding: const EdgeInsets.symmetric(
  //             //         horizontal: 4,
  //             //       ),
  //             //       // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
  //             //       // height: Get.height * 0.044,
  //             //       alignment: Alignment.center,
  //             //       child: GetBuilder<SelectedDropDownItem>(
  //             //         builder: (controller1) {
  //             //           // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
  //             //           return commonDropDown(
  //             //               selectedItemTextStyle: dropDownStyle2,
  //             //               valueTextStyle: dropDownStyle,
  //             //               value: controller.selectedMonthlyIncomeMonthList[index],
  //             //               itemList: months,
  //             //               onChanged: (item) {
  //             //                 controller.changeItem(item: item, index: index);
  //             //                 print(item);
  //             //               });
  //             //         },
  //             //       ),
  //             //       margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
  //             //       decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
  //             //     ),
  //             //   ),
  //             // ]
  //             children: [
  //               TableRow(
  //                 children: [
  //                   constraints!.maxWidth < 1000
  //                       ? Container(
  //                           height: Get.height * 0.044,
  //                           margin: EdgeInsets.only(right: Get.width * 0.02),
  //                           decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(2)),
  //                         )
  //                       : SizedBox(
  //                           height: Get.height * 0.044,
  //                           child: Padding(
  //                             padding: const EdgeInsets.only(left: 5.0),
  //                             child: GetBuilder<CheckBoxController>(
  //                               builder: (controller) {
  //                                 return Checkbox(
  //                                   activeColor: cameraBackGroundColor,
  //                                   checkColor: Colors.white,
  //                                   value: checkBoxController.monthlyIncomeCheckBoxValueList[index],
  //                                   onChanged: (value) {
  //                                     checkBoxController.selectCheckBox(value: value, index: index);
  //                                   },
  //                                 );
  //                               },
  //                             ),
  //                           ),
  //                         ),
  //                   TableCell(
  //                     verticalAlignment: TableCellVerticalAlignment.fill,
  //                     child: Padding(
  //                       padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth > 1000 ? 5 : 0.0),
  //                       child: commonTextFormField(
  //                           inputAction: TextInputAction.done,
  //                           inputFormatter: [characterInputFormatter()],
  //                           contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
  //                           textStyle: incomeNameStyle,
  //                           textEditingController: TextEditingController(text: MonthlyIncomeModelOld.monthlyIncomeList[index].expenseName)),
  //                     ),
  //                   ),
  //                   TableCell(
  //                     verticalAlignment: TableCellVerticalAlignment.fill,
  //                     child: Container(
  //                       padding: const EdgeInsets.symmetric(horizontal: 4),
  //                       // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
  //                       // height: Get.height * 0.044,
  //                       alignment: Alignment.center,
  //                       child: GetBuilder<SelectedDropDownItem>(
  //                         builder: (controller1) {
  //                           return commonDropDown(
  //                               selectedItemTextStyle: dropDownStyle2,
  //                               valueTextStyle: dropDownStyle,
  //                               // value: snapshot.data?.data?[index].paidOn,
  //                               value: controller.selectedMonthlyIncomeDateList[index],
  //                               itemList: dateList,
  //                               onChanged: (item) {
  //                                 controller.changeDate(item: item, index: index);
  //                                 print(item);
  //                               });
  //                         },
  //                       ),
  //                       margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
  //                       decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
  //                     ),
  //                   ),
  //                   TableCell(
  //                     verticalAlignment: TableCellVerticalAlignment.fill,
  //                     child: Container(
  //                       padding: const EdgeInsets.symmetric(
  //                         horizontal: 4,
  //                       ),
  //                       // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
  //                       // height: Get.height * 0.044,
  //                       alignment: Alignment.center,
  //                       child: GetBuilder<SelectedDropDownItem>(
  //                         builder: (controller1) {
  //                           // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
  //                           return commonDropDown(
  //                               selectedItemTextStyle: dropDownStyle2,
  //                               valueTextStyle: dropDownStyle,
  //                               value: controller.selectedMonthlyIncomeMonthList[index],
  //                               itemList: months,
  //                               onChanged: (item) {
  //                                 controller.changeItem(item: item, index: index);
  //                                 print(item);
  //                               });
  //                         },
  //                       ),
  //                       margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
  //                       decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
  //                     ),
  //                   ),
  //                   TableCell(
  //                       verticalAlignment: TableCellVerticalAlignment.fill,
  //                       child: GestureDetector(
  //                         onTap: () {
  //                           _selectDate(context: context);
  //                         },
  //                         child: Container(
  //                           alignment: Alignment.centerLeft,
  //                           child: Text(
  //                             '${DateFormat('yyyy-MM-dd').format(currentDate)}',
  //                             style: dateStyle,
  //                             maxLines: 1,
  //                           ),
  //                           margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
  //                           decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
  //                         ),
  //                       )),
  //                   TableCell(
  //                     verticalAlignment: TableCellVerticalAlignment.fill,
  //                     child: Padding(
  //                       padding: EdgeInsets.only(right: Get.width * 0.02),
  //                       child: commonTextFormField(
  //                           prefixText: '\$',
  //                           prefixstyle: incomeNameStyle,
  //                           inputAction: TextInputAction.done,
  //                           inputFormatter: [digitInputFormatter()],
  //                           contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
  //                           textStyle: incomeNameStyle,
  //                           textEditingController: TextEditingController(text: MonthlyIncomeModelOld.monthlyIncomeList[index].amount)),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ]),
  //       ),
  //     );
  //   },
  //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisSpacing: 0.0, childAspectRatio: 8 / 1),
  // );
  return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    // physics: constraints!.maxWidth > 1000 ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
    shrinkWrap: true, itemCount: MonthlyIncomeModelOld.monthlyIncomeList.length,
    // itemCount: MonthlyIncomeModelOld.monthlyIncomeList.length,
    itemBuilder: (context, index) {
      TextEditingController _incomeName = TextEditingController(text: MonthlyIncomeModelOld.monthlyIncomeList[index].expenseName);
      TextEditingController _amount = TextEditingController(text: MonthlyIncomeModelOld.monthlyIncomeList[index].amount);
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Slidable(
          actionExtentRatio: 0.13,
          enabled: constraints!.maxWidth > 1000 ? false : true,
          secondaryActions: [
            InkWell(
              onTap: () {
                // setState(() {
                MonthlyIncomeModelOld.monthlyIncomeList.removeAt(index);
                // });
              },
              child: Container(
                  decoration: BoxDecoration(color: colorsFFEBEB, borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.symmetric(horizontal: 7.0),
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    deleteImage,
                    height: Get.height * 0.04,
                    // width: 30.0,
                  )),
            ),
          ],
          actionPane: const SlidableDrawerActionPane(),
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(0.35),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(2),
              4: FlexColumnWidth(2),
              5: FlexColumnWidth(2),
            },
            children: [
              TableRow(
                children: [
                  constraints.maxWidth < 1000
                      ? Container(
                          height: Get.height * 0.044,
                          margin: EdgeInsets.only(right: Get.width * 0.02),
                          decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(2)),
                        )
                      : SizedBox(
                          height: Get.height * 0.044,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: GetBuilder<CheckBoxController>(
                              builder: (controller) {
                                return Checkbox(
                                  activeColor: cameraBackGroundColor,
                                  checkColor: Colors.white,
                                  value: checkBoxController.monthlyIncomeCheckBoxValueList[index],
                                  onChanged: (value) {
                                    checkBoxController.selectCheckBox(value: value, index: index);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Padding(
                      padding: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02, left: constraints.maxWidth > 1000 ? 5 : 0.0),
                      child: commonTextFormField(
                          hintText: 'Income Name',
                          hintStyle: incomeNameStyle,
                          inputAction: TextInputAction.done,
                          inputFormatter: [characterInputFormatter()],
                          contentPadding: EdgeInsets.fromLTRB(10.0, Get.height * 0.020, 10.0, Get.height * 0.009),
                          textStyle: incomeNameStyle,
                          textEditingController: _incomeName),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                      // height: Get.height * 0.044,
                      alignment: Alignment.center,
                      child: GetBuilder<SelectedDropDownItem>(
                        builder: (controller1) {
                          return commonDropDown(
                              selectedItemTextStyle: dropDownStyle2,
                              valueTextStyle: dropDownStyle,
                              // value: incomeData?[index].paidOn as Object,

                              value: controller.selectedMonthlyIncomeDateList[index],
                              itemList: dateList,
                              onChanged: (item) {
                                print(item);
                                // CreateIncomeController.to.valueDrop.value = item;
                                //selectedMonthlyIncomeDateListDouble[index] = item;
                                // selectedMonthlyIncomeDateListDouble[index] = item;
                                controller.changeDate(item: item, index: index);
                              });
                        },
                      ),
                      margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                      decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      // width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                      // height: Get.height * 0.044,
                      alignment: Alignment.center,
                      child: GetBuilder<SelectedDropDownItem>(
                        builder: (controller1) {
                          // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                          return commonDropDown(
                              selectedItemTextStyle: dropDownStyle2,
                              valueTextStyle: dropDownStyle,
                              value: controller.selectedMonthlyIncomeMonthList[index],
                              itemList: months,
                              onChanged: (item) {
                                controller.changeItem(item: item, index: index);
                                print(item);
                              });
                        },
                      ),
                      margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                      decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.fill,
                      child: GestureDetector(
                        onTap: () {
                          _selectDate(context: context);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${DateFormat('yyyy-MM-dd').format(currentDate)}',
                            style: dateStyle,
                            maxLines: 1,
                          ),
                          margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.02 : Get.width * 0.02),
                          decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                        ),
                      )),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Padding(
                      padding: EdgeInsets.only(right: Get.width * 0.02),
                      child: commonTextFormField(
                          hintText: 'Amount',
                          hintStyle: incomeNameStyle,
                          prefixText: '\$',
                          prefixstyle: incomeNameStyle,
                          inputAction: TextInputAction.done,
                          inputFormatter: [digitInputFormatter()],
                          contentPadding: EdgeInsets.fromLTRB(5.0, Get.height * 0.020, 5.0, Get.height * 0.009),
                          textStyle: incomeNameStyle,
                          textEditingController: _amount),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      // } else {
      //   return Container();
      // }
    },
    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisSpacing: 0.0, childAspectRatio: 8 / 1),
  );
}

monthlyIncomeTableWidget({BoxConstraints? constraints}) {
  final controller = Get.put(SelectedDropDownItem());
  final checkBoxController = Get.put(CheckBoxController());
  return Table(
    columnWidths: const <int, TableColumnWidth>{
      0: FlexColumnWidth(0.35),
      1: FlexColumnWidth(3),
      2: FlexColumnWidth(2),
      3: FlexColumnWidth(2),
      4: FlexColumnWidth(2),
    },
    children: [
      ...List.generate(
          MonthlyIncomeModelOld.monthlyIncomeList.length,
          (index) => TableRow(
                children: [
                  constraints!.maxWidth < 1000
                      ? Container(
                          height: Get.height * 0.044,
                          width: 8,
                          margin: EdgeInsets.only(right: Get.width * 0.02),
                          decoration: BoxDecoration(color: cameraBackGroundColor, borderRadius: BorderRadius.circular(2)),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: GetBuilder<CheckBoxController>(
                            builder: (controller) {
                              return Checkbox(
                                activeColor: cameraBackGroundColor,
                                checkColor: Colors.white,
                                value: checkBoxController.monthlyIncomeCheckBoxValueList[index],
                                onChanged: (value) {
                                  checkBoxController.selectCheckBox(value: value, index: index);
                                },
                              );
                            },
                          ),
                        ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: constraints.maxWidth < 1000 ? Get.width * 0.29 : Get.width * 0.15,
                    height: Get.height * 0.044,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: constraints.maxWidth > 1000 ? 10 : 0.0, right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02, bottom: 10),
                    child: Text(
                      '${MonthlyIncomeModelOld.monthlyIncomeList[index].expenseName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: incomeNameStyle,
                    ),
                    // child: const TextField(
                    //   style: textFieldStyle,
                    //   decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                    // ),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 6),
                    width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                    height: Get.height * 0.044,
                    alignment: Alignment.center,
                    child: GetBuilder<SelectedDropDownItem>(
                      builder: (controller1) {
                        // return commonDropDown(itemList: months, value: controller.selectedItemValueList[index]);
                        return commonDropDown(
                            selectedItemTextStyle: dropDownStyle2,
                            valueTextStyle: dropDownStyle,
                            value: controller.selectedMonthlyIncomeDateList[index],
                            itemList: dateList,
                            onChanged: (item) {
                              controller.changeDate(item: item, index: index);
                              print(item);
                            });
                        //   DropdownButtonHideUnderline(
                        //   child: DropdownButton(
                        //     value: controller.selectedMonthlyIncomeDateList[index],
                        //     // value: controller.selectedItem,
                        //     style: dropDownStyle,
                        //
                        //     items: dateList.map((String items) {
                        //       return DropdownMenuItem(
                        //         value: items,
                        //         child: Text(
                        //           items,
                        //           style: dropDownStyle2,
                        //         ),
                        //       );
                        //     }).toList(),
                        //     onChanged: (item) {
                        //       controller.changeDate(item: item, index: index);
                        //     },
                        //     isExpanded: true,
                        //
                        //     icon: const Icon(
                        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                        //       // color: AppTheme.colorGrey,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                    margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 6,
                    ),
                    width: constraints.maxWidth < 1000 ? Get.width * 0.18 : Get.width * 0.15,
                    height: Get.height * 0.044,
                    alignment: Alignment.center,
                    child: GetBuilder<SelectedDropDownItem>(
                      builder: (controller1) {
                        // return commonDropDown(itemList: dateList, value: controller.selectedDateItemValueList[index]);
                        return commonDropDown(
                            selectedItemTextStyle: dropDownStyle2,
                            valueTextStyle: dropDownStyle,
                            value: controller.selectedMonthlyIncomeMonthList[index],
                            itemList: months,
                            onChanged: (item) {
                              controller.changeItem(item: item, index: index);
                              print(item);
                            });
                        //   DropdownButtonHideUnderline(
                        //   child: DropdownButton(
                        //     value: controller.selectedMonthlyIncomeMonthList[index],
                        //     // value: controller.selectedItem,
                        //     style: dropDownStyle,
                        //     items: months.map((String items) {
                        //       return DropdownMenuItem(
                        //         value: items,
                        //         child: Text(
                        //           items,
                        //           style: dropDownStyle2,
                        //         ),
                        //       );
                        //     }).toList(),
                        //     onChanged: (item) {
                        //       controller.changeItem(item: item, index: index);
                        //     },
                        //     isExpanded: true,
                        //
                        //     icon: const Icon(
                        //       Icons.keyboard_arrow_down, color: Color(0xff777C90),
                        //       // color: AppTheme.colorGrey,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                    margin: EdgeInsets.only(right: constraints.maxWidth < 1000 ? Get.width * 0.04 : Get.width * 0.02),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    // width: sequenceSize.width * 0.14,
                    height: Get.height * 0.044,
                    // width: Get.width * 0.14,
                    alignment: Alignment.centerLeft,

                    child: Text(
                      '\$${MonthlyIncomeModelOld.monthlyIncomeList[index].amount}',
                      style: incomeNameStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // child: const TextField(
                    //   style: textFieldStyle,
                    //   decoration: InputDecoration(prefixStyle: prefixTextStyle, prefixText: '\$', contentPadding: EdgeInsets.only(bottom: 7), border: InputBorder.none),
                    // ),
                    margin: EdgeInsets.only(right: Get.width * 0.04),
                    decoration: BoxDecoration(color: backGroundColor, borderRadius: BorderRadius.circular(4)),
                  ),
                ],
              ))
    ],
  );
}*/
