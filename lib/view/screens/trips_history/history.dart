import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/view/widgets/DashLine.dart';
import 'package:uber_concept/view/widgets/ArrowIcon.dart';
import 'package:uber_concept/localization/keys.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: lang == 'ar' ? 10 : 30,
                      right: lang == 'ar' ? 30 : 10,
                    ),
                    height: 135,
                    alignment: Alignment.topCenter,
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          translate(Keys.history_title),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white, fontSize: 22),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(10, 2, 5, 2),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Oct 15,2018',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -46,
                    left: 0,
                    child: Container(
                      width: size.width,
                      child: HistoryCard(
                        fromAddrs: '7958 Swift Village',
                        toAddrs: '105 William St, Chicago, US',
                        state: translate(Keys.history_status_done),
                        stateColor: Colors.blueAccent,
                        money: 75.00,
                        marginTop: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: <Widget>[
                      HistoryCard(
                        fromAddrs: '026 Mitchell Burg Apt. 574',
                        toAddrs: '324 Lottie Views Suite 426',
                        state: translate(Keys.history_status_on),
                        stateColor: Colors.greenAccent,
                        money: 30.00,
                      ),
                      HistoryCard(
                        fromAddrs: '89 Stacy Falls Suite 953',
                        toAddrs: '080 Joaquin LsLe Suite 865',
                        state: translate(Keys.history_status_off),
                        stateColor: Colors.grey[400],
                        money: 35.00,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String fromAddrs;
  final String toAddrs;
  final String state;
  final double money;
  final Color stateColor;
  final double marginTop;

  const HistoryCard(
      {Key key,
      this.fromAddrs,
      this.toAddrs,
      this.state,
      this.stateColor,
      this.marginTop = 20,
      this.money})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Card(
      margin: EdgeInsets.fromLTRB(15, marginTop, 15, 0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.my_location,
                          color: Theme.of(context).primaryColor,
                          size: 25,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            fromAddrs,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomPaint(
                    painter: DashLine(
                      lang == 'ar' ? -12.5 : 12.5,
                      -1,
                      20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 25,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            toAddrs,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              height: 1,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          size: 25,
                        ),
                        Text(
                          '\$$money',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          state,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(color: stateColor),
                        ),
                        ArrowIcon(lang: lang)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
