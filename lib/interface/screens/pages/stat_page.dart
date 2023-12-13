import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/body.dart';

class StatPage extends StatefulWidget {
  const StatPage({super.key});

  @override
  State<StatPage> createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
  @override
  Widget build(BuildContext context) {
    return Body(widget: const Text('ggg'));
  }
}
