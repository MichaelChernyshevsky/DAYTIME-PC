import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/body.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Body(widget: const Text('ggg'));
  }
}
