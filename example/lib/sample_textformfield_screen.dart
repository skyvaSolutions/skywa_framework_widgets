import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/services/is_string_invalid.dart';
import 'package:skywa_framework_widgets/skywa_textformfield.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';

class SampleTextFormFieldScreen extends StatefulWidget {
  const SampleTextFormFieldScreen({Key? key}) : super(key: key);

  @override
  State<SampleTextFormFieldScreen> createState() =>
      _SampleTextFormFieldScreenState();
}

class _SampleTextFormFieldScreenState extends State<SampleTextFormFieldScreen> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _multilineController = TextEditingController();
  TextEditingController _numberWithOptionsController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _datetimeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample TextFormFields'),
      ),
      body: Container(
        height: Device.screenHeight,
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            // SizedBox(height: 500.0),

            /// text
            Text(
              'Text',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.text(
                textEditingController: _textController,
                hintText: 'Enter a text...',
                labelText: 'Text',
                suffixIcon: _textController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _textController.clear();
                          });
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : null,
                onChanged: (value) {
                  setState(() {
                    _textController.text;
                  });
                }),
            const SizedBox(height: 20.0),

            /// multiline
            Text(
              'Multiline Text',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.multiline(
                textEditingController: _multilineController,
                hintText: 'Enter multiline text...',
                labelText: 'Multiline Text',
                maxLines: 5,
                suffixIcon: _multilineController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _multilineController.clear();
                          });
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : null,
                onChanged: (value) {
                  print(_multilineController.text);
                  setState(() {
                    _multilineController.text;
                  });
                }),
            const SizedBox(height: 20.0),

            /// number   NOT REQUIRED
            /*Text('Number', style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: 10.0),
            SkywaTextFormField.number(
                textEditingController: _numberController,
                hintText: 'Enter number...',
                labelText: 'Number',
                suffixIcon: _numberController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _numberController.clear();
                          });
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: ColorThemes.primaryColor,
                        ),
                      )
                    : null,
                onChanged: (value) {
                  print(_numberController.text);
                  setState(() {
                    _numberController.text;
                  });
                }),
            SizedBox(height: 20.0),*/

            /// numberWithOptions
            Text(
              'Number With Options',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.numberWithOptions(
                textEditingController: _numberWithOptionsController,
                hintText: 'Enter number with options...',
                labelText: 'Number With Options',
                // maxDigitsLength: 4,
                postDecimalLength: 10,
                suffixIcon: _numberWithOptionsController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _numberWithOptionsController.clear();
                          });
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : null,
                onChanged: (value) {
                  print(_numberWithOptionsController.text);
                  setState(() {
                    _numberWithOptionsController.text;
                  });
                }),
            const SizedBox(height: 20.0),

            /// phone
            Text(
              'Phone',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.phone(
              textEditingController: _phoneController,
              hintText: 'Enter your phone...',
              labelText: 'Phone',
              suffixIcon: _phoneController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _phoneController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,
              /*onChanged: (value) {
                print(_phoneController.text);
                setState(() {
                  _phoneController.text;
                });
              },*/
            ),
            const SizedBox(height: 20.0),

            /// datetime
            Text(
              'DateTime',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.datetime(
              textEditingController: _datetimeController,
              hintText: 'Enter datetime...',
              labelText: 'DateTime',
              suffixIcon: _datetimeController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _datetimeController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,
              readOnly: true,
              onDateTimeChanged: (DateTime _dateTime) {
                setState(() {
                  _datetimeController.text = _dateTime.toString();
                });
              },
              validator: (String? value) {
                print(value);
              },
              initialDateTime: !isStringInvalid(text: _datetimeController.text)
                  ? DateTime.parse(_datetimeController.text)
                  : null,
              minimumYear: DateTime.now().year,
              minimumDate: DateTime.now(),
              maximumYear: DateTime.now().year + 1,
              maximumDate: DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day + 30,
              ),
            ),
            const SizedBox(height: 20.0),

            /// email
            Text(
              'Email',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.emailAddress(
              textEditingController: _emailController,
              hintText: 'Enter your email...',
              labelText: 'Email',
              suffixIcon: _emailController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _emailController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,
              onChanged: (value) {
                print(_emailController.text);
                setState(() {
                  _emailController.text;
                });
              },
            ),
            const SizedBox(height: 20.0),

            /// url
            Text(
              'URL',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.url(
              textEditingController: _urlController,
              hintText: 'Enter url...',
              labelText: 'URL',
              suffixIcon: _urlController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _urlController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,
              onChanged: (value) {
                print(_urlController.text);
                setState(() {
                  _urlController.text;
                });
              },
            ),
            const SizedBox(height: 20.0),

            /// visiblePassword
            Text(
              'Password',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.visiblePassword(
              textEditingController: _passwordController,
              hintText: 'Enter password...',
              labelText: 'Password',
              suffixIcon: _passwordController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,
              onChanged: (value) {
                print(_passwordController.text);
                setState(() {
                  _passwordController.text;
                });
              },
            ),
            const SizedBox(height: 20.0),

            /// name
            Text(
              'Name',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.name(
                textEditingController: _nameController,
                hintText: 'Enter your name...',
                labelText: 'Name',
                suffixIcon: _nameController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _nameController.clear();
                          });
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : null,
                onChanged: (value) {
                  print(_nameController.text);
                  setState(() {
                    _nameController.text;
                  });
                }),
            const SizedBox(height: 20.0),

            /// address
            Text(
              'Address',
              style: TextStyle(
                fontSize: Device.screenHeight * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            SkywaTextFormField.streetAddress(
              textEditingController: _addressController,
              hintText: 'Enter your address...',
              labelText: 'Address',
              suffixIcon: _addressController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _addressController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,
              onChanged: (value) {
                print(_addressController.text);
                setState(() {
                  _addressController.text;
                });
              },
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
