// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/core/widgets/network_image.dart';
import 'package:khebra/features/menu/screens/widgets/custom_settings_widget.dart';
import 'package:khebra/features/my_orders/screens/widgets/custom_button.dart';
import 'package:khebra/features/profile/cubit/profile_cubit.dart';
import 'package:khebra/features/profile/cubit/profile_states.dart';

import '../../../core/utils/app_export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<ProfileCubit, ProfileStates>(builder: (context, state) {
        ProfileCubit cubit = context.read<ProfileCubit>();
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 220.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 160.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: AppColors.secondPrimary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomWhiteAppBar(
                            title: "myProfile",
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Center(
                        child: Container(
                          height: 150.h,
                          width: MediaQuery.of(context).size.width * .8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                blurRadius: 5,
                                offset: Offset(0, 2), // Shadow position
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: CustomNetworkImage(
                                  imageUrl: AppStrings.testNetworkImage,
                                  height: 80.w,
                                  width: 80.w,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "AYAA",
                                maxLines: 1,
                                style: getBoldStyle(
                                    color: AppColors.settingFont,
                                    fontSize: 18.sp),
                              ),
                              Text(
                                "01024585455",
                                maxLines: 1,
                                style: getRegularStyle(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSettingsRow(
                            text: "myProjects",
                            icon: AppIcons.myProjects,
                          ),
                          CustomSettingsRow(
                            text: "myOrders",
                            icon: AppIcons.myOrders,
                            onTap: () {
                              Navigator.pushNamed(context, Routes.myOrdersRoute,
                                  arguments: true);
                            },
                          ),
                          CustomSettingsRow(
                            text: "myBills",
                            icon: AppIcons.myBills,
                            onTap: () {
                              Navigator.pushNamed(context, Routes.myBillsRoute);
                            },
                          ),
                          CustomSettingsRow(
                            text: "editProfile",
                            icon: AppIcons.editProfile,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.updateProfileRoute);
                            },
                          ),
                          CustomSettingsRow(
                            text: "deleteProfile",
                            icon: AppIcons.deleteProfile,
                            onTap: () {
                              showDeleteAccountDialog(context);
                              //  Navigator.pushNamed(
                              //      context, Routes.favoriteRoute);
                            },
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

void showDeleteAccountDialog(
  BuildContext context,
) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.symmetric(horizontal: 4.w),
        title: Padding(
          padding: EdgeInsets.all(15.w),
          child: Text(
            'areYouSure'.tr(),
            textAlign: TextAlign.center,
            style: getMediumStyle(),
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              Flexible(
                child: CustomOrderButton(
                  text: "confirm",
                  onTap: () {},
                  radius: 18,
                  buttonColor: AppColors.green,
                  textColor: AppColors.white,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Flexible(
                child: CustomOrderButton(
                  text: "cancel",
                  onTap: () {
                    Navigator.pop(context);
                  },
                  radius: 18,
                  buttonColor: AppColors.redButton,
                  textColor: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
