import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SkywaAutoSizeText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLines;
  final double letterSpacing;

  const SkywaAutoSizeText({
    Key? key,
    required this.text,
    this.textStyle,
    this.color = Colors.black,
    this.fontSize = 13.0,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLines,
    this.letterSpacing = 0.0,
  })  : assert(text != 'null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
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
          ),
    );
  }
}
