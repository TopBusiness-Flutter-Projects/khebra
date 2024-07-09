// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/features/menu/cubit/menu_cubit.dart';
import 'package:khebra/features/menu/cubit/menu_states.dart';

import '../../../../core/utils/app_export.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
          body: Column(
            children: [
              CustomAppBar(
                title: "contactUs",
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(13.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 30.h),
                          Image.asset(
                            AppImages.contactUs,
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                          SizedBox(height: 50.h),
                          CustomRow(
                            text: "callUs",
                            path: AppIcons.callContactUs,
                          ),
                          SizedBox(height: 10.h),
                          CustomRow(
                            text: "leaveYourMessage",
                            path: AppIcons.messageContactUs,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.addMessageRoute);
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

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    this.onTap,
    required this.text,
    required this.path,
  });
  final void Function()? onTap;
  final String text;
  final String path;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            border: Border.all(color: AppColors.grey4)),
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  text.tr(),
                  style: getMediumStyle(),
                ),
              ),
              Image.asset(
                path,
                width: 35.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
