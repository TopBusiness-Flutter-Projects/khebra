// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/widgets/custom_appbar.dart';
import 'package:khebra/core/widgets/top_business_logo.dart';

import '../../../../core/utils/app_export.dart';
import '../../cubit/menu_cubit.dart';
import '../../cubit/menu_states.dart';

class AddMessageScreen extends StatefulWidget {
  const AddMessageScreen({Key? key}) : super(key: key);

  @override
  State<AddMessageScreen> createState() => _AddMessageScreenState();
}

class _AddMessageScreenState extends State<AddMessageScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
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
      child: BlocBuilder<MenuCubit, MenuStates>(builder: (context, state) {
        MenuCubit cubit = context.read<MenuCubit>();
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                CustomAppBar(
                  title: "leaveYourMessage",
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
                            Center(
                              child: Image.asset(
                                width: MediaQuery.of(context).size.width / 2.5,
                                AppImages.sendMessage,
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
                            CustomText(text: "subject"),
                            CustomTextField(
                              labelText: 'enterSubject'.tr(),
                              keyboardType: TextInputType.text,
                              controller: subjectController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            CustomText(text: "messageCategory"),
                            CustomTextField(
                              labelText: 'enterCategory'.tr(),
                              keyboardType: TextInputType.text,
                              controller: subjectController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            CustomText(text: "theMessage"),
                            CustomTextField(
                              labelText: 'writeYourMessage'.tr(),
                              keyboardType: TextInputType.text,
                              isMessage: true,
                              controller: subjectController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                text: "send".tr(),
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
                TopBusinessLogo()
              ],
            ),
          ),
        );
      }),
    );
  }
}
