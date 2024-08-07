import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:khebra/features/home/cubit/home_cubit.dart';

import 'custom_category_container.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 5.w,
        crossAxisSpacing: 5.w,
        children: List.generate(
          cubit.categoriesModel!.result!.length >= 6
              ? 6
              : cubit.categoriesModel!.result!.length,
          (index) => CustomCategoriesContainer(
            categoryId: cubit.categoriesModel!.result![index].id!,
            image: cubit.categoriesModel!.result![index].image,
            mainText: cubit.categoriesModel!.result![index].name ?? "",
          ),
        ));
  }
}
