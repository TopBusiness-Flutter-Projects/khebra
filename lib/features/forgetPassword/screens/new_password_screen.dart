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

import 'package:khebra/features/register/cubit/register_cubit.dart';
import 'package:khebra/features/register/cubit/register_states.dart';

import '../../../core/widgets/custom_button.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool isHidden = true;
  bool isHiddenConfirm = true;
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
                        "newPassword".tr(),
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
                            CustomText(text: "newPassword"),
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
                            CustomText(text: "confirmPassword"),
                            CustomTextField(
                              isPassword: isHiddenConfirm,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      print(isHiddenConfirm);
                                      isHiddenConfirm = !isHiddenConfirm;
                                    });
                                  },
                                  icon: Icon(
                                    !isHiddenConfirm
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColors.grey,
                                    size: 20.h,
                                  )),
                              labelText: 'enterPassword'.tr(),
                              controller: passwordConfirmController,
                              keyboardType: TextInputType.text,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            SizedBox(
                              height: 15.h,
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
                                text: "confirm".tr(),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Routes.loginRoute, (route) => false);
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
                TopBusinessLogo()
              ],
            ),
          ),
        );
      }),
    );
  }
}
