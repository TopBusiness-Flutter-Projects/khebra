// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_appbar.dart';
import 'package:khebra/core/widgets/network_image.dart';
import 'package:khebra/features/home/screens/widgets/custom_slider.dart';
import 'package:khebra/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:khebra/features/my_orders/cubit/my_orders_states.dart';
import 'package:khebra/features/my_orders/screens/widgets/custom_contact_widget.dart';
import 'package:khebra/features/my_orders/screens/widgets/custom_order_details_container.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<MyOrdersCubit, MyOrdersStates>(builder: (context, state) {
        MyOrdersCubit cubit = context.read<MyOrdersCubit>();

        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: "orderDetails"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  blurRadius: 5,
                                  offset: Offset(0, 2), // Shadow position
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: CustomNetworkImage(
                                      imageUrl: AppStrings.testNetworkImage,
                                      height: 50.w,
                                      width: 50.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "mohamed",
                                      style:
                                          getBoldStyle(color: AppColors.grey2),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  CustomContactWidget(
                                    phone: "+201027639683",
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: CustomSlider(
                            items: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomNetworkImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: AppStrings.sliderTestImage,
                                    width: double.maxFinite),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomNetworkImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: AppStrings.sliderTestImage,
                                    width: double.maxFinite),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomNetworkImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: AppStrings.sliderTestImage,
                                    width: double.maxFinite),
                              ),
                            ],
                          ),
                        ),
                        CustomOrderDetailsContainer(
                          withPrice: true,
                        
                        ),
                      ]),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
