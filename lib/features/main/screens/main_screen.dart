// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khebra/config/routes/app_routes.dart';
import 'package:khebra/core/utils/assets_manager.dart';
import 'package:khebra/core/utils/dialogs.dart';
import 'package:khebra/core/utils/styles/app_colors.dart';
import 'package:khebra/core/utils/styles/app_fonts.dart';
import 'package:khebra/core/widgets/custom_text.dart';
import 'package:khebra/core/widgets/custom_text_form_field.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/cubit/home_states.dart';
import 'package:khebra/features/home/screens/home_screen.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/login/cubit/login_states.dart';
import 'package:khebra/features/main/cubit/main_cubit.dart';
import 'package:khebra/features/main/cubit/main_states.dart';
import 'package:khebra/features/menu/screens/menu_screen.dart';
import 'package:khebra/features/my_orders/screens/my_orders_screen.dart';
import 'package:khebra/features/offers/screens/offers_screen.dart';
import 'package:khebra/features/order_service/screens/order_service_screen.dart';
import '../../../core/widgets/custom_button.dart';

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  int _index = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    MyOrdersScreen(),
    OffersScreen(),
    MenuScreen(),
    OrderServiceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    MainCubit cubit = context.read<MainCubit>();
    return BlocBuilder<MainCubit, MainStates>(
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Scaffold(
                  resizeToAvoidBottomInset: true,
                  extendBody: true,
                  body: WillPopScope(
                      onWillPop: () async {
                        if (_index != 0) {
                          _index = 0;
                          return false;
                        } else {
                          SystemNavigator.pop();
                          return true;
                        }
                      },
                      child: _pages[_index]),
                  bottomNavigationBar: Container(
                    height: 60.h,
                    color: Colors.transparent,
                    // margin: EdgeInsets.all(0),
                    child: FloatingNavbar(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                      margin: EdgeInsets.all(0),

                      borderRadius: MediaQuery.of(context).size.width / 4,
                      backgroundColor: AppColors.secondPrimary,
                      // selectedItemColor: purpleColor,
                      // unselectedItemColor: purpleColor,
                      selectedBackgroundColor: Colors.transparent,
                      elevation: 0,

                      items: [
                        FloatingNavbarItem(
                            customWidget: Padding(
                          padding: EdgeInsets.all(2),
                          child: _index == 0
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      AppImages.home,
                                      color: AppColors.primary,
                                      width: MediaQuery.of(context).size.width /
                                          14,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              14,
                                    ),
                                  ),
                                )
                              : Image.asset(
                                  AppImages.home,
                                  color: AppColors.white,
                                  width: MediaQuery.of(context).size.width / 14,
                                  height:
                                      MediaQuery.of(context).size.width / 14,
                                ),
                        )),
                        FloatingNavbarItem(
                            customWidget: Padding(
                          padding: EdgeInsets.all(2),
                          child: _index == 1
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        AppImages.orders,
                                        color: AppColors.primary,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                14,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                14,
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Image.asset(
                                    AppImages.orders,
                                    color: AppColors.white,
                                    width:
                                        MediaQuery.of(context).size.width / 14,
                                    height:
                                        MediaQuery.of(context).size.width / 14,
                                  ),
                                ),
                        )),
                        FloatingNavbarItem(
                            customWidget: Padding(
                          padding: EdgeInsets.all(2),
                          child: _index == 2
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 50.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        AppImages.offers,
                                        color: AppColors.primary,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                14,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                14,
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(right: 50.0),
                                  child: Image.asset(
                                    AppImages.offers,
                                    color: AppColors.white,
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.width / 15,
                                  ),
                                ),
                        )),
                        FloatingNavbarItem(
                            customWidget: Padding(
                          padding: EdgeInsets.all(2),
                          child: _index == 3
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      AppImages.menu,
                                      color: AppColors.primary,
                                      width: MediaQuery.of(context).size.width /
                                          14,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              14,
                                    ),
                                  ),
                                )
                              : Image.asset(
                                  AppImages.menu,
                                  color: AppColors.white,
                                  width: MediaQuery.of(context).size.width / 14,
                                  height:
                                      MediaQuery.of(context).size.width / 14,
                                ),
                        )),
                      ],
                      onTap: (index) {
                        setState(() {
                          _index = index;
                        });
                      },
                      currentIndex: _index,
                    ),
                  )),
              Positioned(
                bottom: 25.h,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = 4;
                    });
                  },
                  child: Image.asset(
                    AppImages.plus,
                    width: 50.h,
                    height: 50.h,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
