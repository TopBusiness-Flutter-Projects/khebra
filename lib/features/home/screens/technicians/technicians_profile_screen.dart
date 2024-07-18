// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/widgets/custom_appbar.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/home_screen.dart';
import 'package:khebra/features/home/screens/widgets/custom_rate_widget.dart';

import '../../../../core/utils/app_export.dart';

class TechniciansProfileScreen extends StatefulWidget {
  const TechniciansProfileScreen({Key? key}) : super(key: key);

  @override
  State<TechniciansProfileScreen> createState() =>
      _TechniciansProfileScreenState();
}

class _TechniciansProfileScreenState extends State<TechniciansProfileScreen> {
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
              SizedBox(
                height: 220.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 160.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: AppColors.secondPrimary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomWhiteAppBar(
                            title: "techniciansProfile",
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 9,
                      child: Center(
                        child: Container(
                          height: 150.h,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                blurRadius: 5,
                                offset: Offset(0, 2), // Shadow position
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: CustomNetworkImage(
                                      imageUrl: AppStrings.testNetworkImage,
                                      height: 80.w,
                                      width: 80.w,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "AYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAAAYAA",
                                          maxLines: 1,
                                          style: getBoldStyle(
                                              color: AppColors.settingFont,
                                              fontSize: 18.sp),
                                        ),
                                        Text(
                                          "01024585455",
                                          maxLines: 1,
                                          style: getRegularStyle(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Flexible(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "AYAA",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: getBoldStyle(
                                                  color: AppColors.settingFont,
                                                  fontSize: 18.sp),
                                            ),
                                            Text(
                                              "01024585455",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: getRegularStyle(
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "AYAA",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: getBoldStyle(
                                                color: AppColors.settingFont,
                                                fontSize: 18.sp),
                                          ),
                                          Text(
                                            "01024585455",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: getRegularStyle(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "jbibbicjknsk",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: getBoldStyle(
                                                  color: AppColors.settingFont,
                                                  fontSize: 18.sp),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 20.sp,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  "5",
                                                  maxLines: 1,
                                                  style: getBoldStyle(
                                                      color:
                                                          AppColors.settingFont,
                                                      fontSize: 15.sp),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomHomeTitles(
                text: "rates",
                onTap: () {
                  Navigator.pushNamed(context, Routes.allRatesProfile);
                },
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomRateWidget();
                    }),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: CustomButton(
              text: 'rateTechnicians'.tr(),
              icon: Icon(Icons.star, color: Colors.white),
              onPressed: () {
                // Navigator.pushNamed(context,
                //     Routes.ratingScreen);
              },
            ),
          ),
        );
      }),
    );
  }
}
