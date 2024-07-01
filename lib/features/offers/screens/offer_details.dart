// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/core/widgets/custom_button.dart';
import 'package:khebra/core/widgets/network_image.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_slider.dart';
import 'package:khebra/features/offers/cubit/offers_cubit.dart';
import 'package:khebra/features/offers/cubit/offers_states.dart';

class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OffersCubit, OffersStates>(builder: (context, state) {
        OffersCubit cubit = context.read<OffersCubit>();
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: "offerDetails"),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomNetworkImage(
                            imageUrl: AppStrings.sliderTestImage,
                            height: 100.h,
                            width: double.maxFinite,
                            // width: 120.h,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("تنظيف منزل",
                                        style: getBoldStyle(
                                          color: AppColors.textColor2,
                                        )),
                                    Text("تنظيف منزل",
                                        style: getRegularStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.primary,
                                        ))
                                  ],
                                ),
                              ),
                              RichText(
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
                                        text: "currency".tr(),
                                        style: getRegularStyle(
                                            fontSize: 15.sp,
                                            color: AppColors.primary)),
                                    TextSpan(
                                        text: '  ',
                                        style: getBoldStyle(
                                            fontSize: 15.sp,
                                            color: AppColors.primary)),
                                    TextSpan(
                                      text: "200",
                                      style: getLineOverStyle(),
                                    ),
                                    TextSpan(
                                        text: ' ', style: getLineOverStyle()),
                                    TextSpan(
                                        text: "currency".tr(),
                                        style: getLineOverStyle(isBold: false)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text("offerDiscrebtions".tr(),
                              style: getBoldStyle(
                                color: AppColors.textColor2,
                              )),
                          Text(
                              "عرض خاص لتنظيف المنزل خصم 20% عل خدمة تنظيف المنازل بمناسبة العيد ",
                              style: getRegularStyle(
                                fontSize: 14.sp,
                                color: AppColors.grey,
                              )),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              color: AppColors.secondPrimary,
                              border:
                                  Border.all(color: AppColors.secondPrimary),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "orderNow".tr(),
                                textAlign: TextAlign.center,
                                style: getRegularStyle(
                                    color: AppColors.white, fontSize: 18.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Text("otherOffers".tr(),
                              style: getBoldStyle(
                                color: AppColors.textColor2,
                              )),
                          SizedBox(
                            height: 15.h,
                          ),
                          SizedBox(
                            height: 120.h,
                            child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    CustomNetworkImage(
                                      boxFit: BoxFit.fill,
                                      imageUrl: AppStrings.sliderTestImage,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      // height: 30,
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 8.w,
                                    ),
                                itemCount: 3),
                          )
                        ]),
                  ),
                ),
                // Image.asset(
                //   width: double.infinity,
                //   AppImages.login,
                // )
              ],
            ),
          ),
        );
      }),
    );
  }
}
