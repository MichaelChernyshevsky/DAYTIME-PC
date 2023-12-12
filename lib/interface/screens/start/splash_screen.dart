import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _goToNext() =>
        Navigator.of(context).popAndPushNamed(AppRoutes.mainScreen);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: _goToNext,
              child: Text('go'),
            )
          ],
        ),
      ),
    );
  }
}
