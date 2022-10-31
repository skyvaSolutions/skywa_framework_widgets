import 'package:flutter/material.dart';

import 'skywa_text.dart';

class SkywaAppBar extends StatelessWidget {
  final String appbarText;
  final bool centerTitle;
  IconButton? backIconButton;
  final double? size;
  final List<Widget>? actions;

  SkywaAppBar({
    Key? key,
    this.appbarText = '',
    this.centerTitle = true,
    this.backIconButton,
    this.size,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (backIconButton == null && Navigator.canPop(context)) {
      backIconButton = IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          Navigator.canPop(context) ? Navigator.pop(context) : null;
        },
      );
    }

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      elevation: 0.0,
      backgroundColor: Theme.of(context).primaryColor,
      leading: backIconButton,
      title: SkywaText(
        appbarText,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      actions: actions ?? [],
    );
  }
}
