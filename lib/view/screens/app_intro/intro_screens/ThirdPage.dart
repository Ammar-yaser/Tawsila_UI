import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';
import 'package:uber_concept/view/screens/Registration/Registration.dart';
import 'package:uber_concept/localization/keys.dart';

import '../../../widgets/templates/Intro_temp.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return IntroTemp(
      widthFactor: 1.5,
      image: Image.asset('assets/images/headImage.jpg'),
      title: translate(Keys.welcome_page_th_page_title),
      subtitle: translate(Keys.welcome_page_th_page_subtitle),
      startButton: Column(
        children: [
          SizedBox(
            height: size.height / 15,
          ),
          Container(
            width: 180,
            child: RaisedButton(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              child: Text(
                translate(Keys.welcome_page_th_page_button).toUpperCase(),
              ),
              color: theme.primaryColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Registration()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
