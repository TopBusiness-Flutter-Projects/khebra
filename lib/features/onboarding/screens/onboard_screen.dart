// ignore_for_file: use_super_parameters

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';

import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:khebra/core/widgets/top_business_logo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/preferences/preferences.dart';
import 'widgets/custom_onboard_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  bool isLast = false;
  List<Widget> pages = [
    const CustomOnboardItem(
        image: AppImages.onboarding1,
        title: "onBoarding1title",
        body: 'onBoarding1body'),
    const CustomOnboardItem(
        image: AppImages.onboarding2,
        title: 'onBoarding2title',
        body: 'onBoarding2body'),
    const CustomOnboardItem(
        image: AppImages.onboarding3,
        title: 'onBoarding3title',
        body: 'onBoarding3body'),
  ];
  void submit() {
    Preferences.instance
        .setIsFirstTime(key: 'onBoarding', value: true)
        .then((value) {
      print('first timee');
      //  Navigator.pushNamed(context, Routes.welcomeScreen);
    }).catchError((error) {
      print('error${error.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => pages[index],
                      itemCount: pages.length,
                      onPageChanged: (int index) {
                        if (index == pages.length - 1) {
                          setState(() {
                            isLast = true;
                            print('isLast');
                          });
                        } else {
                          setState(() {
                            isLast = false;
                            print('notLas');
                          });
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: SmoothPageIndicator(
                        controller: pageController,
                        // PageController
                        count: pages.length,
                        effect: JumpingDotEffect(
                            activeDotColor: AppColors.secondPrimary,
                            dotColor: AppColors.dotsColor,
                            dotHeight: 10,
                            dotWidth: 10),
                        // your preferred effect
                        onDotClicked: (index) {}),
                  ),
                ],
              ),
            ),
            isLast
                ? Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: "startNow".tr(),
                        onPressed: () {
                          submit();
                        },
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: const EdgeInsets.all(7.2),
                        child: Text(
                          " ",
                          style: getMediumStyle(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: "next".tr(),
                        onPressed: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);

                          // submit();
                        },
                      ),
                      SizedBox(height: 5.h),
                      TextButton(
                          onPressed: () {
                            submit();

                            // if (isLast) {
                            //   submit();
                            // } else {
                            //   pageController.nextPage(
                            //       duration: const Duration(milliseconds: 750),
                            //       curve: Curves.fastLinearToSlowEaseIn);
                            // }
                          },
                          child: Text(
                            "skip".tr(),
                            style: getMediumStyle(),
                          )),
                    ],
                  ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10.h,
                ),
                child: TopBusinessLogo(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
