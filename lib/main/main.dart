import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pod_i_ya/core/style/theme.dart';
import 'package:pod_i_ya/features/logging/presentation/entering_pages/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:pod_i_ya/features/main_app/presentation/cubit/user_cubit.dart';
import 'package:pod_i_ya/main/cubit/theme_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';

import '../app_config.dart';
import '../injection_container.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  await InjectionContainer().init();

  sl<AppConfig>();
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ua')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    if (Platform.isAndroid) {
      FlutterAppBadger.removeBadge();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<ThemeCubit>(
      create: (BuildContext context) => ThemeCubit(),
        ),
          BlocProvider<UserCubit>(create: (BuildContext context) => UserCubit())
    ],
      child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              builder: BotToastInit(),
              navigatorObservers: [
                BotToastNavigatorObserver(),
              ],
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              themeMode: state ? ThemeMode.dark : ThemeMode.light,
              darkTheme: darkTheme,
              theme: lightTheme,
              home: const LoggingPage(),
            );
          }
      ),
    );
  }
}
