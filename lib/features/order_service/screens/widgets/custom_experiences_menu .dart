import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/order_service/cubit/orders_service_states.dart';

import '../../../../core/widgets/custom_drop_down_menu.dart';

class CustomExperiencesMenu extends StatefulWidget {
  const CustomExperiencesMenu({
    super.key,
  });

  @override
  State<CustomExperiencesMenu> createState() => _CustomExperiencesMenuState();
}

class _CustomExperiencesMenuState extends State<CustomExperiencesMenu> {
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
        return
            //  cubit.countriestModel!.data != null
            //     ?
            CustomDropDownMenu(
          text: "selectTheExperience".tr(),
          dropdownValue: cubit.selectedExperience,
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
            cubit.changeExperience(value!);
          },
          items: cubit.experienceList
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e,
                    style: getMediumStyle(),
                  ),
                ),
              )
              .toList(),
        )
            // : SizedBox(
            //     height: MediaQuery.of(context).size.width / 22,
            //   )
            ;
      },
    );
  }
}
