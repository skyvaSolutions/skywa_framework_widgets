import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'skywa_cupertino_date_time_picker.dart';
import 'skywa_text.dart';

class SkywaTextFormField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final String labelText;
  final String hintText;
  final String? errorText;
  final Color? textColor;
  final Color? cursorColor;
  final Color? labelColor;
  final Color? hintColor;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final int minLines;
  final int maxLines;
  final bool autofocus;
  final bool showDecoration;
  final Function()? onTap;
  // final Function(String)? validator;
  FormFieldValidator<String>? validator;
  ValueChanged<DateTime>? onDateTimeChanged;
  DateTime? initialDateTime;
  DateTime? minimumDate;
  DateTime? maximumDate;
  int? minimumYear;
  int? maximumYear;
  int? maxDigitsLength;
  bool? allowDecimal;
  int? postDecimalLength;
  bool? isObscure;

  /// Optimize for textual information.
  ///
  /// Requests the default platform keyboard.
  SkywaTextFormField.text({
    super.key,
    this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
  })  : textCapitalization = TextCapitalization.sentences,
        assert(labelText != 'null');

  /// Optimize for textual information.
  ///
  /// Requests the default platform keyboard.
  SkywaTextFormField.password({
    super.key,
    this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.isObscure = true,
  })  : keyboardType = TextInputType.visiblePassword,
        textCapitalization = TextCapitalization.sentences,
        assert(labelText != 'null');

  /// Optimize for multiline textual information.
  ///
  /// Requests the default platform keyboard, but accepts newlines when the
  /// enter key is pressed. This is the input type used for all multiline text
  /// fields.
  SkywaTextFormField.multiline({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 5,
    this.maxLines = 20000,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
  })  : keyboardType = TextInputType.multiline,
        textCapitalization = TextCapitalization.sentences,
        assert(textEditingController != null),
        assert(minLines <= maxLines,
            'minLines value can\'t be greater than maxLines value'),
        assert(labelText != 'null');

  /* NOT REQUIRED */
  /*SkywaTextFormField.number({
    @required this.textEditingController,
    // this.width,
    // this.height,
    @required this.labelText,
    @required this.hintText,
    this.contentPadding,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
  })  : keyboardType = TextInputType.number,
        textCapitalization = TextCapitalization.none,
        assert(!isStringInvalid(text: labelText)),
        assert(!isStringInvalid(text: hintText));*/

  /// Optimize for unsigned numerical information without a decimal point.
  ///
  /// Requests a default keyboard with ready access to the number keys.
  /// Additional options, such as decimal point and/or positive/negative
  /// signs, can be requested using [new TextInputType.numberWithOptions].
  SkywaTextFormField.numberWithOptions({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
    this.maxDigitsLength,
    this.allowDecimal = true,
    this.postDecimalLength = 2,
  })  : keyboardType = const TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        ),
        textCapitalization = TextCapitalization.none,
        assert(textEditingController != null),
        assert(labelText != 'null');

  /// Optimize for telephone numbers.
  ///
  /// Requests a keyboard with ready access to the number keys, "*", and "#".
  SkywaTextFormField.phone({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
  })  : keyboardType = TextInputType.phone,
        textCapitalization = TextCapitalization.none,
        assert(textEditingController != null),
        assert(labelText != 'null');

  /// Optimize for date and time information.
  ///
  /// On iOS, requests the default keyboard.
  ///
  /// On Android, requests a keyboard with ready access to the number keys,
  /// ":", and "-".
  SkywaTextFormField.datetime({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
    this.onDateTimeChanged,
    this.initialDateTime,
    this.minimumDate,
    this.minimumYear,
    this.maximumDate,
    this.maximumYear,
  })  : keyboardType = TextInputType.datetime,
        textCapitalization = TextCapitalization.none,
        assert(textEditingController != null),
        assert(labelText != 'null');

  /// Optimize for email addresses.
  ///
  /// Requests a keyboard with ready access to the "@" and "." keys.
  SkywaTextFormField.emailAddress({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
  })  : keyboardType = TextInputType.emailAddress,
        textCapitalization = TextCapitalization.none,
        assert(textEditingController != null),
        assert(labelText != 'null');

  /// Optimize for URLs.
  ///
  /// Requests a keyboard with ready access to the "/" and "." keys.
  SkywaTextFormField.url({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
  })  : keyboardType = TextInputType.url,
        textCapitalization = TextCapitalization.none,
        assert(textEditingController != null),
        assert(labelText != 'null');

  /// Optimize for passwords that are visible to the user.
  ///
  /// Requests a keyboard with ready access to both letters and numbers.
  /*SkywaTextFormField.visiblePassword({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
  })  : keyboardType = TextInputType.visiblePassword,
        textCapitalization = TextCapitalization.words,
        assert(textEditingController != null),
        assert(labelText != 'null');*/

  /// Optimized for a person's name.
  ///
  /// On iOS, requests the
  /// [UIKeyboardType.namePhonePad](https://developer.apple.com/documentation/uikit/uikeyboardtype/namephonepad)
  /// keyboard, a keyboard optimized for entering a person’s name or phone number.
  /// Does not support auto-capitalization.
  ///
  /// On Android, requests a keyboard optimized for
  /// [TYPE_TEXT_VARIATION_PERSON_NAME](https://developer.android.com/reference/android/text/InputType#TYPE_TEXT_VARIATION_PERSON_NAME).
  SkywaTextFormField.name({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
  })  : keyboardType = TextInputType.name,
        textCapitalization = TextCapitalization.words,
        assert(textEditingController != null),
        assert(labelText != 'null');

  /// Optimized for postal mailing addresses.
  ///
  /// On iOS, requests the default keyboard.
  ///
  /// On Android, requests a keyboard optimized for
  /// [TYPE_TEXT_VARIATION_POSTAL_ADDRESS](https://developer.android.com/reference/android/text/InputType#TYPE_TEXT_VARIATION_POSTAL_ADDRESS).
  SkywaTextFormField.streetAddress({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
  })  : keyboardType = TextInputType.streetAddress,
        textCapitalization = TextCapitalization.words,
        assert(textEditingController != null),
        assert(labelText != 'null');

  /// Prevent the OS from showing the on-screen virtual keyboard.
  SkywaTextFormField.none({
    super.key,
    required this.textEditingController,
    this.labelText = '',
    this.hintText = '',
    this.errorText,
    this.textColor,
    this.cursorColor,
    this.labelColor,
    this.hintColor,
    this.textAlign = TextAlign.left,
    this.contentPadding,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.showDecoration = true,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    // this.isObscure = false,
  })  : keyboardType = TextInputType.none,
        textCapitalization = TextCapitalization.none,
        assert(textEditingController != null),
        assert(labelText != 'null');

  @override
  State<SkywaTextFormField> createState() => _SkywaTextFormFieldState();
}

class _SkywaTextFormFieldState extends State<SkywaTextFormField> {
  bool isObscure = false;
  bool isValidPhoneNumber = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.textEditingController,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          textAlign: widget.textAlign,
          style: TextStyle(
            fontSize: 17.0,
            color: widget.textColor ?? Colors.black,
          ),
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          obscureText: isObscure,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          enableSuggestions: true,
          obscuringCharacter: '*',
          cursorColor: widget.cursorColor ?? Theme.of(context).primaryColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofocus: widget.autofocus,
          decoration: InputDecoration(
            border: widget.showDecoration
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )
                : InputBorder.none,
            focusedBorder: widget.showDecoration
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                  )
                : InputBorder.none,
            contentPadding: widget.contentPadding,
            errorText: widget.errorText,
            errorBorder: widget.showDecoration
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).errorColor,
                      width: 2.0,
                    ),
                  )
                : InputBorder.none,
            label: SkywaText(
              widget.labelText,
              fontSize: 18.0,
              color: widget.labelColor ?? Colors.grey.shade600,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 17.0,
              color: widget.hintColor ?? Colors.grey.shade400,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.keyboardType == TextInputType.visiblePassword ||
                    widget.suffixIcon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.keyboardType == TextInputType.visiblePassword)
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          icon: Icon(
                            isObscure
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      if (widget.suffixIcon != null) widget.suffixIcon!,
                    ],
                  )
                : null,
          ),
          validator: (value) {
            // print('459: $value');
            widget.validator;
            return null;
            // TODO: Sougata HANDLE VALIDATOR
          },
          inputFormatters: <TextInputFormatter>[
            // TODO: Sougata LET ACCEPT HYPHEN
            if (widget.keyboardType ==
                const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ))
              LengthLimitingTextInputFormatter(widget.maxDigitsLength),
            /*if (widget.keyboardType ==
                const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ))
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),*/
            if (widget.keyboardType ==
                    const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ) &&
                widget.allowDecimal == true)
              FilteringTextInputFormatter.allow(RegExp(
                  r"^-?\d*\.?\d{0," + "${widget.postDecimalLength}" + "}"))
            else if (widget.allowDecimal == false)
              FilteringTextInputFormatter.allow(RegExp(r"^-?\d*")),
            // FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            if (widget.keyboardType == TextInputType.phone)
              FilteringTextInputFormatter.deny(RegExp(r'[a-z A-Z]')),
          ],
          onTap: widget.keyboardType == TextInputType.datetime
              ? () {
                  SkywaCupertinoDateTimePicker.dateAndTime(
                    context: context,
                    onDateTimeChanged: widget.onDateTimeChanged!,
                    initialDateTime: widget.initialDateTime,
                    minimumYear: widget.minimumYear,
                    minimumDate: widget.minimumDate,
                    maximumYear: widget.maximumYear,
                    maximumDate: widget.maximumDate,
                  );
                }
              : widget.onTap,
          onChanged: widget.onChanged,
        ),
        if (widget.keyboardType == TextInputType.phone && !isValidPhoneNumber)
          Column(
            children: [
              const SizedBox(height: 5.0),
              SkywaText(
                'Invalid Phone Number',
                color: Theme.of(context).errorColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ],
          ),
      ],
    );
  }
}
