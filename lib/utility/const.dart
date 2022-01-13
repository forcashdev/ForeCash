import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fore_cash/app_theme/app_theme.dart';
import 'package:get/get.dart';

import 'colors.dart';

const headTitleTheme = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
);
const mobileAppBarStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);
const commonButtonTheme = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: AppTheme.fontName, color: Colors.white);
const createAccountTextStyle = TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w300);
const fullNameHintStyle = TextStyle(
  color: commonTextColor2,
  fontWeight: FontWeight.w700,
  fontFamily: AppTheme.fontName,
);
const forgotPassStyle = TextStyle(
  color: commonTextColor2,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
);
const alreadyAccountStyle = TextStyle(color: commonTextColor, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w600);
const loginStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: commonButtonColor, fontFamily: AppTheme.fontName);
const textSpanStyle1 = TextStyle(
  fontWeight: FontWeight.w200,
  fontSize: 14,
  color: Color(0xFF777C90),
  fontFamily: AppTheme.fontName,
);

const textSpanStyle2 = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 14,
  fontFamily: AppTheme.fontName,
  color: Color(0xFF777C90),
);

const columnNameListStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: commonGreyColor,
);

const emailStyle = TextStyle(
  fontWeight: FontWeight.w300,
  fontFamily: AppTheme.fontName,
);

const textFieldHintStyle = TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500);
const signupButtonStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: commonButtonColor);
const searchBankStyle = TextStyle(fontFamily: AppTheme.fontName, fontWeight: FontWeight.w400);
const expenseNameStyle = TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName);
const dropDownStyle = TextStyle(color: Color(0xff777C90), fontSize: 13, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName);
const dropDownStyle2 = TextStyle(color: Color(0xff777C90), fontFamily: AppTheme.fontName, fontWeight: FontWeight.w400);
const amountStyle = TextStyle(color: commonGreyColor, fontFamily: AppTheme.fontName);
const textFieldStyle = TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 14);
const prefixTextStyle = TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 13);
const addWeekIncomeStyle = TextStyle(color: Color(0xff087DA1), fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500, decoration: TextDecoration.underline);
const expenseNameStyle2 = TextStyle(color: commonGreyColor, fontWeight: FontWeight.w400, fontFamily: AppTheme.fontName, fontSize: 14);
const chooseDateStyle = TextStyle(
  color: commonGreyColor,
  fontWeight: FontWeight.w500,
  fontFamily: AppTheme.fontName,
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

const backButtonStyle = TextStyle(
  color: Color(0xff174261),
  fontFamily: AppTheme.fontName,
  fontWeight: FontWeight.w600,
);
const userNameStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);
const userNameProfileStyle = TextStyle(color: commonTextColor2, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w600);
TextStyle allSetTextStyle = TextStyle(color: Colors.white, fontSize: Get.mediaQuery.size.aspectRatio * 45, fontFamily: AppTheme.fontName, fontWeight: FontWeight.w500);
const foreCashWeeklyBalanceTextStyle = TextStyle(fontFamily: AppTheme.fontName, color: Colors.white, fontWeight: FontWeight.w400);
TextStyle foreCashWeeklyBalanceStyle = TextStyle(fontFamily: AppTheme.fontName, color: Colors.white, fontWeight: FontWeight.w600, fontSize: Get.size.aspectRatio * 30);
TextStyle incomeExpenseTExtStyle = TextStyle(color: Colors.white, fontSize: Get.size.aspectRatio * 22, fontFamily: AppTheme.fontName);
