// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/features/my_orders/screens/widgets/custom_info_row.dart';

import '../../../../core/utils/app_export.dart';
import '../../cubit/profile_cubit.dart';

class CustomBillContainer extends StatelessWidget {
  const CustomBillContainer({
    super.key,
    required this.isCurrent,
    // required this.orderModel,
  });

  final bool isCurrent;
  //final TheOrder orderModel;

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = context.read<ProfileCubit>();
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
                                text: "billNumber".tr()),
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
                                path: AppIcons.orderDate, text: "30/2/2011"),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TotalRow(
                                path: AppIcons.orderTotal, text: "600"),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppIcons.billShare,
                                width: 30.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Image.asset(
                                AppIcons.billPrint,
                                width: 30.w,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
