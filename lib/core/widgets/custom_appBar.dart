import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 18.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: onPressed ??
                  () {
                    Navigator.pop(context);
                  },
              icon: Icon(
                Icons.arrow_back,
                size: 20.h,
                
                color: AppColors.appBarText,
              )),
          Text(
            title.tr(),
            style: getBoldStyle(
              fontSize: 20.sp,
              color: AppColors.appBarText,
            ),
          ),
        ],
      ),
    );
  }
}
