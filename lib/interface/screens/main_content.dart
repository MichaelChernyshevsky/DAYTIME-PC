import 'package:flutter/widgets.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/economy_page.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/news_page.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/stat_page.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/task_page.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/user_page.dart';

// ignore: must_be_immutable
class MainContant extends StatefulWidget {
  MainContant({super.key, required this.selectedIndex});

  int selectedIndex;

  @override
  State<MainContant> createState() => _MainContantState();
}

class _MainContantState extends State<MainContant> {
  @override
  Widget build(BuildContext context) {
    if (widget.selectedIndex == 0) {
      return Expanded(child: NewsPage());
    } else if (widget.selectedIndex == 1) {
      return Expanded(child: NewsPage());
    } else if (widget.selectedIndex == 2) {
      return Expanded(child: StatPage());
    } else if (widget.selectedIndex == 3) {
      return Expanded(child: TaskPage());
    } else if (widget.selectedIndex == 4) {
      return Expanded(child: EconomyPage());
    } else {
      return Expanded(child: UserPage());
    }
  }
}
