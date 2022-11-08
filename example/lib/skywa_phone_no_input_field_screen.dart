import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_phone_no_input_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:skywa_framework_widgets/skywa_snackbar.dart';

class SkywaPhoneNoInputFieldScreen extends StatefulWidget {
  const SkywaPhoneNoInputFieldScreen({Key? key}) : super(key: key);

  @override
  State<SkywaPhoneNoInputFieldScreen> createState() =>
      _SkywaPhoneNoInputFieldScreenState();
}

class _SkywaPhoneNoInputFieldScreenState
    extends State<SkywaPhoneNoInputFieldScreen> {
  TextEditingController phoneController = TextEditingController();
  bool isValidated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Phone No Input Field'),
      ),
      body: SkywaPhoneNoInputField(
        textEditingController: phoneController,
        onChanged: (PhoneNumber phoneNumber) {
          // print(phoneController.text);
          setState(() {
            phoneController.text;
          });
        },
        suffixIcon: phoneController.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  setState(() {
                    phoneController.clear();
                  });
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : null,
        onInputValidated: (bool validPhone) {
          isValidated = validPhone;
        },
        onFieldSubmitted: (String number) {
          print('onFieldSubmitted: $number');
          if (!isValidated) {
            SkywaSnackBar.error(
              context: context,
              snackBarText: 'Invalid Phone Number',
            );
          }
        },
      ),
    );
  }
}
