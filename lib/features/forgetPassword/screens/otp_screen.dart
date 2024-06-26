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
import 'package:khebra/features/forgetPassword/cubit/forget_password_cubit.dart';
import 'package:khebra/features/forgetPassword/cubit/forget_password_states.dart';
import 'package:khebra/features/forgetPassword/screens/widgets/PinOTP.dart';

import 'package:khebra/features/register/cubit/register_cubit.dart';
import 'package:khebra/features/register/cubit/register_states.dart';

import '../../../core/widgets/custom_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
          builder: (context, state) {
        ForgetPasswordCubit cubit = context.read<ForgetPasswordCubit>();
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 18.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 20.h,
                          )),
                      Text(
                        "enterCode".tr(),
                        style: getBoldStyle(fontSize: 20.sp),
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
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "theCodeWasSent".tr(),
                              style: getRegularStyle(
                                  fontSize: 14.sp, color: AppColors.grey),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            PinOTP(
                              textEditingController: otpController,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                text: "next".tr(),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.newPasswordScreenRoute);
                                  if (formKey.currentState!.validate()) {
                                    //  cubit.addMember(
                                    //    context: context,
                                    //    name: nameController.text,
                                    //    nationalId: idNumberController.text,
                                    //    cardDate: idDateController.text,
                                    //    address: residenceController.text,
                                    //    phone: phoneNumberController.text,
                                    //    qualification: educationController.text,
                                    //    job: jobController.text,
                                    //    workPlace: workAddressController.text,
                                    //    partisan: adjectiveController.text,
                                    //    placeAbroad: outAddressController.text,
                                    //    passport: passportController.text,
                                    //  );
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
                          ]),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      width: MediaQuery.of(context).size.width / 2,
                      AppImages.code,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
