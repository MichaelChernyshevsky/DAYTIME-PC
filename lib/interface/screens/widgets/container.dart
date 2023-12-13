// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    this.height = 42,
    this.width,
    this.color,
    this.colorBorder,
    required this.widget,
  });

  final double height;
  double? width;
  Color? color;
  Color? colorBorder;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    late BoxDecoration decoration;
    if (colorBorder != null) {
      decoration = BoxDecoration(
        border: Border.all(color: colorBorder!, width: getWidth(2)),
        color: color ?? UTILSConstants.transparent,
        borderRadius: BorderRadius.circular(10),
      );
    } else {
      decoration = BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      );
    }

    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: decoration,
      child: widget,
    );
  }
}
