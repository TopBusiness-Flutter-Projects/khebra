// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/utils/app_strings.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/network_image.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/offers/cubit/offers_cubit.dart';
import 'package:khebra/features/offers/cubit/offers_states.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OffersCubit, OffersStates>(builder: (context, state) {
        OffersCubit cubit = context.read<OffersCubit>();
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(18.h),
                  child: Text(
                    "offers".tr(),
                    style: getBoldStyle(fontSize: 20.sp),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 10,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.offerDetailsRoute);
                      },
                      child: CustomNetworkImage(
                        imageUrl: AppStrings.sliderTestImage,
                        height: 100.h,
                        // width: 120.h,
                      ),
                    ),
                  ),
                ),
                // Image.asset(
                //   width: double.infinity,
                //   AppImages.login,
                // )
              ],
            ),
          ),
        );
      }),
    );
  }
}
