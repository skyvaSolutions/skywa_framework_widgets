import 'package:flutter/material.dart';

import 'services/is_string_invalid.dart';
import 'skywa_text.dart';

class SkywaDropdownButton extends StatelessWidget {
  final List<dynamic> items;
  final ValueChanged onChanged;
  final String hintText;
  final bool isExpanded;
  final bool isDense;
  final String selectedValue;
  final EdgeInsetsGeometry? contentPadding;
  final double elevation;
  final bool showUnderLine;
  final Color textColor;

  const SkywaDropdownButton({
    Key? key,
    required this.items,
    required this.onChanged,
    this.hintText = '',
    this.isExpanded = true,
    this.isDense = false,
    required this.selectedValue,
    this.contentPadding,
    this.elevation = 0.0,
    this.showUnderLine = true,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Container(
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              contentPadding: contentPadding ?? EdgeInsets.all(10.0),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Theme.of(context).errorColor,
                  width: 2.0,
                ),
              ),
            ),
            isEmpty: !isStringInvalid(text: selectedValue),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(15.0),
                value: isStringInvalid(text: selectedValue)
                    ? items[0]
                    : selectedValue,
                isExpanded: isExpanded,
                isDense: isDense,
                items: items.map((newValue) {
                  return DropdownMenuItem<String>(
                    value: newValue,
                    child: SkywaText(text: newValue.toString()),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          );
        },
      ),
    );*/
    return Material(
      elevation: elevation,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return DropdownButton<String>(
              underline: showUnderLine ? null : SizedBox(),
              value: isStringInvalid(text: selectedValue)
                  ? items[0]
                  : selectedValue,
              isExpanded: isExpanded,
              isDense: isDense,
              items: items.map((newValue) {
                return DropdownMenuItem<String>(
                  value: newValue,
                  child: SkywaText(text: newValue.toString(), color: textColor),
                );
              }).toList(),
              onChanged: onChanged,
            );
          },
        ),
      ),
    );
  }
}
