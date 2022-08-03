import 'package:flutter/material.dart';

class SkywaSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double minValue;
  final double maxValue;
  final bool allowDivisions;

  SkywaSlider({
    required this.value,
    required this.onChanged,
    this.minValue = 1.0,
    required this.maxValue,
    this.allowDivisions = false,
  });

  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
      value: value,
      onChanged: onChanged,
      label: value.toString(),
      activeColor: Theme.of(context).primaryColor,
      inactiveColor: Colors.grey.shade600,
      divisions: allowDivisions ? (maxValue - minValue).round() : null,
      thumbColor: Theme.of(context).primaryColor,
      min: minValue,
      max: maxValue,
    );
  }
}
