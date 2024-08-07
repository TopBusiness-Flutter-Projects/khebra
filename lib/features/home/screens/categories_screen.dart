// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_appbar.dart';
import 'package:khebra/core/widgets/custom_text_form_field.dart';
import 'package:khebra/core/widgets/network_image.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_category_container.dart';
import 'package:khebra/features/home/screens/widgets/custom_home_text.dart';
import 'package:khebra/features/home/screens/widgets/custom_services_section.dart';
import 'package:khebra/features/home/screens/widgets/custom_slider.dart';

import 'widgets/custom_category_section.dart';
import 'widgets/custom_technicians_section.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
                title: "categories",
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.w),
                            child: StaggeredGrid.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 30.w,
                                crossAxisSpacing: 10.w,
                                children: List.generate(
                                  cubit.categoriesModel!.result!.length,
                                  (index) => CustomCategoriesContainer(
                                    categoryId: cubit
                                        .categoriesModel!.result![index].id!,
                                    image: cubit
                                        .categoriesModel!.result![index].image,
                                    mainText: cubit.categoriesModel!
                                            .result![index].name ??
                                        "",
                                  ),
                                )),
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
