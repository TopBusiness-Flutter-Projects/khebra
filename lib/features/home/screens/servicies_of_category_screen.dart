// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/core/widgets/custom_no_results.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_service_container.dart';

class ServicesOfCategoryScreen extends StatefulWidget {
  const ServicesOfCategoryScreen(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);
  final int categoryId;
  final String categoryName;
  @override
  State<ServicesOfCategoryScreen> createState() =>
      _ServicesOfCategoryScreenState();
}

class _ServicesOfCategoryScreenState extends State<ServicesOfCategoryScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getAllProductsByCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        return Scaffold(
          body: cubit.productsOfCategoryModel.result == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    CustomAppBar(
                      title: widget.categoryName,
                    ),
                    Expanded(
                      child: cubit.productsOfCategoryModel.result!.isEmpty
                          ? CustomNoResultsWidget()
                          : SingleChildScrollView(
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
                                            children: List.generate(
                                              cubit.productsOfCategoryModel
                                                  .result!.length,
                                              (index) => CustomServiceContainer(
                                                listPrice: cubit
                                                    .productsOfCategoryModel
                                                    .result![index]
                                                    .listPrice!,
                                                mainText: cubit
                                                    .productsOfCategoryModel
                                                    .result![index]
                                                    .name!,
                                                image: cubit
                                                    .productsOfCategoryModel
                                                    .result![index]
                                                    .image1920,
                                                withPrice: cubit
                                                        .productsOfCategoryModel
                                                        .result![index]
                                                        .listPrice! !=
                                                    0.0,
                                                containerOnTap: () {},
                                              ),
                                            ))),
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
