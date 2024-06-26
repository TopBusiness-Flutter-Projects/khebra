import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';

TextStyle _getTextStyle(
    {required double fontSize,
    double? fontHeight,
    required FontWeight fontWeight,
    required Color color}) {
  return TextStyle(
      height: fontHeight,
      fontSize: fontSize,
      fontFamily: AppStrings.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// light style 300
TextStyle getLightStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w300,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}

// regular style 400
TextStyle getRegularStyle(
    {Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}

// regular style 600
TextStyle getMediumStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}

// bold style 700
TextStyle getBoldStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w700,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}

// Extra Bold style 800
TextStyle getExtraStyle({Color? color, double? fontHeight, double? fontSize}) {
  return _getTextStyle(
      color: color ?? AppColors.primaryText,
      fontWeight: FontWeight.w800,
      fontSize: fontSize ?? 16.sp,
      fontHeight: fontHeight);
}
