import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';

import '../../../../core/utils/styles/app_fonts.dart';

class ServicesType extends StatelessWidget {
  const ServicesType({
    super.key,
    this.isSelected = false,
    required this.departmentName,
  });
  final bool isSelected;

  final String departmentName;
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 56,
        // width: MediaQuery.of(context).size.width / 2.5,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.gray1,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            departmentName.tr(),
            maxLines: 2,
            style: getRegularStyle(color: AppColors.white, fontHeight: 1),
          ),
        ));
  }
}
