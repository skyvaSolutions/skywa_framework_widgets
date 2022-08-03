import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkywaListWheelScrollView extends StatelessWidget {
  final double itemExtent;
  final double width;
  final double perspective;
  final double squeeze;
  final double diameterRatio;
  final bool useMagnifier;
  final double magnification;
  final double offAxisFraction;
  final List<Widget> bodies;
  final ValueChanged<int> onSelectedItemChanged;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;

  const SkywaListWheelScrollView({
    Key? key,
    this.itemExtent = 100.0,
    this.width = 100.0,
    this.perspective = 0.005,
    this.squeeze = 0.9,
    this.diameterRatio = 2.0,
    this.useMagnifier = false,
    this.magnification = 0.001,
    this.offAxisFraction = 0.0,
    required this.bodies,
    required this.onSelectedItemChanged,
    this.padding,
    this.decoration,
  })  : assert(perspective >= 0.0 && perspective <= 0.01,
            'perspective value must be greater than 0 & less than equal to 0.01'),
        assert(squeeze > 0, 'squeeze value always takes positive value'),
        assert(diameterRatio > 0,
            'diameterRatio value always takes positive value'),
        assert(useMagnifier ? magnification > 0.001 : true,
            'useMagnifier value is true, magnification value can\'t be null or less than or equal to 0.001'),
        super(key: key);

  /*
    1. itemExtent: height of each child
    2. perspective: radius of the circle, value must be 0.001 & 0.01, lesser value makes the circle flat/decreases the radius of the circle
    3. squeeze: controls the compactness of the child  widgets in the wheel, lesser squeeze results increase in distance between two elements
    4. diameterRatio: controls the diameter of the circle, determines the ratio between the size of the wheel and the size of viewport
    5. useMagnifier: controls center element magnification based on the bool value
    6. magnification: the center element will be zoomed by that factor and vice-versa
    7. offAxisFraction: controls how the wheel is horizontally off-center
  */

  @override
  Widget build(BuildContext context) {
    FixedExtentScrollController? _scrollListViewController;

    return ListWheelScrollView.useDelegate(
      controller: _scrollListViewController,
      itemExtent: itemExtent,
      physics: FixedExtentScrollPhysics(),
      perspective: perspective,
      onSelectedItemChanged: onSelectedItemChanged,
      squeeze: squeeze,
      offAxisFraction: offAxisFraction,
      useMagnifier: useMagnifier,
      magnification: magnification,
      diameterRatio: diameterRatio,
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: bodies.length,
        builder: (BuildContext context, int index) {
          return Container(
            width: width,
            decoration: decoration,
            alignment: Alignment.center,
            padding: padding ?? EdgeInsets.all(16.0),
            child: bodies[index],
          );
        },
      ),
    );
  }
}
