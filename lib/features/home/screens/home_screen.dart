// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/utils/app_const.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/dialogs.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_text.dart';
import 'package:khebra/core/widgets/custom_text_form_field.dart';
import 'package:khebra/core/widgets/network_image.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_home_text.dart';
import 'package:khebra/features/home/screens/widgets/custom_services_section.dart';
import 'package:khebra/features/home/screens/widgets/custom_slider.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/login/cubit/login_states.dart';
import '../../../core/widgets/custom_button.dart';
import 'widgets/custom_category_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
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
                          Text(
                            "اهلا, ay ay ",
                            style: getBoldStyle(
                                fontSize: 13.sp,
                                color: AppColors.secondTextColor),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppImages.location,
                                height: 20.w,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Expanded(
                                child: Text(
                                  "Shebin",
                                  style: getRegularStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.secondTextColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                      AppImages.notification,
                      height: 30.w,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: CustomTextField(
                              labelText: 'searchService'.tr(),
                              borderRadius: 20,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  AppImages.search,
                                  fit: BoxFit.fill,
                                  width: 8.w,
                                  height: 8.w,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              controller: searchController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomSlider(
                            items: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomNetworkImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: AppStrings.sliderTestImage,
                                    width: double.maxFinite),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomNetworkImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: AppStrings.sliderTestImage,
                                    width: double.maxFinite),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomNetworkImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: AppStrings.sliderTestImage,
                                    width: double.maxFinite),
                              ),
                            ],
                            // items: cubit
                            //     .homeModel.data!.sliders!
                            //     .map((e) => GestureDetector(
                            //           onTap: () async {
                            //             final _url =
                            //                 Uri.parse(
                            //                     e.url!);
                            //             await launchUrl(
                            //                 _url,
                            //                 mode: LaunchMode
                            //                     .externalApplication);
                            //           },
                            //           child:
                            //               CustomNetworkImage(
                            //                   boxFit: BoxFit
                            //                       .fill,
                            //                   imageUrl:
                            //                       e.image!,
                            //                   errorWidget:
                            //                       Image
                            //                           .asset(
                            //                     AppImages
                            //                         .logoImage,
                            //                     fit: BoxFit
                            //                         .contain,
                            //                   ),
                            //                   width: double
                            //                       .maxFinite),
                            //         ))
                            //     .toList(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomHomeText(
                                  text: "categories",
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "all".tr(),
                                    style: getRegularStyle(
                                        color: AppColors.primary,
                                        fontSize: 18.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: CategoriesSection(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomHomeText(
                                  text: "services",
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "all".tr(),
                                    style: getRegularStyle(
                                        color: AppColors.primary,
                                        fontSize: 18.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: ServiciesSection(),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
