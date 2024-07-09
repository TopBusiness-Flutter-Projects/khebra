// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';

import 'package:khebra/features/profile/cubit/profile_cubit.dart';
import 'package:khebra/features/profile/cubit/profile_states.dart';

import '../../../core/utils/app_export.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool isHidden = true;
  bool isHiddenConfirm = true;
  @override
  void initState() {
    context.read<ProfileCubit>().profileFile = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<ProfileCubit, ProfileStates>(builder: (context, state) {
        ProfileCubit cubit = context.read<ProfileCubit>();
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                CustomAppBar(
                  title: "editProfile",
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
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: cubit.profileFile == null
                                        ? CustomNetworkImage(
                                            imageUrl:
                                                " AppStrings.testNetworkImage",
                                            height: 100.w,
                                            width: 100.w,
                                          )
                                        : Image.file(
                                            cubit.profileFile!,
                                            fit: BoxFit.cover,
                                            height: 100.w,
                                            width: 100.w,
                                          ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cubit.showImageSourceDialog(context);
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: AppColors.primary,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: AppColors.secondPrimary,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomText(text: "name"),
                            CustomTextField(
                              labelText: 'enterName'.tr(),
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            CustomText(text: "phone"),
                            CustomTextField(
                              labelText: 'enterPhone'.tr(),
                              keyboardType: TextInputType.phone,
                              controller: phoneNumberController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            // CustomText(text: "address"),
                            // CustomTextField(
                            //   labelText: 'enterAddress'.tr(),
                            //   keyboardType: TextInputType.text,
                            //   controller: addressController,
                            //   validator: (value) => value!.isEmpty ? '' : null,
                            // ),
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
                              height: 35.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                text: "update".tr(),
                                onPressed: () {
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
              ],
            ),
          ),
        );
      }),
    );
  }
}


