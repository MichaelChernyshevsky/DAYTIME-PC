import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/constants/navigation.dart';
import 'package:flutter_spotify_ui/interface/screens/main_content.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            groupAlignment: groupAlignment,
            onDestinationSelected: (int index) => setState(() {
              _selectedIndex = index;
            }),
            labelType: labelType,
            destinations: NavigationConstants.iconsBottomBar,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          MainContant(selectedIndex: _selectedIndex),
        ],
      ),
    );
  }
}
