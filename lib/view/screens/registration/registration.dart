import 'package:flutter/material.dart';

// Language Localization
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

// providers
import 'package:provider/provider.dart';
import '../../../providers/registration/registration_state.dart';

// pages and widgets
import 'forms/select_form.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<RegistrationState>(
      create: (_) => RegistrationState(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      color: Theme.of(context).primaryColor,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 250,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 187,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: Container(
                            width: size.width - 50,
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 30,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SelectForm(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Consumer<RegistrationState>(
                        builder: (_, formState, __) {
                          return AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            switchInCurve: Curves.easeInOutQuad,
                            switchOutCurve: Curves.easeInOutQuad,
                            child: formState.selectedForm == 0
                                ? SignUpWithFacebook()
                                : Container(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpWithFacebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: RaisedButton(
              child: Text(translate(Keys.registration_sign_up_facebook)),
              color: Colors.blue,
              textColor: Colors.white,
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 15),
          //============================\\
          // Terms and conditions agreement
          Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 12),
              children: [
                TextSpan(
                    text: translate(Keys.registration_sign_up_policy_agree)),
                TextSpan(
                  text: translate(Keys.registration_sign_up_policy_page),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontSize: 12),
                )
              ],
            ),
          ),
          //============================\\
        ],
      ),
    );
  }
}
