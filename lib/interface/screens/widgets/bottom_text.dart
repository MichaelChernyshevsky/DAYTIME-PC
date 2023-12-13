import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/interface/screens/widgets/text.dart';
import 'package:flutter_spotify_ui/utils/enum/text_enum.dart';
import 'package:flutter_spotify_ui/utils/utils_size.dart';

class BottomText extends StatefulWidget {
  const BottomText({
    super.key,
    required this.tap_1,
    required this.tap_2,
    required this.text_1,
    required this.text_2,
  });

  final String text_1;
  final String text_2;

  final VoidCallback tap_1;
  final VoidCallback tap_2;

  @override
  State<BottomText> createState() => _BottomTextState();
}

class _BottomTextState extends State<BottomText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: 25, left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              widget.tap_1();
            },
            child: CustomText(
              text: widget.text_1,
              fontSize: TextEnum.bottom,
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.tap_2();
            },
            child: CustomText(
              text: widget.text_2,
              fontSize: TextEnum.bottom,
            ),
          ),
        ],
      ),
    );
  }
}
