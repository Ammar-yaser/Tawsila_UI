import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';
import 'package:provider/provider.dart';
import 'package:uber_concept/view/screens/GetStarted.dart';
import '../../../../providers/registration/Signup_state.dart';
import '../../../../utilities/validators/FormsValidation.dart';
import '../../../widgets/phoneNumber.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // global variables of class
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final InputBorder fieldBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: Colors.grey[300]),
  );
  final InputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    FormsValidation validation =
        Provider.of<FormsValidation>(context, listen: false);
    SignupState signupState = Provider.of<SignupState>(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: signupKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'name@example.com',
                enabledBorder: fieldBorder,
                focusedBorder: fieldBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
                contentPadding: const EdgeInsets.all(8),
              ),
              style: TextStyle(fontSize: 16),
              keyboardType: TextInputType.emailAddress,
              validator: (String email) => validation.emailValidate(email),
              onSaved: (String email) => signupState.setEmail = email,
            ),
            SizedBox(height: 10),
            PhoneNumber(
              controller: _phoneController,
              onCodeChanged: (code) => signupState.phoneCode = code.dialCode,
              onSaved: (String phone) => signupState.setPhone = phone.trim(),
              countryCode: Selector<SignupState, String>(
                selector: (_, code) => code.phoneCode,
                builder: (_, phoneCode, __) {
                  return Text(
                    phoneCode,
                    style: theme.textTheme.subtitle2,
                  );
                },
              ),
              initialCode: signupState.phoneCode,
            ),
            SizedBox(height: 6),
            Row(
              children: [
                SizedBox(width: 10),
                Selector<SignupState, String>(
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
                child: Text(translate(Keys.registration_sign_up_title)),
                color: theme.primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                onPressed: () {
                  // save phone error message to show it
                  signupState.errorMessage =
                      validation.phoneValidate(_phoneController.text.trim());
                  // check sign up form validation
                  validation.saveFormData(
                    formKey: signupKey.currentState,
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
