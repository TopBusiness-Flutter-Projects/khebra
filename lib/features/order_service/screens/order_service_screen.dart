// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/cupertino.dart';
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
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/login/cubit/login_states.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/order_service/cubit/orders_service_states.dart';
import 'package:khebra/features/order_service/screens/widgets/custom_service_types_menu.dart';
import '../../../core/widgets/custom_button.dart';
import 'widgets/custom_categires_menu.dart';
import 'widgets/custom_date_widget.dart';
import 'widgets/custom_experiences_menu .dart';
import 'widgets/custom_time_section.dart';
import 'widgets/document_container.dart';

class OrderServiceScreen extends StatefulWidget {
  const OrderServiceScreen({Key? key}) : super(key: key);

  @override
  State<OrderServiceScreen> createState() => _OrderServiceScreenState();
}

class _OrderServiceScreenState extends State<OrderServiceScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<OrderServiceCubit>().uploadedImage.clear();
    context.read<OrderServiceCubit>().selectedDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(DateTime.now().toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OrderServiceCubit, OrderServiceStates>(
          builder: (context, state) {
        OrderServiceCubit cubit = context.read<OrderServiceCubit>();

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(18.h),
                  child: Text(
                    "addService".tr(),
                    style: getBoldStyle(fontSize: 20.sp),
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
                            DocumentsContainer(),
                            SizedBox(
                              height: 15.h,
                            ),
                            CustomText(
                              text: "category",
                            ),
                            CustomCategoriesMenu(),
                            CustomText(
                              text: "serviceType",
                            ),
                            CustomServiceTypesMenu(),
                            CustomText(
                              text: "selectExperience",
                            ),
                            CustomExperiencesMenu(),
                            CustomText(
                              text: "selectDate",
                            ),
                            CustomDateWidget(),
                            CustomText(
                              text: "selectTime",
                            ),
                            CustomTimeSection(),
                            CustomTotalWidget()
                          ]),
                    ),
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

class CustomTotalWidget extends StatelessWidget {
  const CustomTotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 2,
              offset: Offset(0, 5), // Shadow position
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "total".tr() + ": ",
                          style: getBoldStyle(
                            color: AppColors.secondTextColor,
                          )),
                      TextSpan(
                          text: "600",
                          style: getBoldStyle(
                            color: AppColors.secondTextColor,
                          )),
                      TextSpan(
                          text: ' ',
                          style: getBoldStyle(
                            fontSize: 15.sp,
                          )),
                      TextSpan(
                          text: "currency".tr(),
                          style: getRegularStyle(
                            color: AppColors.secondTextColor,
                          )),
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.all(
                          3.w,
                        ),
                        child: Icon(
                          Icons.add,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text("3",
                      style: getBoldStyle(
                          color: AppColors.primary, fontHeight: 1.3)),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.all(
                          3.w,
                        ),
                        child: Icon(
                          Icons.remove,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
