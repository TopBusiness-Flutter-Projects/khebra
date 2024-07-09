// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:khebra/features/my_orders/screens/widgets/custom_info_row.dart';

import 'custom_button.dart';
import 'custom_hint_text.dart';
import 'custom_title_container.dart';

class CustomOrderDetailsContainer extends StatelessWidget {
  const CustomOrderDetailsContainer({
    super.key,
    required this.withPrice,
    this.isWithOffer = false,
    this.orderStatus = OrderStatus.completed,

    // required this.orderModel,
  });

  final bool withPrice;
  final bool isWithOffer;
  final OrderStatus orderStatus;

  //final TheOrder orderModel;

  @override
  Widget build(BuildContext context) {
    MyOrdersCubit cubit = context.read<MyOrdersCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                color: AppColors.orderDetails),
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
                              Flexible(
                                child: CustomInfoRow(
                                    path: AppIcons.orderDate,
                                    text: "30/2/2011"),
                              ),
                              SizedBox(
                                width: 18.w,
                              ),
                              Flexible(
                                child: CustomInfoRow(
                                    path: AppIcons.orderTime, text: "30:05 pm"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          withPrice
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: TotalRow(
                                          path: AppIcons.orderTotal,
                                          text: "600"),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: 1.h,
                                ),
                          if (isWithOffer) ...[
                            CustomDashedLine(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: CustomDetailsInfo(
                                    title: "category".tr(),
                                    body: "gdshag",
                                  ),
                                ),
                                Flexible(
                                  child: CustomDetailsInfo(
                                    title: "serviceType".tr(),
                                    body: "gdshadddg",
                                  ),
                                ),
                                Flexible(
                                  child: CustomDetailsInfo(
                                    title: "techniciansExperience".tr(),
                                    body: "gdshadddg",
                                  ),
                                ),
                              ],
                            ),
                            if (orderStatus != OrderStatus.completed)
                              Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "waitingInspection".tr(),
                                          style: getRegularStyle(
                                            color: AppColors.secondTextColor,
                                          ),
                                        ),
                                      )
                                    ]),
                              )
                          ]
                        ],
                      )
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          if (!isWithOffer)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  color: AppColors.orderDetails),
              child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: CustomDetailsInfo(
                              title: "category".tr(),
                              body: "gdshag",
                            ),
                          ),
                          Flexible(
                            child: CustomDetailsInfo(
                              title: "serviceType".tr(),
                              body: "gdshadddg",
                            ),
                          ),
                        ],
                      ),
                      CustomDashedLine(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: CustomDetailsInfo(
                              title: "techniciansExperience".tr(),
                              body: "gdshag",
                            ),
                          ),
                          Flexible(
                            child: CustomDetailsInfo(
                              title: "qty".tr(),
                              body: "gdshadddg",
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          SizedBox(
            height: 20.h,
          ),
          if (orderStatus == OrderStatus.accepted && !isWithOffer)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  color: AppColors.orderCompleted),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "orderIsAccepted".tr(),
                          style: getRegularStyle(
                            color: AppColors.secondTextColor,
                          ),
                        ),
                      )
                    ]),
              ),
            )
          else if (orderStatus == OrderStatus.preparing && !isWithOffer)
            DeleteAndEditOrderRow()
          else if (orderStatus == OrderStatus.completed && !isWithOffer)
            SizedBox(
              height: 1,
            )
          else if (orderStatus != OrderStatus.completed && isWithOffer)
            DeleteAndEditOrderRow()
        ],
      ),
    );
  }
}

class DeleteAndEditOrderRow extends StatelessWidget {
  const DeleteAndEditOrderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: CustomOrderButton(
              text: "deleteOrder",
              onTap: () {},
              buttonColor: AppColors.redButton,
              textColor: AppColors.white),
        ),
        SizedBox(
          width: 10.w,
        ),
        Flexible(
          child: CustomOrderButton(
              text: "editOrder",
              onTap: () {},
              buttonColor: AppColors.secondPrimary,
              textColor: AppColors.white),
        ),
      ],
    );
  }
}

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: List.generate(
            80,
            (index) => Expanded(
                  child: Container(
                    color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                    height: 2,
                  ),
                )),
      ),
    );
  }
}

class CustomDetailsInfo extends StatelessWidget {
  const CustomDetailsInfo({
    super.key,
    required this.title,
    required this.body,
  });
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: getRegularStyle(color: AppColors.primary, fontSize: 14.sp),
        ),
        Text(
          body,
          style: getRegularStyle(color: AppColors.black, fontSize: 14.sp),
        ),
      ],
    );
  }
}
