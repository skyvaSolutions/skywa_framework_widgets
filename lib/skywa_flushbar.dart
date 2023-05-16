import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'services/is_string_invalid.dart';
import 'skywa_text.dart';

class SkywaFlushBar {
  final BuildContext context;
  final String flushBarTitle;
  final String flushBarMessage;
  final double? fontSize;
  final int durationInSeconds;
  final Color color;
  final Color titleColor;
  final Color messageColor;
  final IconData icon;
  final double? iconSize;
  final FlushbarPosition flushBarPosition;
  final FlushbarStyle flushBarStyle;

  // final bool isDismissible;
  // final FlushbarDismissDirection flushBarDismissDirection;
  final Function(FlushbarStatus)? onStatusChanged;

  SkywaFlushBar.success({
    required this.context,
    required this.flushBarTitle,
    required this.flushBarMessage,
    this.fontSize,
    this.durationInSeconds = 2,
    this.iconSize,
    this.flushBarPosition = FlushbarPosition.BOTTOM,
    this.flushBarStyle = FlushbarStyle.GROUNDED,
    // this.isDismissible = true,
    // this.flushBarDismissDirection = FlushbarDismissDirection.VERTICAL,
    this.onStatusChanged,
  })  : color = Theme.of(context).primaryColor,
        titleColor = Colors.white,
        messageColor = Colors.grey.shade300,
        icon = Icons.check_rounded,
        assert(!isStringInvalid(text: flushBarTitle)) {
    displaySkywaFlushBar();
  }

  SkywaFlushBar.info({
    required this.context,
    required this.flushBarTitle,
    required this.flushBarMessage,
    this.fontSize,
    this.durationInSeconds = 2,
    this.iconSize,
    this.flushBarPosition = FlushbarPosition.BOTTOM,
    this.flushBarStyle = FlushbarStyle.GROUNDED,
    // this.isDismissible = true,
    // this.flushBarDismissDirection = FlushbarDismissDirection.VERTICAL,
    this.onStatusChanged,
  })  : color = Theme.of(context).colorScheme.secondary,
        titleColor = Colors.white,
        messageColor = Colors.grey.shade300,
        icon = Icons.info,
        assert(!isStringInvalid(text: flushBarTitle)) {
    displaySkywaFlushBar();
  }

  SkywaFlushBar.error({
    required this.context,
    required this.flushBarTitle,
    required this.flushBarMessage,
    this.fontSize,
    this.durationInSeconds = 2,
    this.iconSize,
    this.flushBarPosition = FlushbarPosition.BOTTOM,
    this.flushBarStyle = FlushbarStyle.GROUNDED,
    // this.isDismissible = true,
    // this.flushBarDismissDirection = FlushbarDismissDirection.VERTICAL,
    this.onStatusChanged,
  })  : color = Theme.of(context).colorScheme.error,
        titleColor = Colors.white,
        messageColor = Colors.grey.shade300,
        icon = Icons.close_rounded,
        assert(!isStringInvalid(text: flushBarTitle)) {
    displaySkywaFlushBar();
  }

  void displaySkywaFlushBar() {
    Flushbar(
      // title: flushBarTitle,
      // message: flushBarMessage,
      titleText: SkywaText(
        flushBarTitle,
        color: titleColor,
        fontSize: fontSize ?? 18.0,
        fontWeight: FontWeight.bold,
      ),
      messageText: SkywaText(
        flushBarMessage,
        color: messageColor,
        fontSize: fontSize ?? 18 - 3,
      ),
      duration: Duration(seconds: durationInSeconds),
      backgroundColor: color,
      flushbarStyle: flushBarStyle,
      flushbarPosition: flushBarPosition,
      onStatusChanged: (FlushbarStatus? value) =>
          onStatusChanged != null ? onStatusChanged!(value!) : null,
      icon: Icon(icon, size: iconSize, color: titleColor),
    ).show(context);
  }
}

/** DEMO / SAMPLE USE
    SkywaFlushBar.error(
    context: context,
    flushBarTitle: 'Hello',
    flushBarMessage: 'message',
    // onStatusChanged: (FlushbarStatus? value) {
    //   printInConsole(value?.index);
    // }
    ),
 */
