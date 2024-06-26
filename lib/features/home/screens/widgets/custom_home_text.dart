import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';

class CustomHomeText extends StatelessWidget {
  const CustomHomeText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(text.tr(),
          style: getBoldStyle(color: AppColors.secondPrimary, fontSize: 19.sp)),
    );
  }
}
