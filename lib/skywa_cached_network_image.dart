import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'services/is_string_invalid.dart';
import 'skywa_auto_size_text.dart';

class SkywaCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool showRoundedCorner;
  final Widget roundedWidget;
  final double borderRadius;

  SkywaCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.padding,
  })  : showRoundedCorner = false,
        roundedWidget = Container(),
        borderRadius = 0.0,
        assert(!isStringInvalid(text: imageUrl)),
        super(key: key);

  SkywaCachedNetworkImage.clipRRect({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.padding,
    this.borderRadius = 12.0,
  })  : showRoundedCorner = true,
        roundedWidget = const ClipRRect(),
        assert(!isStringInvalid(text: imageUrl)),
        super(key: key);

  /// NOTE: no chance to get any placeholder or error widget for circle avatar
  SkywaCachedNetworkImage.circleAvatar({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.padding,
    this.fit = BoxFit.cover,
  })  : showRoundedCorner = true,
        roundedWidget = const CircleAvatar(),
        borderRadius = 0.0,
        assert(!isStringInvalid(text: imageUrl)),
        assert(height != null),
        assert(width != null),
        super(key: key);

  Widget buildCachedNetworkImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/image-placeholder.png',
                height: height,
                width: width,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: height,
              width: width,
              child: LinearProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Colors.grey.withOpacity(0.5)),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        );
      },
      errorWidget: (context, url, error) {
        return Image.asset(
          'assets/images/warning.png',
          width: width,
          height: height,
          fit: BoxFit.contain,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (roundedWidget is ClipRRect) {
      widget = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: buildCachedNetworkImage(),
      );
    } else if (roundedWidget is CircleAvatar) {
      widget = Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: fit,
          ),
        ),
      );
    } else {
      widget = const SkywaAutoSizeText(
        text: 'Something went wrong',
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
      );
    }

    return showRoundedCorner
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height,
                padding: padding ?? const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  // color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: widget,
              ),
            ],
          )
        : buildCachedNetworkImage();
  }
}
