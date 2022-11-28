import 'package:flutter/material.dart';

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
    return SwitchListTile.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
      title: SkywaText(
        title,
        maxLines: maxLines,
        fontSize: fontSize ?? 18.0,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
