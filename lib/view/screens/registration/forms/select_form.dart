import 'package:flutter/material.dart';

// Language localizstion
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

// providers
import 'package:provider/provider.dart';
import '../../../../providers/registration/registration_state.dart';
import 'signin_form.dart';
import 'signup_form.dart';

class SelectForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color selectedTitleColor = theme.textTheme.headline5.color;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Consumer<RegistrationState>(
              builder: (_, formState, __) {
                bool isSelected = formState.selectedForm == 0;
                return FormTitle(
                  title: translate(Keys.registration_sign_up_title),
                  titleColor: isSelected ? selectedTitleColor : Colors.grey,
                  indecatorColor: isSelected ? theme.primaryColor : null,
                  onTap: () => formState.selectedForm = 0,
                );
              },
            ),
            Consumer<RegistrationState>(
              builder: (_, formState, __) {
                bool isSelected = formState.selectedForm == 1;
                return FormTitle(
                  title: translate(Keys.registration_sign_in_title),
                  titleColor: isSelected ? selectedTitleColor : Colors.grey,
                  indecatorColor: isSelected ? theme.primaryColor : null,
                  onTap: () => formState.selectedForm = 1,
                );
              },
            ),
          ],
        ),
        Divider(color: Colors.grey[300]),
        SwitchForms(),
      ],
    );
  }
}

class SwitchForms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationState>(
      builder: (_, formState, __) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOutQuad,
          switchOutCurve: Curves.easeInOutQuad,
          child: formState.selectedForm == 0 ? SignUpForm() : SignInForm(),
        );
      },
    );
  }
}

class FormTitle extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color indecatorColor;
  final Function onTap;

  const FormTitle(
      {this.title, this.titleColor, this.indecatorColor, this.onTap});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: <Widget>[
            AnimatedDefaultTextStyle(
              child: Text(title),
              style: theme.textTheme.headline6.copyWith(color: titleColor),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOutQuad,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOutQuad,
              margin: const EdgeInsets.only(top: 8),
              height: 4,
              width: 35,
              decoration: BoxDecoration(
                color: indecatorColor,
                borderRadius: BorderRadius.circular(5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
