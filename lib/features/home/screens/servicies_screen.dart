// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/utils/app_const.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/dialogs.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/core/widgets/custom_text.dart';
import 'package:khebra/core/widgets/custom_text_form_field.dart';
import 'package:khebra/core/widgets/network_image.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_category_container.dart';
import 'package:khebra/features/home/screens/widgets/custom_home_text.dart';
import 'package:khebra/features/home/screens/widgets/custom_service_container.dart';
import 'package:khebra/features/home/screens/widgets/custom_services_section.dart';
import 'package:khebra/features/home/screens/widgets/custom_services_type_widget.dart';
import 'package:khebra/features/home/screens/widgets/custom_slider.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/login/cubit/login_states.dart';
import '../../../core/widgets/custom_button.dart';
import 'widgets/custom_category_section.dart';
import 'widgets/custom_technicians_section.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().changeServicesType(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return Scaffold(
          body: Column(
            children: [
              CustomAppBar(
                title: "services",
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          cubit.changeServicesType(true);
                          print(cubit.withPriceType);
                        },
                        child: ServicesType(
                            departmentName: 'pricesService',
                            isSelected: cubit.withPriceType)),
                    GestureDetector(
                        onTap: () {
                          cubit.changeServicesType(false);
                          print(cubit.withPriceType);
                        },
                        child: ServicesType(
                            departmentName: 'withoutPricesService',
                            isSelected: !cubit.withPriceType)),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: StaggeredGrid.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10.w,
                              crossAxisSpacing: 15.w,
                              children: cubit.withPriceType
                                  ? List.generate(
                                      10,
                                      (index) => CustomServiceContainer(
                                        mainText:
                                            "AppStringsAppStringsAppStrings",
                                        containerOnTap: () {},
                                      ),
                                    )
                                  : List.generate(
                                      5,
                                      (index) => CustomServiceContainer(
                                        mainText:
                                            "AppStringsAppStringsAppStrings",
                                        containerOnTap: () {},
                                      ),
                                    )),
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
