import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/ui_state/regist_ui_state.dart';
import 'forms/signup_form.dart';
import 'forms/signin_form.dart';

class SelectedForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200])),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: const Radius.circular(7),
            bottomRight: const Radius.circular(7),
          ),
        ),
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: SwitchForms(),
      ),
    );
  }
}

class SwitchForms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegistUIState>(
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
