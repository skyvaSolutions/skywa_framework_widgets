import 'package:flutter/material.dart';

class SkywaBottomSheet {
  final BuildContext context;
  final bool isDismissible;
  final bool isScrollControlled;
  final Color color;
  final Widget content;
  final EdgeInsetsGeometry? contentPadding;

  SkywaBottomSheet({
    required this.context,
    this.isDismissible = true,
    this.isScrollControlled = false,
    this.color = Colors.white,
    required this.content,
    this.contentPadding,
  }) {
    displayBottomSheet();
  }

  void displayBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          padding: contentPadding ??
              EdgeInsets.only(
                top: 10.0,
                right: 10.0,
                left: 10.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
          ),
          child: content,
        );
      },
    );
  }
}
