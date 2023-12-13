// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/body.dart';
import 'package:flutter_spotify_ui/localization/app_localization.dart';
import 'package:flutter_spotify_ui/models/class/task_class.dart';

class EditToDoScreen extends StatefulWidget {
  EditToDoScreen({super.key, required this.element});

  TaskElement element;

  @override
  State<EditToDoScreen> createState() => _EditToDoScreenState();
}

class _EditToDoScreenState extends State<EditToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Body(
      appBar: AppBar(),
      widget: Column(
        children: [
          Text(AppLocalizations.current.pasteTitle),
          Text(AppLocalizations.current.description),
        ],
      ),
    );
  }
}
