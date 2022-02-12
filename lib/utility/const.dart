import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:get/get.dart';

import 'colors.dart';

TextStyle headTitleTheme = TextStyle(
  fontSize: 17.sp,
  fontWeight: FontWeight.w700,
);
TextStyle mobileAppBarStyle = TextStyle(
  color: Colors.black,
  fontSize: 17.sp,
  fontWeight: FontWeight.w700,
);
const commonButtonTheme = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: AppTheme.fontName, color: Colors.white);
const commonBackButtonTheme = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: AppTheme.fontName, color: Colors.black);

TextStyle createAccountTextStyle = TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w300, fontSize: 12.sp);
TextStyle fullNameHintStyle = TextStyle(
  color: commonTextColor2,
  fontSize: 11.sp,
  fontWeight: FontWeight.w700,
  fontFamily: AppTheme.fontName,
);
const forgotPassStyle = TextStyle(
  color: commonTextColor2,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);
TextStyle alreadyAccountStyle = TextStyle(fontSize: 12.sp, color: commonTextColor, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w400);
TextStyle dontHaveAccountStyle = TextStyle(fontSize: 12.sp, color: commonTextColor, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w400);
TextStyle loginStyle = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: commonButtonColor, fontFamily: AppTheme.fontName);
TextStyle textSpanStyle1 = TextStyle(
  fontWeight: FontWeight.w200,
  fontSize: 12.sp,
  height: 1.7,
  color: Color(0xFF777C90),
  fontFamily: AppTheme.fontName,
);

TextStyle textSpanStyle2 = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 12.sp,
  fontFamily: AppTheme.fontName,
  color: Color(0xFF777C90),
);

TextStyle columnNameListStyle = TextStyle(
  fontSize: 11.sp,
  fontWeight: FontWeight.w500,
  color: commonGreyColor,
);
TextStyle incomeNameStyle = TextStyle(fontSize: 11.sp, color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName);
TextStyle dateStyle = TextStyle(fontSize: 10.sp, color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName);
TextStyle emailStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w300,
  fontFamily: AppTheme.fontName,
);

TextStyle textFieldHintStyle = TextStyle(fontSize: 11.sp, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500);
TextStyle signupButtonStyle = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: commonButtonColor);
TextStyle searchBankStyle = TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w400, fontSize: 12.sp);
TextStyle expenseNameStyle = TextStyle(fontSize: 11.sp, color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName);
TextStyle dropDownStyle = TextStyle(color: Color(0xff777C90), fontSize: 10.sp, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName);
TextStyle greyMontserrat10W500 = TextStyle(color: Color(0xff777C90), fontSize: 10.sp, fontWeight: FontWeight.w500, fontFamily: AppTheme.fontName);
TextStyle blackMontserrat10W500 = TextStyle(color: Color(0xff252733), fontSize: 10.sp, fontWeight: FontWeight.w500, fontFamily: AppTheme.fontName);
TextStyle dropDownStyle2 = TextStyle(color: Color(0xff777C90), fontFamily: AppTheme.fontName, fontWeight: FontWeight.w400, fontSize: 11.sp);
TextStyle amountStyle = TextStyle(fontSize: 11.sp, color: commonGreyColor, fontFamily: AppTheme.fontName);
TextStyle textFieldStyle = TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 12.sp);
const prefixTextStyle = TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 13);
TextStyle addWeekIncomeStyle = TextStyle(fontSize: 12.sp, color: Color(0xff087DA1), fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, decoration: TextDecoration.underline);
TextStyle expenseNameStyle2 = TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 11.sp);
const chooseDateStyle = TextStyle(
  color: commonGreyColor,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);
TextStyle greyMontserratW400 = TextStyle(fontSize: 11.sp, color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName);
TextStyle greyMontserratW500 = TextStyle(
  fontSize: 11.sp,
  color: commonGreyColor,
  fontWeight: FontWeight.w500,
);
const resetTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: Color(0xFF777C90),
  fontFamily: AppTheme.fontName,
);
const dropDownSubTitleStyle = TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: 14,
  color: Color(0xFF777C90),
  fontFamily: AppTheme.fontName,
);

const textFieldStyle2 = TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500);
const recomendedTextStyle = TextStyle(
  fontFamily: AppTheme.fontName,
  fontWeight: FontWeight.w200,
  color: Color(0xFF777C90),
);

TextStyle backButtonStyle = TextStyle(
  color: Color(0xff174261),
  fontSize: 12.sp,
  fontFamily: AppTheme.fontName,
  fontWeight: FontWeight.w600,
);
const userNameStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);
const userNameProfileStyle = TextStyle(color: commonTextColor2, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w600);
TextStyle allSetTextStyle = TextStyle(color: Colors.white, fontSize: Get.mediaQuery.size.aspectRatio * 45, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500);
TextStyle foreCashWeeklyBalanceTextStyle = TextStyle(fontFamily: AppTheme.fontName, color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.sp);
TextStyle foreCashWeeklyBalanceTextStyleWeb = TextStyle(fontFamily: AppTheme.fontName, color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10.sp);
TextStyle currentWeekTextStyle = TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 11.sp);
TextStyle currentWeekDateTextStyle = TextStyle(fontFamily: AppTheme.fontName, color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.w600, fontSize: 11.sp);
TextStyle foreCashWeeklyBalanceStyle = TextStyle(fontFamily: AppTheme.fontName, color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14.sp);
TextStyle foreCashWeeklyBalanceStyleWeb = TextStyle(fontFamily: AppTheme.fontName, color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.sp);
TextStyle incomeExpenseTExtStyle = TextStyle(color: Colors.white, fontSize: 11.sp, fontFamily: AppTheme.fontName);
TextStyle blackCalendarStyle11W500 = TextStyle(fontFamily: AppTheme.fontName, fontSize: 11.sp, fontWeight: FontWeight.w500);
TextStyle greyDateTexStyle10W400 = TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w400, fontSize: 10.sp, color: greyColor);
TextStyle greyTexStyle10W500 = TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, fontSize: 10.sp, color: greyColor);
TextStyle greyIncomeTexStyle10W500 = TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, fontSize: 10.sp, color: commonTextColor2);

//Hardik

const greyMontserrat14w400 = TextStyle(
  color: commonTextColor2,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: AppTheme.fontName,
);

const greyMontserrat12w500 = TextStyle(
  color: commonTextColor2,
  fontSize: 12,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);

const greyMontserrat14w500 = TextStyle(
  color: commonTextColor2,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);

const grey2Montserrat14w500 = TextStyle(
  color: greyColor969CB2,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);

const blackMontserrat12w500 = TextStyle(
  color: colors252733,
  fontSize: 12,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);
const blackMontserrat14w500 = TextStyle(
  color: colors252733,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);

const blackMontserrat16w700 = TextStyle(
  color: colors252733,
  fontSize: 16,
  fontWeight: FontWeight.w700,
  fontFamily: AppTheme.fontName,
);

const blackMontserrat13w500 = TextStyle(
  color: colors252733,
  fontSize: 13,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);

const blackMontserrat14w600 = TextStyle(
  color: colors252733,
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: AppTheme.fontName,
);

const blackMontserrat10w400 = TextStyle(
  color: colors252733,
  fontSize: 10,
  fontWeight: FontWeight.w400,
  fontFamily: AppTheme.fontName,
);

const whiteMontserrat14w500 = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);
TextStyle blackMontserrat15W600 = TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, fontFamily: AppTheme.fontName);
TextStyle blackMontserrat13W600 = TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600, fontFamily: AppTheme.fontName);
TextStyle redMontserrat11W500 = TextStyle(decoration: TextDecoration.underline, fontFamily: AppTheme.fontName, color: Colors.red, fontWeight: FontWeight.w500, fontSize: 11.sp);
TextStyle greenMontserrat11W500 = TextStyle(decoration: TextDecoration.underline, fontFamily: AppTheme.fontName, color: cameraBackGroundColor, fontWeight: FontWeight.w500, fontSize: 11.sp);
TextStyle whiteMontserrat11W500 = TextStyle(fontSize: 11.sp, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, color: backGroundColor);
TextStyle blackMontserrat12W600 = TextStyle(color: colors252733, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w600, fontSize: 12.sp);
TextStyle blueMontserrat12W600 = TextStyle(color: containerColor, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w600, fontSize: 12.sp);
TextStyle blueMontserrat13W600 = TextStyle(color: containerColor, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w600, fontSize: 18.sp);
