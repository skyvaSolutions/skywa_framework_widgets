import 'package:flutter/material.dart';

class SkywaChoiceChipGroup extends StatefulWidget {
  final List choiceChips;
  final ValueChanged onSelected;
  final String selectedValue;
  final double fontSize;
  final WrapAlignment wrapAlignment;
  final Color backgroundColor;
  final double spacing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? labelPadding;

  const SkywaChoiceChipGroup({
    Key? key,
    required this.choiceChips,
    required this.selectedValue,
    required this.onSelected,
    this.fontSize = 17.0,
    this.wrapAlignment = WrapAlignment.spaceEvenly,
    this.backgroundColor = Colors.black12,
    this.spacing = 8.0,
    this.padding,
    this.labelPadding,
  }) : super(key: key);

  @override
  State<SkywaChoiceChipGroup> createState() => _SkywaChoiceChipGroupState();
}

class _SkywaChoiceChipGroupState extends State<SkywaChoiceChipGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('TODO: NULL SAFETY'),
    );
    /*return ChipsChoice<String>.single(
      value: widget.selectedValue,
      wrapped: true,
      choiceActiveStyle: C2ChoiceStyle(
        pressElevation: 20.0,
        elevation: 3.0,
      ),
      padding: widget.padding != null ? widget.padding : EdgeInsets.all(8.0),
      alignment: widget.wrapAlignment,
      spacing: widget.spacing,
      choiceStyle: C2ChoiceStyle(
        elevation: 3.0,
        pressElevation: 20.0,
        labelPadding: widget.labelPadding != null
            ? widget.labelPadding
            : EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      ),
      onChanged: widget.onSelected,
      choiceItems: C2Choice.listFrom(
        source: widget.choiceChips,
        value: (chipIndex, chipLabel) => chipLabel,
        label: (chipIndex, chipLabel) => chipLabel,
      ),
    );*/
  }
}
