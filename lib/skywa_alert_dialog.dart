import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import 'services/is_string_invalid.dart';
import 'skywa_text.dart';

class SkywaAlertDialog {
  final BuildContext context;
  final bool barrierDismissible;
  final String titleText;
  final EdgeInsetsGeometry? titlePadding;
  final double fontSize;
  final Widget content;
  final Color color;
  final Widget? icon;
  final List<Widget>? actions;

  SkywaAlertDialog.success({
    required this.context,
    this.barrierDismissible = true,
    this.titleText = '',
    this.titlePadding,
    this.fontSize = 18.0,
    required this.content,
    this.icon,
    this.actions,
  }) : color = Theme.of(context).primaryColor {
    displayAlertDialog();
  }

  SkywaAlertDialog.info({
    required this.context,
    this.barrierDismissible = true,
    this.titleText = '',
    this.titlePadding,
    this.fontSize = 18.0,
    required this.content,
    this.icon,
    this.actions,
  }) : color = Theme.of(context).colorScheme.secondary {
    displayAlertDialog();
  }

  SkywaAlertDialog.error({
    required this.context,
    this.barrierDismissible = true,
    this.titleText = '',
    this.titlePadding,
    this.fontSize = 18.0,
    required this.content,
    this.icon,
    this.actions,
  }) : color = Theme.of(context).errorColor {
    displayAlertDialog();
  }

  void displayAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0.0),
            titlePadding: const EdgeInsets.all(0.0),
            title: !isStringInvalid(text: titleText)
                ? Container(
                    width: Device.screenWidth * 0.65,
                    padding: titlePadding ??
                        EdgeInsets.only(
                          top: Device.screenHeight * 0.01,
                          bottom: Device.screenHeight * 0.01,
                          left: Device.screenWidth * 0.05,
                          right: Device.screenWidth * 0.01,
                        ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: icon == null
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SkywaText(
                            titleText,
                            fontSize: fontSize,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (icon != null) icon!,
                      ],
                    ),
                  )
                : Container(),
            content: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: isStringInvalid(text: titleText)
                      ? const Radius.circular(12.0)
                      : const Radius.circular(0.0),
                  topRight: isStringInvalid(text: titleText)
                      ? const Radius.circular(12.0)
                      : const Radius.circular(0.0),
                  bottomLeft: const Radius.circular(12.0),
                  bottomRight: const Radius.circular(12.0),
                ),
              ),
              child: content,
            ),
            actions: actions,
          );
        });
  }
}
