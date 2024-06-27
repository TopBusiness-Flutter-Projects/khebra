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

class CustomTechniciansContainer extends StatelessWidget {
  const CustomTechniciansContainer({
    super.key,
    required this.mainText,
    this.containerOnTap, this.inHome =true,
  });

  final void Function()? containerOnTap;
  final bool inHome;
  final String mainText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: containerOnTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Stack(
          children: [
            Container(
               width:inHome? 120.h :null,
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
                mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(1000)),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: CustomNetworkImage(
                        imageUrl: AppStrings.sliderTestImage,
                        height: 50.h,
                        width: 50.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    child: Text(
                      "mohamedmohamedmohamed" "\n",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(
                          fontHeight: 1,
                          color: AppColors.secondPrimary,
                          fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    child: Text(
                      "mohamedmohamedmohamedmohamed" "\n",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(
                          fontHeight: 1,
                          color: AppColors.primary,
                          fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 23.h,
                        ),
                        Text(
                          "5",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getRegularStyle(
                              fontHeight: 1,
                              color: AppColors.secondTextColor,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 4.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 23.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
