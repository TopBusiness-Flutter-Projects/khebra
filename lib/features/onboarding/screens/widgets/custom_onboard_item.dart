import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';

class CustomOnboardItem extends StatelessWidget {
  const CustomOnboardItem(
      {super.key,
      required this.image,
      required this.title,
      required this.body,
      this.isLogo = false});
  final String image;
  final String title;
  final String body;
  final bool? isLogo;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isLogo!)
          Image.asset(
            image,
            height: MediaQuery.of(context).size.width / 1.5,
          ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title.tr(),
          style: getBoldStyle(fontSize: 22.sp),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            textAlign: TextAlign.center,
            body.tr(),
            style: getBoldStyle(fontSize: 18.sp, fontHeight: 1.2),
          ),
        ),
      ],
    );
  }
}
