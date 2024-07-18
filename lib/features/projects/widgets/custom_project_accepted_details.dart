import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/features/projects/widgets/customButton.dart';

import '../../../core/utils/app_export.dart';

class CustomAcceptedProjectDetails extends StatelessWidget {
  const CustomAcceptedProjectDetails({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
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
                child: Text(
                  " ay ay ",
                  style: getBoldStyle(
                      fontSize: 13.sp, color: AppColors.secondTextColor),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                ' 11/3/2024',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment:
                      //     MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "priceOffer".tr(),
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                color: AppColors.secondPrimary,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' 500',
                              style: TextStyle(
                                fontSize: 16.0.sp,
                                color: AppColors.secondPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                "currency".tr(),
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  color: AppColors.secondPrimary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            "priceDetails".tr(),
            style: TextStyle(
                fontSize: 16.0,
                color: AppColors.primary,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع وصف المشروع',
              style: TextStyle(
                fontSize: 14.0,
                color: AppColors.secondPrimary,
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                  child: CustomButtonProjects(
                      text: "projectContract",
                      color: AppColors.redButton,
                      onPressed: onPressed)),
              Flexible(
                  child: CustomButtonProjects(
                      text: "timetable",
                      color: AppColors.secondPrimary,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.stepperPage);
                      })),
            ],
          )
        ],
      ),
    );
  }
}
