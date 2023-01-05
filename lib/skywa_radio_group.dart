import 'package:flutter/material.dart';

import 'skywa_text.dart';

class SkywaRadioGroup extends StatefulWidget {
  final List<String> texts;
  final double? width;
  final double fontSize;
  final ValueChanged<String> onChanged;
  final String? selectedValue;
  final WrapAlignment wrapAlignment;
  final Color? backgroundColor;
  final double spacing;
  final EdgeInsets? margin;

  const SkywaRadioGroup({
    Key? key,
    required this.texts,
    this.width,
    this.fontSize = 17.0,
    required this.onChanged,
    this.selectedValue,
    this.wrapAlignment = WrapAlignment.spaceAround,
    this.backgroundColor,
    this.spacing = 8.0,
    this.margin,
  }) : super(key: key);

  @override
  State<SkywaRadioGroup> createState() => _SkywaRadioGroupState();
}

class _SkywaRadioGroupState extends State<SkywaRadioGroup> {
  late List<String> texts;
  late String selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    texts = widget.texts;
    selectedValue = widget.selectedValue ?? widget.texts[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: widget.margin ?? const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: widget.backgroundColor == null
            ? [
                /// bottom right
                BoxShadow(
                  offset: const Offset(5, 5),
                  spreadRadius: 2.0,
                  blurRadius: 6.0,
                  color: Colors.grey.shade300,
                ),

                /// top left
                BoxShadow(
                  offset: const Offset(-5, -5),
                  spreadRadius: 5.0,
                  blurRadius: 2.0,
                  color: Colors.grey.shade200,
                ),
              ]
            : [],
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: widget.wrapAlignment,
        spacing: widget.spacing,
        children: [
          for (int i = 0; i < widget.texts.length; i++)
            Container(
              width: widget.width ?? MediaQuery.of(context).size.width * 0.40,
              alignment: Alignment.center,
              child: RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: widget.texts[i],
                visualDensity: VisualDensity.adaptivePlatformDensity,
                activeColor: Theme.of(context).primaryColor,
                title: SkywaText(
                  widget.texts[i],
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w400,
                ),
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value.toString();
                    widget.onChanged(value.toString());
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}
