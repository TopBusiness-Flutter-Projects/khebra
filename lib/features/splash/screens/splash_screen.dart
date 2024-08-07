// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/config/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/top_business_logo.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
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
        String userName = '';
        String userPass = '';

        Preferences.instance.getIsFirstTime(key: 'onBoarding').then((value) {
          if (value != null && value == true) {
            Preferences.instance.getUserName().then((value) async {
              if (value != null) {
                userName = value;

                Preferences.instance.getUserPass().then((value) async {
                  if (value != null) {
                    userPass = value;

                      String session = await context
                    .read<LoginCubit>()
                    .setSessionId(phoneOrMail: userName, password: userPass);
                if (session != "error") {
                  Navigator.pushReplacementNamed(context, Routes.mainRoute);
                } else {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                }
                  }
                }).catchError((error) {
                  debugPrint("ffffffffff" + error.toString());
                });

              
              } else {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              }
            }).catchError((error) {
              debugPrint("ffffffffff" + error.toString());
            });

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
