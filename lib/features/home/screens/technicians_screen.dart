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
import 'package:khebra/features/home/screens/widgets/custom_services_section.dart';
import 'package:khebra/features/home/screens/widgets/custom_slider.dart';
import 'package:khebra/features/home/screens/widgets/custom_technicians_container.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/login/cubit/login_states.dart';
import '../../../core/widgets/custom_button.dart';
import 'widgets/custom_category_section.dart';
import 'widgets/custom_technicians_section.dart';

class TechniciansScreen extends StatefulWidget {
  const TechniciansScreen({Key? key}) : super(key: key);

  @override
  State<TechniciansScreen> createState() => _TechniciansScreenState();
}

class _TechniciansScreenState extends State<TechniciansScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
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
                title: "technicians",
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: 'filter'.tr(),
                        borderRadius: 20,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            AppImages.search,
                            fit: BoxFit.fill,
                            width: 8.w,
                            height: 8.w,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        controller: searchController,
                        validator: (value) => value!.isEmpty ? '' : null,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      AppImages.filter,
                      width: 50.w,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.w),
                            child: StaggeredGrid.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5.w,
                                crossAxisSpacing: 20.w,
                                children: List.generate(
                                  10,
                                  (index) => CustomTechniciansContainer(
                                    inHome: false,
                                    mainText: "AppStringsAppStringsAppStrings",
                                    containerOnTap: () {},
                                  ),
                                )
                                ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
