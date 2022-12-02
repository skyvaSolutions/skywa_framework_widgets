import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/services/is_string_invalid.dart';

import 'skywa_text.dart';

class SkywaSwitch extends StatelessWidget {
  final bool value;
  final String title;
  final int maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final ValueChanged<bool> onChanged;

  const SkywaSwitch({
    Key? key,
    required this.value,
    this.maxLines = 1,
    required this.onChanged,
    this.title = '',
    this.fontSize = 18.0,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isStringInvalid(text: title)
        ? SwitchListTile(
            value: value,
            onChanged: onChanged,
            activeColor: Theme.of(context).primaryColor,
            title: SkywaText(
              title,
              maxLines: maxLines,
              fontSize: fontSize ?? 18.0,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
          )
        : Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Theme.of(context).primaryColor,
          );
  }
}
