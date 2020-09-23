import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uber_concept/localization/keys.dart';

class VerifyPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              lang == 'ar' ? 10 : 30,
              0,
              lang == 'ar' ? 30 : 10,
              20,
            ),
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  translate(Keys.verification_title),
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(translate(Keys.verification_subtitle),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.white))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      PinCodeFields(),
                      SizedBox(height: 40),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          child: Text(translate(Keys.verification_confirm_btn)),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class PinCodeFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obsecureText: false,
      autoFocus: true,
      autoDisposeControllers: false,
      textInputType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          inactiveColor: Colors.grey),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      // enableActiveFill: true,
      // errorAnimationController: errorController,
      // controller: textEditingController,
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
