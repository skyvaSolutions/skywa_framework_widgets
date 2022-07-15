import 'package:flutter/material.dart';

import 'services/is_string_invalid.dart';
import 'skywa_text.dart';

class SkywaSwitch extends StatelessWidget {
  final bool value;
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final ValueChanged<bool> onChanged;

  SkywaSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.fontSize = 18.0,
    this.fontWeight,
  })  : assert(!isStringInvalid(text: title)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
      title: SkywaText(
        text: title,
        fontSize: fontSize ?? 18.0,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
