import 'package:flutter/material.dart';

class SkywaText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLines;
  final double letterSpacing;
  final TextDecoration? textDecoration;
  final TextDecorationStyle? textDecorationStyle;

  const SkywaText({
    Key? key,
    required this.text,
    this.textStyle,
    this.color = Colors.black,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLines,
    this.letterSpacing = 0.0,
    this.textDecoration,
    this.textDecorationStyle,
  })  : assert(text != null && text != 'null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: textStyle ??
          TextStyle(
            fontSize: fontSize,
            color: color,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration,
            decorationStyle: textDecorationStyle,
          ),
    );
  }
}
