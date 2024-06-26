import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khebra/app.dart';
import 'package:khebra/app_bloc_observer.dart';
import 'package:khebra/core/preferences/preferences.dart';
import 'package:khebra/core/utils/restart_app_class.dart';
import 'package:khebra/injector.dart' as injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  await EasyLocalization.ensureInitialized();
  await injector.setup();
  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', ''), Locale('en', '')],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('ar', ''),
      fallbackLocale: const Locale('ar', ''),
      child: HotRestartController(child: const KhebraApp()),
    ),
  );
}
