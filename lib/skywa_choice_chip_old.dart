/*
import 'package:flutter/material.dart';

class ChipData {
  String chipText;
  bool isSelected;

  ChipData({this.chipText, this.isSelected = true});
}

class SkywaChip extends StatefulWidget {
  SkywaChip.choiceChip(
      {Key key, @required this.chipTextList, @required this.onChanged})
      : super(key: key) {
    chipData = [];
    chipTextList.map((text) => chipData.add(ChipData(chipText: text)));
  }
  final List<String> chipTextList;
  List<ChipData> chipData;
  final ValueChanged<String> onChanged;

  @override
  State<SkywaChip> createState() => _SkywaChipState();
}

class _SkywaChipState extends State<SkywaChip> {
  @override
  Widget build(BuildContext context) {
    print(widget.chipTextList);
    return Container(
      child: Wrap(
        spacing: 5.0,
        children: widget.chipTextList
            .map((chip) => ChoiceChip(
                  selectedColor: Colors.grey[300],
                  label: Text(chip),
                  selected: false,
                  onSelected: (isSelected) {
                    print('Is selected: $isSelected for $chip');
                    if (isSelected) {
                      widget.onChanged(chip);
                    }
                  },
                ))
            .toList(),
      ),
    );
  }
}
*/
