import 'package:flutter/material.dart';

import 'skywa_text.dart';

class SkywaOutlinedButton extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final double? iconSize;
  final Color iconColor;
  final Function() onTap;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const SkywaOutlinedButton({
    Key? key,
    required this.text,
    this.iconData,
    this.iconSize,
    this.iconColor = Colors.black,
    required this.onTap,
    this.borderColor,
    this.padding,
    this.margin,
    this.textColor = Colors.black,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return iconData != null
        ? Column(
            children: [
              OutlinedButton.icon(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  padding: padding ??
                      const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
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
            ],
          )
        : Column(
            children: [
              OutlinedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  padding: padding ??
                      const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 25.0,
                      ),
                ),
                child: SkywaText(
                  text,
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
    /*GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: padding ??
                const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
            margin: margin ?? const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                  color: borderColor ?? Theme.of(context).primaryColor),
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
                  text,
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: fontWeight,
                ),
              ],
            ),
          ),
        ],
      ),
    );*/
  }
}
