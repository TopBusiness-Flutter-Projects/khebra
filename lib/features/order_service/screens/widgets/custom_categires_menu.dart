import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/order_service/cubit/orders_service_states.dart';

import '../../../../core/widgets/custom_drop_down_menu.dart';

class CustomCategoriesMenu extends StatefulWidget {
  const CustomCategoriesMenu({
    super.key,
  });

  @override
  State<CustomCategoriesMenu> createState() => _CustomCategoriesMenuState();
}

class _CustomCategoriesMenuState extends State<CustomCategoriesMenu> {
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
        return cubit.categoriesModel.result != null
            ? CustomDropDownMenu(
                text: "selectCategory".tr(),
                dropdownValue: dropdownValue,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                  cubit.changeCategoryId(value!);
                },
                //     items: [
                //   DropdownMenuItem<String>(
                //     value: "id",
                //     child: Text(
                //       "name",
                //       style: getMediumStyle(),
                //     ),
                //   )
                // ]

                items: cubit.categoriesModel.result!
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
