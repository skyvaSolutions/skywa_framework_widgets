import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SkywaRichText extends StatelessWidget {
  final List<String> texts;
  final List<TextStyle> textStyles;
  final List<Function()>? onTaps;
  final TextAlign textAlign;

  const SkywaRichText({
    Key? key,
    required this.texts,
    required this.textStyles,
    this.onTaps,
    this.textAlign = TextAlign.start,
  })  : assert(texts.length != 0),
        assert(textStyles.length != 0),
        assert(onTaps != null ? onTaps.length <= texts.length : true),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        text: texts[0],
        style: textStyles[0],
        children: List.generate(texts.length - 1, (index) {
          return TextSpan(
            text: texts[index + 1],
            style: textStyles.length >= 0 ? textStyles[index + 1] : TextStyle(),
            recognizer: TapGestureRecognizer()
              ..onTap = onTaps == null ? null : onTaps![index],
          );
        }),
      ),
    );
  }
}
