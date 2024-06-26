import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/widgets/network_image.dart';

import 'custom_category_container.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 5.w,
      crossAxisSpacing: 5.w,
      //   GridView.count(
      // shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      // crossAxisCount: 4,
      // mainAxisSpacing: 5.w,
      // crossAxisSpacing: 5.w,
      // childAspectRatio: 1 / 2,
      children: [
        CustomContainer(
          
          containerOnTap: () {},
          mainText: "AppStrings.collectPoints",
        ),
        CustomContainer(
         
          containerOnTap: () {},
          mainText: "AppStrings.collectPoints",
        ),
        CustomContainer(
          
          containerOnTap: () {},
          mainText: "AppStrings.collectPoints",
        ),
        CustomContainer(
         
          containerOnTap: () {},
          mainText: "AppStrings.collectPoints",
        ),
        
      ],
    );
  }
}
