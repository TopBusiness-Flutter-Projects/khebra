import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/network_image.dart';

class CustomNotificationsContainer extends StatelessWidget {
  const CustomNotificationsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 5,
              offset: Offset(0, 2), // Shadow position
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: CustomNetworkImage(
                  imageUrl: AppStrings.testNetworkImage,
                  height: 50.w,
                  width: 50.w,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "تأكيد الطلب ",
                            style: getBoldStyle(
                                fontSize: 13.sp, color: AppColors.grey2),
                          ),
                        ),
                        Text(
                          "منذ أسبوع",
                          style: getBoldStyle(
                              fontSize: 13.sp, color: AppColors.grey2),
                        ),
                      ],
                    ),
                    Text(
                      "ShebinShebinShebinShebinShebinShebinShebin",
                      style: getRegularStyle(
                          fontSize: 13.sp, color: AppColors.secondTextColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
