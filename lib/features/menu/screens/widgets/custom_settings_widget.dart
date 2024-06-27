import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';

class CustomSettingsRow extends StatelessWidget {
  const CustomSettingsRow({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 26.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                text.tr(),
                style: getMediumStyle(
                    fontSize: 17.sp, color: AppColors.menuTextColor),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.menuTextColor,
                size: 20.w,
              )
            ],
          ),
        ),
        Divider(
          height: 2,
          color: AppColors.settingDivider,
        ),
      ],
    );
  }
}
