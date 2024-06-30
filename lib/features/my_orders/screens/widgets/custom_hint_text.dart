import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';


class CustomHinttext extends StatelessWidget {
  const CustomHinttext({
    super.key,
    required this.hint,
  });
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Text(
      hint,
      style: getRegularStyle(fontSize: 14, color: AppColors.gray),
    ).tr();
  }
}