import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:uber_concept/view/screens/GetStarted.dart';
import 'package:uber_concept/view/widgets/phoneNumber.dart';
import 'package:uber_concept/localization/keys.dart';
import '../../../../providers/registration/Login_state.dart';
import '../../../../utilities/validators/FormsValidation.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    FormsValidation validation =
        Provider.of<FormsValidation>(context, listen: false);
    LoginState loginState = Provider.of<LoginState>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: loginKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 30),
            PhoneNumber(
              controller: _phoneController,
              onCodeChanged: (code) => loginState.phoneCode = code.dialCode,
              onSaved: (String phone) => loginState.setPhone = phone.trim(),
              countryCode: Selector<LoginState, String>(
                selector: (_, code) => code.phoneCode,
                builder: (_, phoneCode, __) {
                  return Text(
                    phoneCode,
                    style: theme.textTheme.subtitle2,
                  );
                },
              ),
              initialCode: loginState.phoneCode
            ),
            SizedBox(height: 6),
            Row(
              children: [
                SizedBox(width: 10),
                Selector<LoginState, String>(
                  selector: (_, e) => e.errorMessage,
                  builder: (context, message, _) {
                    return Text(
                      message,
                      style: TextStyle(color: theme.errorColor, fontSize: 13),
                    );
                  },
                ),
                
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text(translate(Keys.registration_sign_in_btn_title)),
                color: theme.primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  loginState.errorMessage =
                      validation.phoneValidate(_phoneController.text.trim());
                  // check sign up form validation
                  validation.saveFormData(
                    formKey: loginKey.currentState,
                    phoneData: _phoneController.text.trim(),
                    sendData: () {},
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => GetStarted(),
                  //   ),
                  // );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
