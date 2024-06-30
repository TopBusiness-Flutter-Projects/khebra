// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/preferences/preferences.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/dialogs.dart';
import 'package:khebra/core/utils/restart_app_class.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_text.dart';
import 'package:khebra/core/widgets/custom_text_form_field.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/login/cubit/login_states.dart';
import 'package:khebra/features/menu/cubit/menu_cubit.dart';
import 'package:khebra/features/menu/cubit/menu_states.dart';
import 'package:khebra/features/menu/screens/widgets/custom_header_widget.dart';
import 'package:khebra/features/menu/screens/widgets/custom_settings_widget.dart';
import '../../../core/widgets/custom_button.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MenuCubit, MenuStates>(builder: (context, state) {
        MenuCubit cubit = context.read<MenuCubit>();

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(18.h),
                            child: Text(
                              "menu".tr(),
                              style: getBoldStyle(fontSize: 20.sp),
                            ),
                          ),
                          CustomHeaderWidget(text: "myInformation"),
                          CustomSettingsRow(
                            text: "myProfile",
                            icon: AppIcons.profileIcon,
                          ),
                          CustomSettingsRow(
                            text: "addProject",
                            icon: AppIcons.addProjectIcon,
                          ),
                          CustomSettingsRow(
                            text: "subscribe",
                            icon: AppIcons.subscribeAppIcon,
                          ),
                          CustomSettingsRow(
                            text: "orderAService",
                            icon: AppIcons.whatsAppIcon,
                          ),
                          CustomSettingsRow(
                            text: "favourites",
                            icon: AppIcons.favouriteIcon,
                          ),
                          CustomHeaderWidget(text: "settings"),
                          CustomSettingsRow(
                            text: "darkMode",
                            icon: AppIcons.themeIcon,
                            isTheme: true,
                          ),
                          CustomSettingsRow(
                            text: "notificationsSound",
                            icon: AppIcons.notificationIcon,
                            isNotification: true,
                          ),
                          CustomSettingsRow(
                            text: "language",
                            isLanguage: true,
                            icon: AppIcons.languageIcon,
                            onTap: () {

                              if (EasyLocalization.of(context)!
                                              .locale
                                              .languageCode ==
                                          'ar') {
                                        EasyLocalization.of(context)!
                                            .setLocale(Locale('en', ''));
                                        Preferences.instance
                                            .savedLang(AppStrings.englishCode);
                                        Preferences.instance.getSavedLang();
                                        HotRestartController.performHotRestart(
                                            context);
                                      } else {
                                        EasyLocalization.of(context)!
                                            .setLocale(Locale('ar', ''));
                                        Preferences.instance
                                            .savedLang(AppStrings.arabicCode);
                                        Preferences.instance.getSavedLang();
                                        HotRestartController.performHotRestart(
                                            context);
                                      }
                            },
                          ),
                          CustomSettingsRow(
                            text: "contactUs",
                            icon: AppIcons.callUsIcon,
                          ),
                          CustomSettingsRow(
                            text: "aboutApp",
                            icon: AppIcons.aboutAppIcon,
                          ),
                          CustomSettingsRow(
                            text: "policy",
                            icon: AppIcons.policyIcon,
                          ),
                          CustomSettingsRow(
                            text: "shareApp",
                            icon: AppIcons.shareIcon,
                          ),
                          CustomSettingsRow(
                            text: "rateApp",
                            icon: AppIcons.rateAppIcon,
                          ),
                          CustomSettingsRow(
                            text: "logOut",
                            icon: AppIcons.logoutIcon,
                          ),
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
