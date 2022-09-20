import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

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
                    color: Colors.white,
                    size: iconSize ?? IconTheme.of(context).size,
                  ),
                if (iconData != null) const SizedBox(width: 10.0),
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
