import 'package:flutter/material.dart';

import 'skywa_text.dart';

class SkywaElevatedButton extends StatelessWidget {
  final BuildContext context;
  final IconData? iconData;
  final double? iconSize;
  final String text;
  final double fontSize;
  final Function() onTap;
  final Color buttonColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  SkywaElevatedButton.info({
    required this.context,
    this.iconData,
    this.iconSize,
    required this.text,
    this.fontSize = 18.0,
    required this.onTap,
    this.padding,
    this.margin,
  }) : buttonColor = Theme.of(context).colorScheme.secondary;

  SkywaElevatedButton.save({
    required this.context,
    this.iconData,
    this.iconSize,
    required this.text,
    this.fontSize = 18.0,
    required this.onTap,
    this.padding,
    this.margin,
  }) : buttonColor = Theme.of(context).primaryColor;

  SkywaElevatedButton.delete({
    required this.context,
    this.iconData,
    this.iconSize,
    required this.text,
    this.fontSize = 18.0,
    required this.onTap,
    this.padding,
    this.margin,
  }) : buttonColor = Theme.of(context).errorColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: padding != null
                ? padding
                : const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            margin: margin != null ? margin : const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                if (iconData != null)
                  Icon(
                    iconData,
                    color: Colors.white,
                    size: iconSize ?? IconTheme.of(context).size,
                  ),
                if (iconData != null) SizedBox(width: 10.0),
                SkywaText(
                  text: text,
                  fontSize: fontSize,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
