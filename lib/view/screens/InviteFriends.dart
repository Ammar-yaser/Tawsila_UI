import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

class InviteFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextTheme textStyle = Theme.of(context).textTheme;
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          CustomPaint(
            painter: Circle1(),
            child: Container(),
          ),
          CustomPaint(
            painter: Circle2(width / 2),
            child: Container(),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                translate(Keys.invite_firends_title),
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 2,
                            child: Image.asset(
                              'assets/images/gift.png',
                              // width: 200,
                              // height: 200,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      translate(Keys.invite_firends_title),
                                      style: textStyle.headline4.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      translate(Keys.invite_firends_head),
                                      style: textStyle.headline4.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      translate(Keys.invite_firends_note),
                                      style: textStyle.subtitle2
                                          .copyWith(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InvitationCode()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvitationCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            translate(Keys.invite_firends_share_title),
            style: theme.textTheme.headline4.copyWith(fontSize: 16),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Y045KG',
                style: theme.textTheme.headline4,
              ),
              Icon(Icons.content_copy, color: theme.primaryColor),
            ],
          ),
          Divider(height: 10, color: Colors.black),
          SizedBox(height: 22),
          Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text(translate(Keys.invite_firends_title)),
                color: theme.primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}

class Circle1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color =
          Color.lerp(Colors.transparent, Colors.black.withOpacity(0.08), 0.5);
    canvas.drawCircle(Offset(30, 120), 200, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Circle2 extends CustomPainter {
  final double distance;

  Circle2(this.distance);
  @override
  void paint(Canvas canvas, Size size) {
    // var te = Offset()
    Paint paint = Paint()
      ..color = Color.lerp(
        Colors.black.withOpacity(0.06),
        Colors.black.withOpacity(0.09),
        0.7,
      );
    canvas.drawCircle(Offset.fromDirection(0, distance), 250, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
