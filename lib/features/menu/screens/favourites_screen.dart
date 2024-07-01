// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/core/widgets/custom_text_form_field.dart';
import 'package:khebra/features/home/screens/widgets/custom_technicians_container.dart';
import 'package:khebra/features/menu/cubit/menu_cubit.dart';
import 'package:khebra/features/menu/cubit/menu_states.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<MenuCubit, MenuStates>(builder: (context, state) {
        MenuCubit cubit = context.read<MenuCubit>();
        return Scaffold(
          body: Column(
            children: [
              CustomAppBar(
                title: "favourites",
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
