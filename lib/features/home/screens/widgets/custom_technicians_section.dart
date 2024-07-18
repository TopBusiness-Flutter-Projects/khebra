import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/home/screens/widgets/custom_technicians_container.dart';

import 'custom_service_container.dart';

class TechniciansSection extends StatelessWidget {
  const TechniciansSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => CustomTechniciansContainer(
                mainText: "AppStringsAppStringsAppStrings",
                containerOnTap: () {
                  Navigator.pushNamed(context, Routes.techniciansProfile);
                },
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 5.w,
              ),
          itemCount: 5),
    );
  }
}
