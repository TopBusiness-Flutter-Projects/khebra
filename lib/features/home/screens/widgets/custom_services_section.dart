import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_service_container.dart';

class ServiciesSection extends StatelessWidget {
  const ServiciesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => CustomServiceContainer(
                mainText: "AppStringsAppStringsAppStrings",
                containerOnTap: () {},
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 5.w,
              ),
          itemCount: 5),
    );
  }
}
