import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/common/create_spending_screen.dart';
import 'package:flutter_spotify_ui/interface/screens/main_screen.dart';
import 'package:flutter_spotify_ui/interface/screens/start/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String mainScreen = '/main_sreen';
  static const String addSpendingScreen = '/addSpendingScreen';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (_) => const SplashScreen(),
        mainScreen: (_) => MainScreen(),
        addSpendingScreen: (_) => const CreateSpedingScreen(),
      };
}
