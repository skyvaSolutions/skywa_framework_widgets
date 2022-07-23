import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

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
      margin: EdgeInsets.all(Device.screenHeight * 0.02),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade100,
        boxShadow: [
          /// bottom right
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {
          onTap();
        },
        iconSize: iconSize,
        icon: Icon(iconData, color: Theme.of(context).primaryColor),
      ),
    );
  }
}
