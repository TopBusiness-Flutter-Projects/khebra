import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/widgets/network_image.dart';

import '../../../../core/utils/custom_svg_icon.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../../../core/utils/styles/app_fonts.dart';
import '../../../../core/widgets/custom_svg.dart';

class CustomServiceContainer extends StatelessWidget {
  const CustomServiceContainer({
    super.key,
    required this.mainText,
    this.containerOnTap,
    this.onTap,
    this.withPrice = false,
  });

  final void Function()? containerOnTap;
  final void Function()? onTap;

  final String mainText;
  final bool withPrice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: containerOnTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Container(
          width: 120.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 5,
                offset: Offset(0, 2), // Shadow position
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomNetworkImage(
                imageUrl: AppStrings.sliderTestImage,
                height: 100.h,
                // width: 120.h,
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.all(4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "jhfdjkshfjksbfjkfdsfbdsjfbsddsjfbjdsbfjdj" "\n",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: getBoldStyle(
                            fontHeight: 1,
                            color: AppColors.textColor2,
                            fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: Text(
                        "سكة" "\n",
                        maxLines: 2,
                        textAlign: TextAlign.end,
                        style: getRegularStyle(
                            fontHeight: 1,
                            color: AppColors.primary,
                            fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: withPrice
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "200",
                                      style: getBoldStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.primary)),
                                  TextSpan(
                                      text: ' ',
                                      style: getBoldStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.primary)),
                                  TextSpan(
                                      text: "ريال" "\n",
                                      style: getRegularStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.primary)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          GestureDetector(
                            onTap: onTap,
                            child: Image.asset(
                              AppImages.bluePlus,
                              height: 20.w,
                              width: 20.w,
                            ),
                          ),
                        ],
                      )
                    : GestureDetector(
                        onTap: onTap,
                        child: Image.asset(
                          AppImages.bluePlus,
                          height: 20.w,
                          width: 20.w,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
