import 'package:flutter/material.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';

class CustomBorderedContainer extends StatelessWidget {
  const CustomBorderedContainer({
    super.key,
    required this.child,
    this.isDropDown = false,
  });

  final Widget child;
  final bool isDropDown;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderColor)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: isDropDown ? 5 : 18),
        child: DropdownButtonHideUnderline(
          child: child,
        ),
      ),
    );
  }
}
