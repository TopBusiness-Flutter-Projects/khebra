// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/dialogs.dart';
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
                            text: "profile",
                            icon: AppIcons.profileIcon,
                          ),
                          CustomSettingsRow(
                            text: "profile",
                            icon: AppIcons.profileIcon,
                          ),
                          CustomSettingsRow(
                            text: "profile",
                            icon: AppIcons.profileIcon,
                          ),
                          CustomSettingsRow(
                            text: "profile",
                            icon: AppIcons.profileIcon,
                          ),
                          CustomHeaderWidget(text: "settings"),
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
