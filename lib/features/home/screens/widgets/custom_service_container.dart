import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khebra/core/utils/app_export.dart';

class CustomServiceContainer extends StatelessWidget {
  const CustomServiceContainer({
    super.key,
    required this.mainText,
    this.containerOnTap,
    this.onTap,
    this.withPrice = true,
    this.image,
    required this.listPrice,
  });

  final void Function()? containerOnTap;
  final void Function()? onTap;
  final String mainText;
  final double listPrice;
  final bool withPrice;
  final dynamic image;
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: DecodedImage(
                  context: context,
                  base64String: image,
                  height: 100.h,
                ),
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
                        "$mainText\n",
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
                    // Expanded(
                    //   child: Text(
                    //     "سكة" "\n",
                    //     maxLines: 2,
                    //     textAlign: TextAlign.end,
                    //     style: getRegularStyle(
                    //         fontHeight: 1,
                    //         color: AppColors.primary,
                    //         fontSize: 13.sp),
                    //   ),
                    // ),
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
                                      text: listPrice.toString(),
                                      style: getBoldStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.primary)),
                                  TextSpan(
                                      text: ' ',
                                      style: getBoldStyle(
                                          fontSize: 15.sp,
                                          color: AppColors.primary)),
                                  TextSpan(
                                      text: "currency".tr() + "\n",
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
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: GestureDetector(
                          onTap: onTap,
                          child: Image.asset(
                            AppImages.bluePlus,
                            height: 20.w,
                            width: 20.w,
                          ),
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
