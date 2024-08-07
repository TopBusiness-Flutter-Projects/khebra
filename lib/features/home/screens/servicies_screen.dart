// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:khebra/core/widgets/custom_appBar.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_service_container.dart';
import 'package:khebra/features/home/screens/widgets/custom_services_type_widget.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().changeServicesType(true);
    context.read<HomeCubit>().getAllProductsPrices(isWithPrice: true);
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
                    Flexible(
                      child: GestureDetector(
                          onTap: () {
                            cubit.changeServicesType(true);
                            cubit.getAllProductsPrices(isWithPrice: true);
                            print(cubit.withPriceType);
                          },
                          child: ServicesType(
                              departmentName: 'pricesService',
                              isSelected: cubit.withPriceType)),
                    ),
                    Flexible(
                      child: GestureDetector(
                          onTap: () {
                            cubit.changeServicesType(false);
                            cubit.getAllProductsPrices(isWithPrice: false);
                            print(cubit.withPriceType);
                          },
                          child: ServicesType(
                              departmentName: 'withoutPricesService',
                              isSelected: !cubit.withPriceType)),
                    ),
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
                          child: cubit.withPriceType
                              ? cubit.productsWithPriceModel == null
                                  ? Center(child: CircularProgressIndicator())
                                  : StaggeredGrid.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10.w,
                                      crossAxisSpacing: 15.w,
                                      children: List.generate(
                                        cubit.productsWithPriceModel!.result!
                                            .length,
                                        (index) => CustomServiceContainer(
                                          listPrice: cubit
                                              .productsWithPriceModel!
                                              .result![index]
                                              .listPrice!,
                                          mainText: cubit
                                              .productsWithPriceModel!
                                              .result![index]
                                              .name!,
                                          image: cubit.productsWithPriceModel!
                                              .result![index].image1920,
                                          containerOnTap: () {},
                                        ),
                                      ))
                              :

                              /// without price

                              cubit.productsWithoutPriceModel == null
                                  ? Center(child: CircularProgressIndicator())
                                  : StaggeredGrid.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10.w,
                                      crossAxisSpacing: 15.w,
                                      children: List.generate(
                                        cubit.productsWithoutPriceModel!.result!
                                            .length,
                                        (index) => CustomServiceContainer(
                                          listPrice: cubit
                                              .productsWithoutPriceModel!
                                              .result![index]
                                              .listPrice!,
                                          mainText: cubit
                                              .productsWithoutPriceModel!
                                              .result![index]
                                              .name!,
                                          image: cubit
                                              .productsWithoutPriceModel!
                                              .result![index]
                                              .image1920,
                                          containerOnTap: () {},
                                          withPrice: false,
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
