import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          translate(Keys.rating_title),
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
            TipsRatingCard(),
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

class TipsRatingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    return Card(
      child: SingleChildScrollView(
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
                translate(Keys.rating_question),
                style: textStyle.headline.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Text(
                translate(Keys.rating_note),
                style: textStyle.caption,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
              Container(
                child: RatingBar(
                  itemSize: 45,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: translate(Keys.rating_field_hint),
                  hintStyle: TextStyle(color: Colors.grey[400])
                ),
                maxLines: 4,
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text(translate(Keys.rating_confrim_btn)),
                  color: Colors.blue.withGreen(10),
                  textColor: Colors.white,
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
