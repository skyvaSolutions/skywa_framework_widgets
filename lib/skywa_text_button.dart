import 'package:flutter/material.dart';

import 'skywa_text.dart';

class SkywaTextButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color? buttonColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? iconData;
  final double? iconSize;
  final Color iconColor;

  const SkywaTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonColor,
    this.padding,
    this.margin,
    this.textColor,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w400,
    this.iconData,
    this.iconSize,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return iconData != null
        ? Column(
            children: [
              TextButton.icon(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  padding: padding ??
                      const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                  backgroundColor: buttonColor,
                ),
                icon: Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize ?? IconTheme.of(context).size,
                ),
                label: SkywaText(
                  text,
                  fontSize: fontSize,
                  color: textColor ?? Theme.of(context).errorColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        : Column(
            children: [
              TextButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  padding: padding ??
                      const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                  backgroundColor: buttonColor,
                ),
                child: SkywaText(
                  text,
                  fontSize: fontSize,
                  color: textColor ?? Theme.of(context).errorColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
  }
}
