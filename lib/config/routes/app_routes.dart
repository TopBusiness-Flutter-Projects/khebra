import 'package:flutter/material.dart';
import 'package:khebra/features/forgetPassword/screens/forget_password_screen.dart';
import 'package:khebra/features/forgetPassword/screens/new_password_screen.dart';
import 'package:khebra/features/forgetPassword/screens/otp_screen.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/screens/categories_screen.dart';
import 'package:khebra/features/home/screens/home_screen.dart';
import 'package:khebra/features/home/screens/servicies_screen.dart';
import 'package:khebra/features/home/screens/technicians_screen.dart';
import 'package:khebra/features/login/screens/login_screen.dart';
import 'package:khebra/features/main/screens/main_screen.dart';
import 'package:khebra/features/menu/screens/favourites_screen.dart';
import 'package:khebra/features/my_orders/screens/order_details_screen.dart';
import 'package:khebra/features/notifications/screens/notifications_screen.dart';
import 'package:khebra/features/offers/screens/offer_details.dart';
import 'package:khebra/features/onboarding/screens/onboard_screen.dart';
import 'package:khebra/features/order_service/screens/order_service_screen.dart';
import 'package:khebra/features/profile/screens/profile_screen.dart';
import 'package:khebra/features/register/cubit/register_cubit.dart';
import 'package:khebra/features/register/screens/register_screen.dart';
import 'package:khebra/features/splash/screens/splash_screen.dart';

import '../../core/utils/app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoarding = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String orderService = '/orderService';
  static const String mainRoute = '/main';
  static const String servicesRoute = '/services';
  static const String techniciansRoute = '/technicians';
  static const String categoriesRoute = '/categories';
  static const String notificationRoute = '/notificationRoute';
  static const String otpScreenRoute = '/otpScreen';
  static const String forgetPasswordScreenRoute = '/forgetPasswordScreen';
  static const String newPasswordScreenRoute = '/newPasswordScreen';
  static const String offerDetailsRoute = '/offerDetails';
  static const String orderDetailsRoute = '/orderDetails';
  static const String googleMapScreenRoute = '/googleMapScreen';
  static const String favoriteRoute = '/favorite';
  static const String fullScreenImageRoute = '/fullScreenImageRoute';
  static const String editProfileRoute = '/editProfile';
  static const String profileRoute = '/profile';
  static const String allServicesRoute = '/allServices';
  static const String privacyRoute = '/privacy_about';
  static const String myPostsRoute = '/my_posts';
  static const String detailsRoute = '/details';
  static const String contactUsRoute = '/contact_us';
  static const String googleMapDetailsRoute = '/google_map_details_screen';
}

class AppRoutes {
  static String route = '';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );
      case Routes.otpScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const OTPScreen(),
        );
      case Routes.newPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const NewPasswordScreen(),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      case Routes.orderService:
        return MaterialPageRoute(
          builder: (context) => const OrderServiceScreen(),
        );
      case Routes.servicesRoute:
        return MaterialPageRoute(
          builder: (context) => const ServicesScreen(),
        );
      case Routes.categoriesRoute:
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      case Routes.techniciansRoute:
        return MaterialPageRoute(
          builder: (context) => const TechniciansScreen(),
        );
      case Routes.offerDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => const OfferDetailsScreen(),
        );
      case Routes.orderDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => const OrderDetailsScreen(),
        );
      case Routes.notificationRoute:
        return MaterialPageRoute(
          builder: (context) => const NotificationsScreen(),
        );
      case Routes.favoriteRoute:
        return MaterialPageRoute(
          builder: (context) => const FavouritesScreen(),
        );
      case Routes.profileRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
