import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SkywaLoader extends StatefulWidget {
  const SkywaLoader({Key? key}) : super(key: key);

  @override
  _SkywaLoaderState createState() => _SkywaLoaderState();
}

class _SkywaLoaderState extends State<SkywaLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController? _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController!.addListener(() {
      if (_animationController!.value == 1) {
        _animationController!.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_animationController != null) _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/jsons/skywa_loader.json',
        controller: _animationController,
        onLoaded: (composition) {
          _animationController!
            ..duration = composition.duration
            ..forward()
            ..repeat();
        },
        fit: BoxFit.contain,
        height: MediaQuery.of(context).size.height * 0.50,
        width: MediaQuery.of(context).size.height * 0.50,
        repeat: true,
        animate: true,
      ),
    );
  }
}
