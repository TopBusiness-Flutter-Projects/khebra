import 'package:flutter/material.dart';
import 'package:khebra/features/forgetPassword/screens/forget_password_screen.dart';
import 'package:khebra/features/forgetPassword/screens/new_password_screen.dart';
import 'package:khebra/features/forgetPassword/screens/otp_screen.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/home/screens/categories_screen.dart';
import 'package:khebra/features/home/screens/home_screen.dart';
import 'package:khebra/features/home/screens/servicies_screen.dart';
import 'package:khebra/features/home/screens/technicians/all_rates_screen.dart';
import 'package:khebra/features/home/screens/technicians/technicians_profile_screen.dart';
import 'package:khebra/features/home/screens/technicians/technicians_screen.dart';
import 'package:khebra/features/login/screens/login_screen.dart';
import 'package:khebra/features/main/screens/main_screen.dart';
import 'package:khebra/features/menu/screens/contact_us/add_message_screen.dart';
import 'package:khebra/features/menu/screens/contact_us/contac_us.dart';
import 'package:khebra/features/menu/screens/favourites_screen.dart';
import 'package:khebra/features/my_orders/screens/my_orders_screen.dart';
import 'package:khebra/features/my_orders/screens/order_details_screen.dart';
import 'package:khebra/features/notifications/screens/notifications_screen.dart';
import 'package:khebra/features/offers/screens/offer_details.dart';
import 'package:khebra/features/onboarding/screens/onboard_screen.dart';
import 'package:khebra/features/order_service/screens/order_service_screen.dart';
import 'package:khebra/features/profile/screens/my_bills_screen.dart';
import 'package:khebra/features/profile/screens/profile_screen.dart';
import 'package:khebra/features/profile/screens/update_profile_screen.dart';
import 'package:khebra/features/projects/screens/add_project_screen.dart';
import 'package:khebra/features/projects/screens/project_details.dart';
import 'package:khebra/features/register/cubit/register_cubit.dart';
import 'package:khebra/features/register/screens/register_screen.dart';
import 'package:khebra/features/splash/screens/splash_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../features/projects/screens/projects_screen.dart';
import '../../features/projects/screens/timetable_screen.dart';

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
  static const String updateProfileRoute = '/updateProfile';
  static const String myBillsRoute = '/myBills';
  static const String allServicesRoute = '/allServices';
  static const String privacyRoute = '/privacy_about';
  static const String myOrdersRoute = '/myOrders';
  static const String detailsRoute = '/details';
  static const String contactUsRoute = '/contact_us';
  static const String addMessageRoute = '/addMessage';
  static const String addProjectRoute = '/addProject';
  static const String googleMapDetailsRoute = '/google_map_details_screen';
  static const String stepperPage = '/stepperPage';
  static const String projectScreen = '/projectScreen';
  static const String projectDetailsScreen = '/projectDetails';
  static const String techniciansProfile = '/techniciansProfile';
  static const String allRatesProfile = '/allRatesProfile';
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
      bool isRegister=settings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) =>  OTPScreen(isRegister: isRegister,),
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
      case Routes.myBillsRoute:
        return MaterialPageRoute(
          builder: (context) => const MyBillsScreen(),
        );
      case Routes.updateProfileRoute:
        return MaterialPageRoute(
          builder: (context) => const UpdateProfileScreen(),
        );
      case Routes.contactUsRoute:
        return MaterialPageRoute(
          builder: (context) => const ContactUsScreen(),
        );
      case Routes.addMessageRoute:
        return MaterialPageRoute(
          builder: (context) => const AddMessageScreen(),
        );
      case Routes.addProjectRoute:
        return MaterialPageRoute(
          builder: (context) => const AddProjectScreen(),
        );
      case Routes.stepperPage:
        return MaterialPageRoute(
          builder: (context) =>const TimetableScreen(),
        );
      case Routes.techniciansProfile:
        return MaterialPageRoute(
          builder: (context) =>const TechniciansProfileScreen(),
        );
      case Routes.allRatesProfile:
        return MaterialPageRoute(
          builder: (context) =>const AllRatesScreen(),
        );

      case Routes.projectDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const ProjectDetailsScreen(),
        );
      case Routes.projectScreen:
        return MaterialPageRoute(
          builder: (context) => const ProjectsScreen(),
        );

      case Routes.myOrdersRoute:
        bool withBackButton = settings.arguments as bool;

        return MaterialPageRoute(
          builder: (context) => MyOrdersScreen(
            withBackButton: withBackButton,
          ),
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
