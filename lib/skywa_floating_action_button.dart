import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/services/is_string_invalid.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SkywaFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Function onTap;
  final String text;
  final String? toolTip;

  const SkywaFloatingActionButton({
    super.key,
    required this.iconData,
    this.iconSize = 45.0,
    required this.onTap,
    this.text = '',
    this.toolTip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      padding: !isStringInvalid(text: text)
          ? const EdgeInsets.all(12.0)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        shape:
            !isStringInvalid(text: text) ? BoxShape.rectangle : BoxShape.circle,
        color: !isStringInvalid(text: text)
            ? Theme.of(context).primaryColor
            : Colors.grey.shade100,
        borderRadius:
            !isStringInvalid(text: text) ? BorderRadius.circular(20.0) : null,
      ),
      child: !isStringInvalid(text: text)
          ? InkWell(
              onTap: () => onTap(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(iconData, color: Colors.white),
                  const SizedBox(width: 10.0),
                  SkywaText(text),
                ],
              ),
            )
          : IconButton(
              onPressed: () => onTap(),
              iconSize: iconSize,
              icon: Icon(iconData, color: Theme.of(context).primaryColor),
            ),
    );
  }
}
