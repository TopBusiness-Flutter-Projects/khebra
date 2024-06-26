import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/widgets/network_image.dart';

import '../../../../core/utils/custom_svg_icon.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../../../core/utils/styles/app_fonts.dart';
import '../../../../core/widgets/custom_svg.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.mainText,
    this.containerOnTap,
    
  });

  final void Function()? containerOnTap;

  final String mainText;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: containerOnTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 5,
              offset: Offset(0, 2), // Shadow position
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               CustomNetworkImage(
                imageUrl: AppStrings.testNetworkImage,
                height: 50.h,
                width: 50.h,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                mainText,
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    fontHeight: 1,
                    color: AppColors.secondPrimary,
                    fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
