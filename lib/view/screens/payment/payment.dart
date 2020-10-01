import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        actions: <Widget>[
          FlatButton(
            child: Text(translate(Keys.pay_methods_finish_btn)),
            textColor: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: size.width,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    width: size.width,
                    padding: EdgeInsets.fromLTRB(
                      lang == 'ar' ? 10 : 30,
                      0,
                      lang == 'ar' ? 30 : 10,
                      45,
                    ),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      translate(Keys.pay_methods_title),
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: -41,
                    left: 10,
                    right: 10,
                    child: Container(
                      width: size.width,
                      height: 82,
                      child: Card(
                        // margin: EdgeInsets.fromLTRB(15, 30, 15, 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey[300],
                            child: Icon(Icons.attach_money,
                                color: Colors.black, size: 25),
                          ),
                          title: Text(
                            translate(Keys.pay_methods_card_pay_way),
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 16),
                          ),
                          subtitle: Text(
                            translate(Keys.pay_methods_card_pay_method),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 60),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: <Widget>[
                      PayMethods(),
                      SizedBox(height: 30),
                      RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add_circle),
                            SizedBox(width: 8),
                            Text(translate(Keys.pay_methods_new_method_btn)),
                          ],
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PayMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              translate(Keys.pay_methods_credit),
              style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15),
            ),
            PayMethodItem(
              id: '**** **** **** 5967',
              icon: Icons.credit_card,
              selected: true,
            ),
            PayMethodItem(
              id: 'wilson.casper@bernice.info',
              icon: Icons.credit_card,
            ),
            PayMethodItem(
              id: '**** **** **** 3461',
              icon: Icons.credit_card,
            ),
          ],
        ),
      ),
    );
  }
}

class PayMethodItem extends StatelessWidget {
  final IconData icon;
  final String id;
  final bool selected;

  const PayMethodItem({this.icon, this.id, this.selected = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: selected
            ? Border.all(
                color: Theme.of(context).primaryColor,
              )
            : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(id),
        trailing: selected
            ? Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
              )
            : null,
      ),
    );
  }
}
