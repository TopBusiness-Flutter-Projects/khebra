// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:easy_localization/easy_localization.dart';
import 'package:khebra/core/utils/app_export.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/widgets/custom_home_text.dart';
import 'package:khebra/features/home/screens/widgets/custom_services_section.dart';
import 'package:khebra/features/home/screens/widgets/custom_slider.dart';
import 'package:khebra/features/profile/cubit/profile_cubit.dart';
import 'package:khebra/features/profile/cubit/profile_states.dart';

import 'widgets/custom_category_section.dart';
import 'widgets/custom_technicians_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    if (context.read<ProfileCubit>().getUserDataModel.result == null) {
      context.read<ProfileCubit>().getUserData();
    }
    if (context.read<HomeCubit>().categoriesModel == null) {
      context.read<HomeCubit>().getAllCategories();
    }
    if (context.read<HomeCubit>().productsOfCategoryModel.result == null) {
      context.read<HomeCubit>().getAllProducts();
    }
    if (context.read<HomeCubit>().getAllProviderModel.result == null) {
      context.read<HomeCubit>().getProviders();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
        HomeCubit cubit = context.read<HomeCubit>();
        ProfileCubit profileCubit = context.read<ProfileCubit>();
        return Scaffold(
          body: Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileStates>(
                  builder: (context, state) {
                return profileCubit.getUserDataModel.result == null
                    ? Padding(
                        padding: EdgeInsets.all(25),
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: CustomNetworkImage(
                                imageUrl: AppStrings.testNetworkImage,
                                height: 50.w,
                                width: 50.w,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "اهلا, ${profileCubit.getUserDataModel.result![0].name ?? ""} ",
                                    style: getBoldStyle(
                                        fontSize: 13.sp,
                                        color: AppColors.secondTextColor),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        AppImages.location,
                                        height: 20.w,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          profileCubit.getUserDataModel
                                                      .result![0].street
                                                      .toString() ==
                                                  "false"
                                              ? ""
                                              : profileCubit.getUserDataModel
                                                  .result![0].street
                                                  .toString(),
                                          style: getRegularStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.secondTextColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.notificationRoute);
                              },
                              child: Image.asset(
                                AppImages.notification,
                                height: 30.w,
                              ),
                            ),
                          ],
                        ),
                      );
              }),
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: CustomTextField(
                              labelText: 'searchService'.tr(),
                              borderRadius: 20,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  AppImages.search,
                                  fit: BoxFit.fill,
                                  width: 8.w,
                                  height: 8.w,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              controller: searchController,
                              validator: (value) => value!.isEmpty ? '' : null,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          CustomSlider(
                            items: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomNetworkImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: AppStrings.sliderTestImage,
                                    width: double.maxFinite),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomNetworkImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: AppStrings.sliderTestImage,
                                    width: double.maxFinite),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: CustomNetworkImage(
                                    boxFit: BoxFit.fill,
                                    imageUrl: AppStrings.sliderTestImage,
                                    width: double.maxFinite),
                              ),
                            ],
                            // items: cubit
                            //     .homeModel.data!.sliders!
                            //     .map((e) => GestureDetector(
                            //           onTap: () async {
                            //             final _url =
                            //                 Uri.parse(
                            //                     e.url!);
                            //             await launchUrl(
                            //                 _url,
                            //                 mode: LaunchMode
                            //                     .externalApplication);
                            //           },
                            //           child:
                            //               CustomNetworkImage(
                            //                   boxFit: BoxFit
                            //                       .fill,
                            //                   imageUrl:
                            //                       e.image!,
                            //                   errorWidget:
                            //                       Image
                            //                           .asset(
                            //                     AppImages
                            //                         .logoImage,
                            //                     fit: BoxFit
                            //                         .contain,
                            //                   ),
                            //                   width: double
                            //                       .maxFinite),
                            //         ))
                            //     .toList(),
                          ),
                          if (cubit.categoriesModel != null) ...[
                            CustomHomeTitles(
                              text: "categories",
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.categoriesRoute),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: CategoriesSection(),
                            ),
                          ],
                          if (cubit.productsModel.result != null) ...[
                            CustomHomeTitles(
                              text: "services",
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.servicesRoute),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: ServiciesSection(),
                            ),
                          ],
                          if (cubit.getAllProviderModel.result != null) ...[
                          CustomHomeTitles(
                            text: "besTechnicians",
                            onTap: () => Navigator.pushNamed(
                                context, Routes.techniciansRoute),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: TechniciansSection(),
                          ),
                        ],
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

class CustomHomeTitles extends StatelessWidget {
  const CustomHomeTitles({
    super.key,
    this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomHomeText(
            text: text,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "all".tr(),
              style: getRegularStyle(color: AppColors.primary, fontSize: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
