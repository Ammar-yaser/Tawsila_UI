import 'package:flutter/material.dart';

class IntroTemp extends StatelessWidget {
  final double widthFactor;
  final Widget image, startButton;
  final String title, subtitle;

  const IntroTemp({this.widthFactor, this.image, this.title, this.subtitle, this.startButton});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: widthFactor * (size.width / 2),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: image,
            ),
            SizedBox(
              height: size.height / 15,
            ),
            Container(
              child: Text(
                title,
                style: theme.textTheme.headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.subtitle1,
              ),
            ),
            startButton ?? SizedBox()
          ],
        ),
      ),
    );
  }
}
