import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import 'skywa_text.dart';

class SkywaElevatedButton extends StatelessWidget {
  final BuildContext context;
  final IconData? iconData;
  final double? iconSize;
  final Color iconColor;
  final String text;
  final Color textColor;
  final double fontSize;
  final Function() onTap;
  final Color buttonColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const SkywaElevatedButton({
    Key? key,
    required this.context,
    this.iconData,
    this.iconSize,
    this.iconColor = Colors.black,
    required this.text,
    this.textColor = Colors.black,
    this.fontSize = 18.0,
    required this.onTap,
    this.padding,
    this.margin,
    required this.buttonColor,
  }) : super(key: key);

  SkywaElevatedButton.info({
    Key? key,
    required this.context,
    this.iconData,
    this.iconSize,
    required this.text,
    this.fontSize = 18.0,
    required this.onTap,
    this.padding,
    this.margin,
  })  : buttonColor = Theme.of(context).colorScheme.secondary,
        iconColor = Colors.white,
        textColor = Colors.white,
        super(key: key);

  SkywaElevatedButton.save({
    Key? key,
    required this.context,
    this.iconData,
    this.iconSize,
    required this.text,
    this.fontSize = 18.0,
    required this.onTap,
    this.padding,
    this.margin,
  })  : buttonColor = Theme.of(context).primaryColor,
        iconColor = Colors.white,
        textColor = Colors.white,
        super(key: key);

  SkywaElevatedButton.delete({
    Key? key,
    required this.context,
    this.iconData,
    this.iconSize,
    required this.text,
    this.fontSize = 18.0,
    required this.onTap,
    this.padding,
    this.margin,
  })  : buttonColor = Theme.of(context).errorColor,
        iconColor = Colors.white,
        textColor = Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            // constraints: BoxConstraints(maxWidth: Device.screenWidth * 0.90),
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            margin: margin ?? const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                if (iconData != null)
                  Icon(
                    iconData,
                    color: iconColor,
                    size: iconSize ?? IconTheme.of(context).size,
                  ),
                if (iconData != null) const SizedBox(width: 10.0),
                SkywaText(
                  text: text,
                  fontSize: fontSize,
                  color: textColor,
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
