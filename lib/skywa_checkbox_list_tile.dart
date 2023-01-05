import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;

  SkywaCheckboxListTile({
    Key? key,
    required this.title,
    this.subTitle = '',
    this.fontSize = 17.0,
    required this.isSelected,
    required this.onChanged,
    this.direction = Axis.horizontal,
    this.margin,
    this.contentPadding,
  })  : assert(!isStringInvalid(text: title)),
        super(key: key);

  @override
  _SkywaCheckboxListTileState createState() => _SkywaCheckboxListTileState();
}

class _SkywaCheckboxListTileState extends State<SkywaCheckboxListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: widget.margin ?? const EdgeInsets.all(10.0),
      child: widget.direction == Axis.horizontal
          ? CheckboxListTile(
              value: widget.isSelected,
              selected: widget.isSelected,
              title: SkywaText(
                widget.title,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w400,
                maxLines: 1,
              ),
        subtitle: !isStringInvalid(text: widget.subTitle)
            ? SkywaText(
          widget.subTitle,
          fontSize: widget.fontSize - 1.0,
          fontWeight: FontWeight.w300,
          maxLines: 2,
        )
            : null,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: MediaQuery
                .of(context)
                .size
                .width * 0.05),
        activeColor: Theme
            .of(context)
            .primaryColor,
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
                SkywaText(widget.title),
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
