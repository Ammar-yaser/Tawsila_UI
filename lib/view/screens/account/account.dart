import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/view/widgets/ArrowIcon.dart';
import 'package:uber_concept/localization/keys.dart';
import '../VerifyPhone.dart';

class Account extends StatelessWidget {
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
              padding: EdgeInsets.only(bottom: 20),
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 30),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          translate(Keys.account_title),
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        ),
                        CircleAvatar(
                          radius: 22,
                          backgroundImage:
                              AssetImage('assets/images/person.jpg'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(
                        lang == 'ar' ? 3 : 15,
                        6,
                        lang == 'ar' ? 15 : 5,
                        6,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[200]),
                          top: BorderSide(color: Colors.grey[200]),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            translate(Keys.account_acc_level_title),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                translate(Keys.account_acc_level_level),
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                              ArrowIcon(lang: lang),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    PersonalInfo(),
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

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        margin: EdgeInsets.only(
            left: lang == 'ar' ? 0 : 15, right: lang == 'ar' ? 15 : 0),
        child: Column(
          children: <Widget>[
            StandardPersonalInfo(
              title: translate(Keys.account_acc_name_title),
              subtitle: 'Larry Davis',
            ),
            StandardPersonalInfo(
              title: translate(Keys.account_acc_email),
              subtitle: 'freeslab88@gmail.com',
            ),
            StandardPersonalInfo(
              title: translate(Keys.account_acc_gender_title),
              subtitle: translate(Keys.account_acc_gender_gender),
            ),
            StandardPersonalInfo(
              title: translate(Keys.account_acc_birth_title),
              subtitle: translate(Keys.account_acc_birth_birth),
              tapAction: () {
                selectBirthday(context);
              },
            ),
            StandardPersonalInfo(
              title: translate(Keys.account_acc_num),
              subtitle: '+84905070017',
              tapAction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyPhone()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void selectBirthday(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Text(
                  translate(Keys.account_acc_birth_title),
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: 17,
                      ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 160,
                  child: CupertinoDatePicker(
                    onDateTimeChanged: (date) {
                      print(date);
                    },
                    initialDateTime: DateTime(2000, 3, 6),
                    mode: CupertinoDatePickerMode.date,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                child: RaisedButton(
                  child: Text('Save'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  onPressed: () {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class StandardPersonalInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function tapAction;

  const StandardPersonalInfo(
      {Key key, this.title, this.subtitle, this.tapAction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return GestureDetector(
      onTap: tapAction,
      child: Container(
        padding: lang == 'ar'
            ? const EdgeInsets.fromLTRB(0, 10, 5, 10)
            : const EdgeInsets.fromLTRB(0, 10, 5, 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[200]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Row(
              children: <Widget>[
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                ),
                ArrowIcon(lang: lang),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
