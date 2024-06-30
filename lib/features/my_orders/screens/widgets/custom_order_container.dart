// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:khebra/features/my_orders/screens/widgets/custom_info_row.dart';

import 'custom_button.dart';
import 'custom_hint_text.dart';
import 'custom_title_container.dart';

class CustomOrderContainer extends StatelessWidget {
  const CustomOrderContainer({
    super.key,
    required this.isCurrent,
    // required this.orderModel,
  });

  final bool isCurrent;
  //final TheOrder orderModel;

  @override
  Widget build(BuildContext context) {
    MyOrdersCubit cubit = context.read<MyOrdersCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary, width: 1),
            borderRadius: BorderRadius.circular(30),
            color: AppColors.white),
        child: Padding(
            padding: const EdgeInsets.all(18),
            child: Container(
              //width: getSize(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: CustomInfoRow(
                                path: AppIcons.orderNumber,
                                text: "orderNumber".tr()),
                          ),
                          Text(
                            "#545",
                            style: getMediumStyle(
                              color: AppColors.secondTextColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          CustomInfoRow(
                              path: AppIcons.orderDate, text: "30/2/2011"),
                          SizedBox(
                            width: 18.w,
                          ),
                          CustomInfoRow(
                              path: AppIcons.orderTime, text: "30:05 pm"),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomInfoRow(
                              path: AppIcons.orderTotal, text: "total".tr()),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  'details'.tr(),
                                  style: getBoldStyle(color: AppColors.primary),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: AppColors.primary,
                                  size: 22.w,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      isCurrent ? Text("current") : Text("done")
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
