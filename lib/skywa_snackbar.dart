import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'services/is_string_invalid.dart';

class SkywaSnackBar {
  final BuildContext context;
  final String snackbarText;
  final double? fontSize;
  final String? actionText;
  final Function()? action;
  final int durationInSeconds;
  final Color color;
  final IconData icon;
  final double? iconSize;

  SkywaSnackBar.success({
    required this.context,
    required this.snackbarText,
    this.fontSize,
    this.action,
    this.actionText,
    this.durationInSeconds = 2,
    this.iconSize,
  })  : color = Theme.of(context).primaryColor,
        icon = MaterialCommunityIcons.check,
        assert(context != null),
        assert(!isStringInvalid(text: snackbarText)) {
    displaySkywaSnackBar();
  }

  SkywaSnackBar.info({
    required this.context,
    required this.snackbarText,
    this.fontSize,
    this.action,
    this.actionText,
    this.durationInSeconds = 2,
    this.iconSize,
  })  : color = Theme.of(context).splashColor,
        icon = Octicons.info,
        assert(context != null),
        assert(!isStringInvalid(text: snackbarText)) {
    displaySkywaSnackBar();
  }

  SkywaSnackBar.error({
    required this.context,
    required this.snackbarText,
    this.fontSize,
    this.action,
    this.actionText,
    this.durationInSeconds = 2,
    this.iconSize,
  })  : color = Theme.of(context).errorColor,
        icon = MaterialCommunityIcons.close,
        assert(context != null),
        assert(!isStringInvalid(text: snackbarText)) {
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
              Text(snackbarText),
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
