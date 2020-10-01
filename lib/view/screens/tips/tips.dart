import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

class Tips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          translate(Keys.tips_title),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        height: height,
        alignment: Alignment.center,
        child: Stack(
          overflow: Overflow.visible,
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            TipsPricesCard(),
            Positioned(
              top: -35,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.withGreen(10),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TipsPricesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Gregory Smith',
              style: textStyle.title.copyWith(fontSize: 16),
            ),
            SizedBox(height: 2),
            Text(
              '652 - UKW',
              style: TextStyle(color: Colors.grey[400]),
            ),
            SizedBox(height: 15),
            Text(
              'Wow! A 5 star !',
              style: textStyle.headline.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              translate(Keys.tips_question, args: {"name": "جريجوري"}),
              style: textStyle.headline.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 35),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Prices(price: 1),
                  Prices(price: 2),
                  Prices(price: 5),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              translate(Keys.tips_other_amount),
              style: TextStyle(
                color: Colors.red,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text(translate(Keys.tips_confirm_btn)),
                color: Colors.blue.withGreen(10),
                textColor: Colors.white,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              child: Text(
                translate(Keys.tips_cancel_btn),
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Prices extends StatelessWidget {
  final double price;

  const Prices({Key key, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 35,
        backgroundColor:
            (price == 2.0) ? Colors.blue.withGreen(10) : Colors.grey[200],
        child: Text(
          '\$$price',
          style: textStyle.headline6.copyWith(
            color: (price == 2.0) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
