import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/common/edit_todo_screen.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/container.dart';
import 'package:flutter_spotify_ui/models/class/task_class.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    super.key,
    required this.element,
  });

  final TaskElement element;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  Color color = UTILSConstants.undone;

  void changeColor() => setState(() {
        if (color == UTILSConstants.undone) {
          color = UTILSConstants.done;
        } else {
          color = UTILSConstants.undone;
        }
      });

  void goToElement(context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditToDoScreen(
            element: widget.element,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: getWidth(100),
        child: GestureDetector(
          onTap: changeColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                // colorBorder: widget.element.color,
                colorBorder: color,
                height: 50,
                width: 350,
                widget: Row(
                  children: [
                    // Icon(
                    //   widget.element.icon.icon,
                    //   color: widget.element.color,
                    // ),
                    const Spacer(),
                    Text(
                      widget.element.title,
                      // style: TextStyle(color: widget.element.color),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              // Padding(
              //   padding: getPadding(left: 20),
              //   child: GestureDetector(
              //     onTap: changeColor,
              //     child: Icon(
              //       Icons.check_circle_outline_rounded,
              //       color: color,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
