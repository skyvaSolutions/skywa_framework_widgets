import 'dart:ui';

import 'package:flutter/material.dart';

import 'skywa_text.dart';

class SkywaGlassMorphicLoader extends StatelessWidget {
  final String text;
  final double height;
  final double width;

  const SkywaGlassMorphicLoader({
    Key? key,
    required this.text,
    this.height = 100.0,
    this.width = 300.0,
  })  : assert(text != 'null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.transparent),
        ),
        Container(
          alignment: Alignment.center,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  width: 2.0,
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                      color: Theme.of(context).primaryColorDark),
                  const SizedBox(height: 10.0),
                  SkywaText(
                    text,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
