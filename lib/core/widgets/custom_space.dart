import 'package:flutter/material.dart';
import 'package:khebra/core/utils/app_const.dart';

class CustomSpace extends StatelessWidget {
  const CustomSpace({
    super.key,
    this.isExtra = false,
  });
  final bool isExtra;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isExtra
          ? AppConstants.sizedBoxExtraHeight
          : AppConstants.sizedBoxHeight,
    );
  }
}

class CustomDoubleSpace extends StatelessWidget {
  const CustomDoubleSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.sizedBoxDoubleHeight,
    );
  }
}
