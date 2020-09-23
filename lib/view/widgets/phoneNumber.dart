import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

import 'PhoneCodePicker.dart';

class PhoneNumber extends StatelessWidget {
  final TextEditingController controller;
  final Function onSaved, onCodeChanged;
  final Widget countryCode;
  final String initialCode;

  const PhoneNumber({this.controller, this.onSaved, this.onCodeChanged, this.countryCode, this.initialCode});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    bool isArabic = local.currentLocale.languageCode == 'ar';
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: <Widget>[
            PhoneCode(
              onChanged: onCodeChanged,
              initialCode: initialCode,
            ),
            Expanded(
              child: Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: false,
                    hintText: translate(Keys.registration_sign_up_num_hint),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        top: isArabic ? 7 : 10,
                        left: 8,
                        right: 1,
                      ),
                      child: countryCode
                    ),
                  ),
                  cursorColor: theme.primaryColor,
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.number,
                  controller: controller,
                  onSaved: onSaved,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
