import 'package:flutter/material.dart';

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
  final bool isEnabled;

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
    this.isEnabled = true,
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
    this.isEnabled = true,
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
    this.isEnabled = true,
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
    this.isEnabled = true,
  })  : buttonColor = Theme.of(context).errorColor,
        iconColor = Colors.white,
        textColor = Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return iconData != null
        ? Container(
            padding: margin ?? EdgeInsets.zero,
            child: ElevatedButton.icon(
              onPressed: isEnabled ? onTap : null,
              style: ElevatedButton.styleFrom(
                padding: padding ??
                    const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                backgroundColor: isEnabled ? buttonColor : Colors.grey.shade300,
              ),
              icon: Icon(
                iconData,
                color: iconColor,
                size: iconSize ?? IconTheme.of(context).size,
              ),
              label: SkywaText(
                text,
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : Container(
            padding: margin ?? EdgeInsets.zero,
            child: ElevatedButton(
              onPressed: isEnabled ? onTap : null,
              style: ElevatedButton.styleFrom(
                padding: padding ??
                    const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                backgroundColor: isEnabled ? buttonColor : Colors.grey.shade300,
              ),
              child: SkywaText(
                text,
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
  }
}
