import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/economy_page.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/news_page.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/stat_page.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/task_page.dart';
import 'package:flutter_spotify_ui/interface/screens/pages/user_page.dart';

class PagesService {
  static List<Widget> get pages => [
        const StatPage(),
        const NewsPage(),
        const TaskPage(),
        const EconomyPage(),
        const UserPage(),
      ];
}
