import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';
import 'package:uber_concept/localization/keys.dart';

import '../../../widgets/templates/Intro_temp.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroTemp(
      widthFactor: 1.25,
      image: Image.asset('assets/images/headImage.jpg'),
      title: translate(Keys.welcome_page_ft_page_title),
      subtitle: translate(Keys.welcome_page_ft_page_subtitle),
    );
  }
}