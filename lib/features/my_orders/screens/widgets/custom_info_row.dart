import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';

class CustomInfoRow extends StatelessWidget {
  const CustomInfoRow({
    super.key,
    required this.path,
    required this.text,
  });
  final String path;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(
        path,
        width: 22.w,
        height: 22.w,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Text(
          text,
          style: getRegularStyle(
            color: AppColors.secondTextColor,
          ),
        ),
      )
    ]);
  }
}

class TotalRow extends StatelessWidget {
  const TotalRow({
    super.key,
    required this.path,
    required this.text,
  });

  final String path;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(
        path,
        width: 22.w,
        height: 22.w,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: RichText(
          maxLines: 2,
          text: TextSpan(
            children: [
              TextSpan(
                  text: "total".tr() + ":",
                  style: getRegularStyle(
                    color: AppColors.secondTextColor,
                  )),
              TextSpan(
                  text: text,
                  style: getBoldStyle(
                    color: AppColors.secondTextColor,
                  )),
              TextSpan(
                  text: ' ',
                  style: getBoldStyle(
                    fontSize: 15.sp,
                  )),
              TextSpan(
                  text: "currency".tr() + "\n",
                  style: getRegularStyle(
                    color: AppColors.secondTextColor,
                  )),
            ],
          ),
        ),
      )
    ]);
  }
}

class OrderStatusRow extends StatelessWidget {
  const OrderStatusRow({
    super.key,
    required this.isCurrent,
  });

  final bool isCurrent;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          color: isCurrent ? AppColors.orderWaiting : AppColors.orderDone),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                isCurrent ? AppIcons.waiting : AppIcons.orderDone,
                width: 22.w,
                height: 22.w,
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  isCurrent
                      ? "waitingTechniciansAccept".tr()
                      : "techniciansArrive".tr(),
                  style: getRegularStyle(
                    color: AppColors.secondTextColor,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
