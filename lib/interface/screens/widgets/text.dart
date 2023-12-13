import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/utils/constants/constants_uikit.dart';
import 'package:flutter_spotify_ui/utils/enum/text_enum.dart';
import 'package:flutter_spotify_ui/utils/funcs/text_func.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = TextEnum.common,
  });
  final String text;
  final TextEnum fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: UTILSConstants.textColor,
        fontSize: getFontSize(UtilsFuns.getFontSize(style: fontSize)),
        // fontFamily:
      ),
    );
  }
}
