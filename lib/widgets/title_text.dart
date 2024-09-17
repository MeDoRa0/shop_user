import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(
      {super.key,
      required this.label,
      this.fontSize = 20,
      this.fontStyle = FontStyle.normal,
      this.color,
      this.textDecoration = TextDecoration.none,
      this.maxLines});
  final String label;
  final double fontSize;
  final FontStyle fontStyle;

  final Color? color;
  final TextDecoration textDecoration;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontStyle: fontStyle,
          decoration: textDecoration,
          overflow: TextOverflow.ellipsis),
    );
  }
}
