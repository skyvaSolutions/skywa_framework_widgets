import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_auto_size_text.dart';

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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.1,
      ),
      shrinkWrap: true,
      itemCount: widget.choiceChips.length,
      itemBuilder: (BuildContext context, int index) {
        return ChoiceChip(
          label: SkywaAutoSizeText(
            text: widget.choiceChips[index],
            fontSize: widget.fontSize,
            color: Colors.black,
          ),
          selected: widget.selectedValue == widget.choiceChips[index],
          onSelected: widget.onSelected,
          backgroundColor: widget.backgroundColor,
          selectedColor: Theme.of(context).primaryColor,
        );
      },
    );
  }
}
