import 'package:flutter/material.dart';

class SkywaFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Function onTap;

  const SkywaFloatingActionButton({
    required this.iconData,
    this.iconSize = 45.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade100,
      ),
      child: IconButton(
        onPressed: () => onTap(),
        iconSize: iconSize,
        icon: Icon(iconData, color: Theme.of(context).primaryColor),
      ),
    );
  }
}
