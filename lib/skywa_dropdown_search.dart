/*import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_bottom_sheet.dart';

import 'models/skywa_checkbox_model.dart';
import 'skywa_text.dart';
import 'skywa_textformfield.dart';

class SkywaDropdownSearch {
  final BuildContext context;
  final String sheetTitle;
  final TextEditingController searchController;
  final String labelText;
  final String hintText;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final bool showDecoration;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget itemsListView;

  SkywaDropdownSearch({
    Key? key,
    required this.context,
    this.sheetTitle = '',
    required this.searchController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    required this.onChanged,
    this.padding,
    this.contentPadding,
    this.enabled = true,
    this.showDecoration = true,
    this.prefixIcon,
    this.suffixIcon,
    required this.itemsListView,
  }) {
    displayBottomSheet();
  }

  void displayBottomSheet() {
    SkywaBottomSheet(
      context: context,
      isScrollControlled: true,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// sheet title
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            child: SkywaText(
              text: sheetTitle,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          /// search textformfield
          Container(
            margin: const EdgeInsets.only(
              left: 8.0,
              bottom: 10.0,
              right: 8.0,
              top: 4.0,
            ),
            child: SkywaTextFormField.name(
              textEditingController: searchController,
              labelText: labelText,
              hintText: hintText,
              suffixIcon: suffixIcon,
              onChanged: onChanged,
            ),
          ),

          /// list of items
          itemsListView,
        ],
      ),
    );
  }
}
*/