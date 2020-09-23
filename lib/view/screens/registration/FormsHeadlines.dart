import 'package:flutter/material.dart';

// Language localizstion
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

// providers
import 'package:provider/provider.dart';
import '../../../providers/ui_state/regist_ui_state.dart';

class FormsHeadlines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 270,
            color: theme.primaryColor,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: Card(
                margin: EdgeInsets.zero,
                child: Container(
                  width: size.width - 50,
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                    ),
                  ),
                  child: SelectForm(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SelectForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RegistUIState formState =
        Provider.of<RegistUIState>(context, listen: false);
    ThemeData theme = Theme.of(context);
    Color selectedTitleColor = theme.textTheme.headline5.color;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          onTap: () => formState.selectedForm = 0,
          child: Consumer<RegistUIState>(
            builder: (_, formState, __) {
              bool isSelected = formState.selectedForm == 0;
              return FormTitle(
                title: translate(Keys.registration_sign_up_title),
                titleColor: isSelected ? selectedTitleColor : Colors.grey,
                indecatorColor: isSelected ? theme.primaryColor : null,
              );
            },
          ),
        ),
        InkWell(
          onTap: () => formState.selectedForm = 1,
          child: Consumer<RegistUIState>(
            builder: (_, formState, __) {
              bool isSelected = formState.selectedForm == 1;
              return FormTitle(
                title: translate(Keys.registration_sign_in_title),
                titleColor: isSelected ? selectedTitleColor : Colors.grey,
                indecatorColor: isSelected ? theme.primaryColor : null,
              );
            },
          ),
        ),
      ],
    );
  }
}

class FormTitle extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color indecatorColor;

  const FormTitle({this.title, this.titleColor, this.indecatorColor});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
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
    );
  }
}
