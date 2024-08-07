import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class CustomSettingsRow extends StatelessWidget {
  const CustomSettingsRow({
    super.key,
    required this.text,
    required this.icon,
    this.isLanguage = false,
    this.isTheme = false,
    this.isNotification = false,
    this.onTap,
  });
  final String text;
  final String icon;
  final bool isLanguage;
  final bool isTheme;
  final bool isNotification;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 21.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  text.tr(),
                  style: getMediumStyle(
                      fontSize: 15.sp, color: AppColors.menuTextColor),
                ),
                const Spacer(),
                isLanguage
                    ? Text(
                        "lang".tr(),
                        style: getMediumStyle(
                            fontSize: 15.sp, color: AppColors.menuTextColor),
                      )
                    : isNotification
                        ? NotificationSwitch()
                        : isTheme
                            ? ThemeSwitch()
                            : Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: AppColors.menuTextColor,
                                size: 20.w,
                              )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
          ),
          child: Divider(
            height: 2,
            color: AppColors.settingDivider,
          ),
        ),
      ],
    );
  }
}
class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: true,
      activeColor: AppColors.primary,
      onChanged: (bool? value) {
        //  setState(() {
        //    switchValue = value ?? false;
        //  });
      },
    );
  }
}

class NotificationSwitch extends StatelessWidget {
  const NotificationSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: true,
      activeColor: AppColors.primary,
      onChanged: (bool? value) {
        //  setState(() {
        //    switchValue = value ?? false;
        //  });
      },
    );
  }
}
