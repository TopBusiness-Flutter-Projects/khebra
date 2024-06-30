import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';

class CustomInfoRow extends StatelessWidget {
  const CustomInfoRow({
    super.key,
    required this.path,
    required this.text,
  });
  final String path;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(
        path,
        width: 22.w,
        height: 22.w,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        text,
        style: getRegularStyle(
          color: AppColors.secondTextColor,
        ),
      )
    ]);
  }
}
