// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/config/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/top_business_logo.dart';
import '../../../core/preferences/preferences.dart';
import '../widgets/custom_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  void navigateToHome() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Preferences.instance.getIsFirstTime(key: 'onBoarding').then((value) {
          if (value != null && value == true) {
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
            // Navigator.pushReplacementNamed(context, Routes.homeRoute);
            // Preferences.instance.getUserToken().then((value) {
            //   if (value != null) {
            //     Navigator.pushNamedAndRemoveUntil(
            //         context, Routes.homeRoute, (route) => false);
            //     //    context.read<HomeCubit>().getUser();
            //   } else {
            //     //  Navigator.pushNamedAndRemoveUntil(
            //     //      context, Routes.loginRoute, (route) => false);
            //   }
            // });
            print('not first time');
          } else {
            Navigator.pushReplacementNamed(context, Routes.onBoarding);
            print('first time');
          }
        }).catchError((error) {
          print(error.toString());
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(
              height: 1,
            ),
            CustomAppLogo(),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0, right: 20, left: 20),
                child: TopBusinessLogo(),
              ),
            )
          ]),
    );
  }
}
