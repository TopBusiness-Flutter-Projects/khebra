// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/dialogs.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_text.dart';
import 'package:khebra/core/widgets/custom_text_form_field.dart';
import 'package:khebra/core/widgets/top_business_logo.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/login/cubit/login_states.dart';

import '../../../core/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHidden = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<LoginCubit, LoginStates>(builder: (context, state) {
        LoginCubit cubit = context.read<LoginCubit>();

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(18.h),
                              child: Text(
                                "logIn".tr(),
                                style: getBoldStyle(fontSize: 20.sp),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomText(text: "phone"),
                            CustomTextField(
                              labelText: 'enterPhone'.tr(),
                              keyboardType: TextInputType.phone,
                              controller: phoneNumberController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: "password"),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          Routes.forgetPasswordScreenRoute);
                                    },
                                    child: Text(
                                      "forgetPassword".tr(),
                                      style: getRegularStyle(
                                          color: AppColors.grey2,
                                          fontSize: 14.sp),
                                    ))
                              ],
                            ),
                            CustomTextField(
                              isPassword: isHidden,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      print(isHidden);
                                      isHidden = !isHidden;
                                    });
                                  },
                                  icon: Icon(
                                    !isHidden
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.grey,
                                    size: 20.h,
                                  )),
                              labelText: 'enterPassword'.tr(),
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                text: "logIn".tr(),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Routes.mainRoute, (route) => false);
                                  if (formKey.currentState!.validate()) {
                                  
                                  } else {
                                    errorGetBar("من فضلك املأ الحقول");
                                    print('Form is Not valid');
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "doNotHaveAccount".tr(),
                                  style:
                                      getRegularStyle(color: AppColors.black),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.registerRoute);
                                    },
                                    child: Text(
                                      "createAccount".tr(),
                                      style: getRegularStyle(
                                          color: AppColors.primary),
                                    ))
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
                Image.asset(
                  width: double.infinity,
                  AppImages.login,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
