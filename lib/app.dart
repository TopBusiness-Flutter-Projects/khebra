import 'package:khebra/features/forgetPassword/cubit/forget_password_cubit.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/main/cubit/main_cubit.dart';
import 'package:khebra/features/menu/cubit/menu_cubit.dart';
import 'package:khebra/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:khebra/features/offers/cubit/offers_cubit.dart';
import 'package:khebra/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/register/cubit/register_cubit.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:khebra/injector.dart' as injector;

class KhebraApp extends StatefulWidget {
  const KhebraApp({super.key});

  @override
  State<KhebraApp> createState() => _KhebraAppState();
}

class _KhebraAppState extends State<KhebraApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => injector.serviceLocator<OnboardingCubit>(),
                ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<LoginCubit>(),
                ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<RegisterCubit>(),
                ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<ForgetPasswordCubit>(),
                ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<MainCubit>(),
                ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<HomeCubit>(),
                ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<MyOrdersCubit>(),
                ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<OffersCubit>(),
                ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<MenuCubit>(),
                ),
                BlocProvider(
                  create: (_) => injector.serviceLocator<OrderServiceCubit>(),
                ),
              ],
              child: GetMaterialApp(
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                // navigatorKey: navigatorKey,
                theme: appTheme(),
                themeMode: ThemeMode.light,
                darkTheme: ThemeData.light(),
                localizationsDelegates: context.localizationDelegates,
                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              ));
        });
  }
}
