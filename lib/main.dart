import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/hive/economy_repo.dart';
import 'package:flutter_spotify_ui/data/hive/task_repo.dart';
import 'package:flutter_spotify_ui/interface/routes/app_routes.dart';
import 'package:flutter_spotify_ui/localization/app_localization.dart';
import 'package:flutter_spotify_ui/manager/get.it/app_provider.dart';
import 'package:flutter_spotify_ui/manager/provider/ordinaryProvider.dart';
import 'package:flutter_spotify_ui/manager/tasks_bloc/tasks_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_spotify_ui/manager/economy_bloc/economy_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
  GetIt.I.registerSingleton<AppProvider>(AppProvider());

  await Hive.initFlutter();

  GetIt.I.registerSingletonAsync<TaskRepo>(
    () async {
      final hivePacks = TaskRepo();
      await hivePacks.init();
      return hivePacks;
    },
  );

  GetIt.I.registerSingletonAsync<EconomyRepo>(
    () async {
      final hivePacks = EconomyRepo();
      await hivePacks.init();
      return hivePacks;
    },
  );

  await GetIt.I.allReady();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<EconomyBloc>(create: (context) => EconomyBloc()),
        BlocProvider<TasksBloc>(create: (context) => TasksBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => OrdinaryProvider(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
