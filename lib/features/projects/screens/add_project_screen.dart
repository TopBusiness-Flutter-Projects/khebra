// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';

import 'package:khebra/core/widgets/custom_appbar.dart';
import 'package:khebra/features/projects/cubit/projects_states.dart';

import '../../../core/utils/app_export.dart';
import '../cubit/projects_cubit.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({Key? key}) : super(key: key);

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProjectsCubit, ProjectsStates>(builder: (context, state) {
        ProjectsCubit cubit = context.read<ProjectsCubit>();
         
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                CustomAppBar(
                  title: "addProject",
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
                                AppImages.addProject,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomText(text: "projectName"),
                            CustomTextField(
                              labelText: 'enterName'.tr(),
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                            CustomText(text: "projectDescription"),
                            CustomTextField(
                              labelText: 'enterYourDescription'.tr(),
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
                                  Navigator.pushNamed(
                                      context, Routes.projectScreen);
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
                            // SizedBox(
                            //   height: 35.h,
                            // ),
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
