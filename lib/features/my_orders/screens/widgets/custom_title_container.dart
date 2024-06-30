import 'package:flutter/material.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';


class CustomTitleContainer extends StatelessWidget {
  const CustomTitleContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.red),
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryGrey),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: getRegularStyle(fontSize: 14, color: AppColors.gray),
        ),
      ),
    );
  }
}
