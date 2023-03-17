import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SkywaPhoneNoInputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final PhoneNumber? initialValue;
  final String errorMessage;
  final bool autoFocus;
  final EdgeInsets? padding;
  final Widget? suffixIcon;
  final bool enabled;
  final ValueChanged<PhoneNumber>? onChanged;
  final ValueChanged<bool>? onInputValidated;
  final ValueChanged<String>? onFieldSubmitted;

  const SkywaPhoneNoInputField({
    Key? key,
    required this.textEditingController,
    this.initialValue,
    this.errorMessage = 'Invalid Phone Number',
    this.autoFocus = false,
    this.padding,
    this.suffixIcon,
    this.enabled = true,
    this.onChanged,
    this.onInputValidated,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<SkywaPhoneNoInputField> createState() => _SkywaPhoneNoInputFieldState();
}

class _SkywaPhoneNoInputFieldState extends State<SkywaPhoneNoInputField> {
  PhoneNumber? number;
//   List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
//   String? isoCountryCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//     isoCountryCode = systemLocales.first.countryCode;
    number = widget.initialValue ?? PhoneNumber(isoCode: 'US');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60.0,
      padding: const EdgeInsets.only(left: 5.0),
      constraints: const BoxConstraints(minHeight: 60.0, maxHeight: 74.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.grey),
      ),
      child: InternationalPhoneNumberInput(
        // TODO: Restrict input from taking alphabet
        textFieldController: widget.textEditingController,
        autoFocus: widget.autoFocus,
        autoFocusSearch: true,
        initialValue: number,
        isEnabled: widget.enabled,
        errorMessage: widget.errorMessage,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        searchBoxDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
          suffixIcon: widget.suffixIcon,
          labelText: 'Country Name/Country Code',
          hintText: 'Search by country name or code',
        ),
        spaceBetweenSelectorAndTextField: 0.0,
        onInputChanged: widget.onChanged,
        onInputValidated: widget.onInputValidated,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          trailingSpace: false,
          leadingPadding: 0.0,
          useEmoji: !kIsWeb,
        ),
        ignoreBlank: false,
        selectorTextStyle: const TextStyle(color: Colors.black),
        formatInput: true,
        maxLength: 60,
        countrySelectorScrollControlled: true,
        cursorColor: Theme.of(context).primaryColor,
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: widget.suffixIcon,
        ),
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
          widget.onInputValidated;
        },
      ),
    );
  }
}
