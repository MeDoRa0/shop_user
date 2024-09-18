import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText(
      {super.key,
      required this.label,
      this.fontSize = 16,
      this.fontStyle = FontStyle.normal,
      this.fontWeight = FontWeight.normal,
      this.color,
      this.textDecoration = TextDecoration.none});
  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecoration,
      ),
    );
  }
}
