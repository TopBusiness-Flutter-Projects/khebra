// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/dialogs.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_text.dart';
import 'package:khebra/core/widgets/custom_text_form_field.dart';
import 'package:khebra/core/widgets/top_business_logo.dart';
import 'package:khebra/features/register/cubit/register_cubit.dart';
import 'package:khebra/features/register/cubit/register_states.dart';

import '../../../core/widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isHidden = true;
  bool isHiddenConfirm = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<RegisterCubit, RegisterStates>(builder: (context, state) {
        RegisterCubit cubit = context.read<RegisterCubit>();
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
                        "createAccount".tr(),
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
                            Center(
                              child: Image.asset(
                                width: MediaQuery.of(context).size.width / 3,
                                AppImages.logo2Image,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomText(text: "name"),
                            CustomTextField(
                              labelText: 'enterName'.tr(),
                              keyboardType: TextInputType.text,
                              controller: cubit.nameController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            CustomText(text: "phone"),
                            CustomTextField(
                              labelText: 'enterPhone'.tr(),
                              keyboardType: TextInputType.phone,
                              controller: cubit.phoneNumberController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            CustomText(text: "address"),
                            CustomTextField(
                              labelText: 'enterAddress'.tr(),
                              keyboardType: TextInputType.text,
                              controller: cubit.addressController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            CustomText(text: "password"),
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
                              controller: cubit.passwordController,
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
                              controller: cubit.passwordConfirmController,
                              keyboardType: TextInputType.text,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                text: "createAccount".tr(),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.register(context);
                                    //cubit.sendOTP(context);
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
