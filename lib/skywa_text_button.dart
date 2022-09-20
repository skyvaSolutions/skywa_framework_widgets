import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_auto_size_text.dart';

import 'services/is_string_invalid.dart';
import 'skywa_text.dart';

class SkywaTextButton extends StatefulWidget {
  final String text;
  final Function onTap;
  final Color? buttonColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  SkywaTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonColor,
    this.padding,
    this.margin,
    this.textColor = Colors.black,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w400,
  })  : assert(!isStringInvalid(text: text)),
        super(key: key);

  @override
  State<SkywaTextButton> createState() => _SkywaTextButtonState();
}

class _SkywaTextButtonState extends State<SkywaTextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Card(
              elevation: 1.0,
              margin: widget.margin ?? const EdgeInsets.all(0.0),
              color: widget.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: widget.padding ??
                    const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                child: SkywaAutoSizeText(
                  text: widget.text,
                  color: widget.textColor,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
