import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import 'services/is_string_invalid.dart';

class SkywaSnackBar {
  final BuildContext context;
  final String snackBarText;
  final double? fontSize;
  final String? actionText;
  final Function()? action;
  final int durationInSeconds;
  final Color color;
  final IconData icon;
  final double? iconSize;

  SkywaSnackBar.success({
    required this.context,
    required this.snackBarText,
    this.fontSize,
    this.action,
    this.actionText,
    this.durationInSeconds = 2,
    this.iconSize,
  })  : color = Theme.of(context).primaryColor,
        icon = Icons.check_rounded,
        assert(!isStringInvalid(text: snackBarText)) {
    displaySkywaSnackBar();
  }

  SkywaSnackBar.info({
    required this.context,
    required this.snackBarText,
    this.fontSize,
    this.action,
    this.actionText,
    this.durationInSeconds = 2,
    this.iconSize,
  })  : color = Theme.of(context).colorScheme.secondary,
        icon = Icons.info,
        assert(!isStringInvalid(text: snackBarText)) {
    displaySkywaSnackBar();
  }

  SkywaSnackBar.error({
    required this.context,
    required this.snackBarText,
    this.fontSize,
    this.action,
    this.actionText,
    this.durationInSeconds = 2,
    this.iconSize,
  })  : color = Theme.of(context).errorColor,
        icon = Icons.close_rounded,
        assert(!isStringInvalid(text: snackBarText)) {
    displaySkywaSnackBar();
  }

  void displaySkywaSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          width: Device.screenWidth,
          child: Row(
            children: [
              /// icon
              Icon(
                icon,
                color: Colors.white,
                size: iconSize ?? IconTheme.of(context).size,
              ),
              SizedBox(width: 10.0),

              /// snackbar text
              /*SkywaAutoSizeText(
                text: snackbarText,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),*/
              Text(snackBarText),
            ],
          ),
        ),
        elevation: 0.0,
        duration: Duration(seconds: durationInSeconds),
        action: actionText != null
            ? SnackBarAction(
                textColor: Colors.white,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  action!();
                },
                label: actionText!,
              )
            : null,
        backgroundColor: color,
      ),
    );
  }
}
