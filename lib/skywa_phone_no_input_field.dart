import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SkywaPhoneNoInputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final EdgeInsets? padding;
  final Widget? suffixIcon;
  final ValueChanged<PhoneNumber>? onChanged;
  final ValueChanged<bool>? onInputValidated;
  final ValueChanged<String>? onFieldSubmitted;

  const SkywaPhoneNoInputField({
    Key? key,
    required this.textEditingController,
    this.padding,
    this.suffixIcon,
    this.onChanged,
    this.onInputValidated,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<SkywaPhoneNoInputField> createState() => _SkywaPhoneNoInputFieldState();
}

class _SkywaPhoneNoInputFieldState extends State<SkywaPhoneNoInputField> {
  PhoneNumber? number;
  List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
  String? isoCountryCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isoCountryCode = systemLocales.first.countryCode;
    number = PhoneNumber(isoCode: isoCountryCode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
      ),
      child: InternationalPhoneNumberInput(
        // TODO: Restrict input from taking alphabet
        textFieldController: widget.textEditingController,
        autoFocus: true,
        autoFocusSearch: true,
        initialValue: number,
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
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        selectorTextStyle: const TextStyle(color: Colors.black),
        formatInput: true,
        maxLength: 60,
        countrySelectorScrollControlled: false,
        cursorColor: Theme.of(context).primaryColor,
        inputDecoration: const InputDecoration(border: InputBorder.none),
        // inputDecoration: InputDecoration(
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(15.0),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(8.0),
        //     borderSide: BorderSide(
        //       color: Theme.of(context).primaryColor,
        //       width: 2.0,
        //     ),
        //   ),
        //   hintText: 'Phone Number',
        //   suffixIcon: widget.suffixIcon,
        //   hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
        // ),
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
  }
}
