import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/order_service/cubit/orders_service_states.dart';

import '../../../../core/widgets/custom_drop_down_menu.dart';

class CustomServiceTypesMenu extends StatefulWidget {
  const CustomServiceTypesMenu({
    super.key,
  });

  @override
  State<CustomServiceTypesMenu> createState() => _CustomServiceTypesMenuState();
}

class _CustomServiceTypesMenuState extends State<CustomServiceTypesMenu> {
  String? dropdownValue;

  @override
  void initState() {
    //  context.read<OrderServiceCubit>().getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderServiceCubit cubit = context.read<OrderServiceCubit>();

    return BlocConsumer<OrderServiceCubit, OrderServiceStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return cubit.productsOfCategoryModel.result != null
            ? CustomDropDownMenu(
                text: "selectService".tr(),
                dropdownValue: cubit.selectedServiceId,
                onChanged: (String? value) {
                  final selectedService = cubit.productsOfCategoryModel.result!
                      .firstWhere((item) => item.id.toString() == value);

                  cubit.changeServiceId(value!, selectedService.listPrice!);
                },
                items: cubit.productsOfCategoryModel.result!
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e.id.toString(),
                        child: Text(
                          e.name!,
                          style: getMediumStyle(),
                        ),
                      ),
                    )
                    .toList(),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.width / 22,
              );
      },
    );
  }
}
