// ignore_for_file: type_annotate_public_apis, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/common/edit_spending_screen.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/container.dart';
import 'package:flutter_spotify_ui/models/class/economy_class.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class SpendingWidget extends StatelessWidget {
  SpendingWidget({
    super.key,
    required this.element,
  });

  final EconomyElement element;
  bool validate = false;

  void goToElement(context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditSpendingScreen(
            element: element,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final sign = element.isSpending == true ? '-' : '+';

    final color = element.isSpending == true
        ? UTILSConstants.grey
        : UTILSConstants.purple;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              '12.09.2023',
              style: TextStyle(color: color),
            ),
          ),
          GestureDetector(
            onTap: () => goToElement(context),
            child: CustomContainer(
              colorBorder: color,
              height: 100,
              width: size.width * 0.8,
              widget: Column(
                children: [
                  Text(
                    element.title,
                    style: TextStyle(color: color),
                  ),
                  Text(
                    '$sign  ${element.count}',
                    style: TextStyle(color: color),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
