import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import 'services/is_string_invalid.dart';
import 'skywa_auto_size_text.dart';
import 'skywa_text.dart';

class SkywaCheckboxListTile extends StatefulWidget {
  final String title;
  final String subTitle;
  final double fontSize;
  final bool isSelected;
  final ValueChanged<bool?>? onChanged;
  final Axis direction;

  SkywaCheckboxListTile({
    Key? key,
    required this.title,
    this.subTitle = '',
    this.fontSize = 17.0,
    required this.isSelected,
    required this.onChanged,
    this.direction = Axis.horizontal,
  })  : assert(!isStringInvalid(text: title)),
        super(key: key);

  @override
  _SkywaCheckboxListTileState createState() => _SkywaCheckboxListTileState();
}

class _SkywaCheckboxListTileState extends State<SkywaCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Device.screenWidth,
      margin: const EdgeInsets.all(10.0),
      child: widget.direction == Axis.horizontal
          ? CheckboxListTile(
              value: widget.isSelected,
              selected: widget.isSelected,
              title: SkywaText(
                text: widget.title,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w400,
                maxLines: 1,
              ),
              subtitle: SkywaText(
                text: widget.subTitle,
                fontSize: widget.fontSize - 1.0,
                fontWeight: FontWeight.w300,
                maxLines: 2,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: Device.screenWidth * 0.05),
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              onChanged: widget.onChanged!,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Checkbox(
                  value: widget.isSelected,
                  onChanged: widget.onChanged!,
                  checkColor: Colors.white,
                  activeColor: Theme.of(context).primaryColor,
                ),
                SkywaText(text: widget.title),
                if (!isStringInvalid(text: widget.subTitle))
                  SkywaAutoSizeText(
                    text: widget.subTitle,
                    fontSize: widget.fontSize - 1.0,
                    fontWeight: FontWeight.w300,
                    maxLines: 2,
                  ),
              ],
            ),
    );
  }
}