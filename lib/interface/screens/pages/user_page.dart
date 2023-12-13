import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/body.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Body(widget: const Text('data'));
  }
}
