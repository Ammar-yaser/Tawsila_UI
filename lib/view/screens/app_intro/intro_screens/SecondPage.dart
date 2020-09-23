import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';
import 'package:uber_concept/localization/keys.dart';

import '../../../widgets/templates/Intro_temp.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroTemp(
      widthFactor: 1.42,
      image: Image.asset('assets/images/headImage.jpg'),
      title: translate(Keys.welcome_page_sd_page_title),
      subtitle: translate(Keys.welcome_page_sd_page_subtitle),
    );
  }
}
