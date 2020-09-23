import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/view/screens/SelectPlace.dart';
import 'package:uber_concept/localization/keys.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 60),
              Container(
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  children: <Widget>[
                    Text(
                      translate(Keys.get_start_title),
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    Text(
                      translate(Keys.get_start_subtitle),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      child: OutlineButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.send),
                            SizedBox(width: 8),
                            Text(
                              translate(Keys.get_start_my_location),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        textColor: Theme.of(context).primaryColor,
                        highlightedBorderColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SelectPlace(),
                            ),
                          );
                        },
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      translate(Keys.get_start_custom_location),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
