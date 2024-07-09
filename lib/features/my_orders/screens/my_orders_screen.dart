// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/dialogs.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_appbar.dart';
import 'package:khebra/core/widgets/custom_drop_down_menu.dart';
import 'package:khebra/core/widgets/custom_text.dart';
import 'package:khebra/core/widgets/custom_text_form_field.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_services_type_widget.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/login/cubit/login_states.dart';
import 'package:khebra/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:khebra/features/my_orders/cubit/my_orders_states.dart';
import 'package:khebra/features/my_orders/screens/widgets/custom_filter_drop_down_menu.dart';
import '../../../core/widgets/custom_button.dart';
import 'widgets/custom_order_container.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key, required this.withBackButton})
      : super(key: key);
  final bool withBackButton;
  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
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
              widget.withBackButton
                  ? CustomAppBar(
                      title: "myOrders",
                    )
                  : Padding(
                      padding: EdgeInsets.all(18.h),
                      child: Text(
                        "myOrders".tr(),
                        style: getBoldStyle(fontSize: 20.sp),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: GestureDetector(
                          onTap: () {
                            cubit.changeOrderType(true);
                            print(cubit.withPriceType);
                          },
                          child: ServicesType(
                              departmentName: 'ordersWithOffers',
                              isSelected: cubit.withPriceType)),
                    ),
                    Flexible(
                      child: GestureDetector(
                          onTap: () {
                            cubit.changeOrderType(false);
                            print(cubit.withPriceType);
                          },
                          child: ServicesType(
                              departmentName: 'ordersWithoutOffers',
                              isSelected: !cubit.withPriceType)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: CustomFilterDropDownMenu(
                  dropdownValue: cubit.dropdownValue,
                  onChanged: (String? value) {
                    setState(() {
                      cubit.dropdownValue = value!;
                    });
                  },
                  text: "statusFilter".tr(),
                  items: cubit.filters
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e.toString(),
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                CustomOrderContainer(
                                  //orderModel: cubit
                                  //    .getOrdersModel!
                                  //    .data!
                                  //    .old![index],
                                  isCurrent: false,
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 15.h,
                                ),
                            itemCount: 5)
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
