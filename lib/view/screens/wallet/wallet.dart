import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/view/widgets/ArrowIcon.dart';
import 'package:uber_concept/localization/keys.dart';
import 'package:uber_concept/view/widgets/personal_info.dart';

import '../payment/payment.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: lang == 'ar' ? 10 : 30,
                      right: lang == 'ar' ? 30 : 10,
                    ),
                    height: 150,
                    alignment: Alignment.topCenter,
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          translate(Keys.wallet_title),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white, fontSize: 22),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.stars,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '2500',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  CashCard(
                    margin: EdgeInsets.fromLTRB(35, 40, 35, 0),
                  ),
                  CashCard(
                    margin: EdgeInsets.fromLTRB(25, 55, 25, 0),
                  ),
                  CashCard(
                    margin: EdgeInsets.fromLTRB(15, 70, 15, 0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 2, right: 2),
                            child: CircleAvatar(
                              radius: 3.7,
                              backgroundColor: index == 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey[300],
                            ),
                          );
                        }),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Payment()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          lang == 'ar' ? 5 : 15,
                          6,
                          lang == 'ar' ? 15 : 5,
                          6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Colors.grey[200]),
                            top: BorderSide(color: Colors.grey[200]),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              translate(Keys.wallet_pay_methods),
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            ArrowIcon(lang: lang),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(top: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: lang == 'ar' ? 0 : 15,
                            right: lang == 'ar' ? 15 : 0),
                        child: Column(
                          children: <Widget>[
                            StandardPersonalInfo(
                              title: translate(Keys.wallet_coupon),
                              subtitle: '3',
                            ),
                            StandardPersonalInfo(
                              title: translate(Keys.wallet_integral_mail),
                              subtitle: '4500',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CashCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  const CashCard({Key key, this.margin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                title: Text(
                  translate(Keys.wallet_card_pay_way),
                  style:
                      Theme.of(context).textTheme.headline4.copyWith(fontSize: 16),
                ),
                subtitle: Text(translate(Keys.wallet_card_pay_method)),
              ),
            ),
            Divider(
              color: Colors.grey[300],
              height: 1,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          translate(Keys.wallet_card_money),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Text(
                          '\$2500',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.red, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          translate(Keys.wallet_card_expires),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Text('09/21', style: Theme.of(context).textTheme.headline4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}