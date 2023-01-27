import 'package:flutter/material.dart';

class SkywaText extends StatelessWidget {
  final text;
  final TextStyle? textStyle;
  final Color color;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLines;
  final double letterSpacing;
  final TextDecoration? textDecoration;
  final TextDecorationStyle? textDecorationStyle;

  const SkywaText(
    this.text, {
    Key? key,
    this.textStyle,
    this.color = Colors.black,
    this.fontSize = 18.0,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLines = 3,
    this.letterSpacing = 0.0,
    this.textDecoration,
    this.textDecorationStyle,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: textStyle ??
          TextStyle(
            fontSize: fontSize,
            fontStyle: fontStyle,
            color: color,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration,
            decorationStyle: textDecorationStyle,
          ),
    );
  }
}
