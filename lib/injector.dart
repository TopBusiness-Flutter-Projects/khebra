import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:khebra/features/forgetPassword/cubit/forget_password_cubit.dart';
import 'package:khebra/features/home/cubit/home_cubit.dart';
import 'package:khebra/features/login/cubit/login_cubit.dart';
import 'package:khebra/features/main/cubit/main_cubit.dart';
import 'package:khebra/features/menu/cubit/menu_cubit.dart';
import 'package:khebra/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:khebra/features/notifications/cubit/notifications_cubit.dart';
import 'package:khebra/features/offers/cubit/offers_cubit.dart';
import 'package:khebra/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:khebra/features/order_service/cubit/order_service_cubit.dart';
import 'package:khebra/features/profile/cubit/profile_cubit.dart';
import 'package:khebra/features/register/cubit/register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'core/remote/service.dart';
import 'features/projects/cubit/projects_cubit.dart';

// import 'features/downloads_videos/cubit/downloads_videos_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////
  //

  serviceLocator.registerFactory(
    () => OnboardingCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => LoginCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => RegisterCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ForgetPasswordCubit(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => MainCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HomeCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => MyOrdersCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => OffersCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => MenuCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => OrderServiceCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => NotificationsCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ProfileCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ProjectsCubit(
      serviceLocator(),
    ),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));

  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppInterceptors());

  // Dio
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}
