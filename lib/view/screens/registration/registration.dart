import 'package:flutter/material.dart';

// Language Localization
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

// providers
import 'package:provider/provider.dart';
import '../../../providers/ui_state/regist_ui_state.dart';

// pages and widgets
import 'FormsHeadlines.dart';
import 'SelectedForm.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegistUIState>(
      create: (_) => RegistUIState(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                FormsHeadlines(),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      SelectedForm(),
                      SizedBox(height: 20),
                      Consumer<RegistUIState>(
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
              ],
            ),
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
