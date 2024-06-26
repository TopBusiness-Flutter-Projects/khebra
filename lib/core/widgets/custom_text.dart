import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width / 44),
      child: Text(text.tr(), style: getBoldStyle(color: AppColors.primaryText)),
    );
  }
}
