import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';
import 'package:uber_concept/view/widgets/ArrowIcon.dart';

class Settings extends StatelessWidget {
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
            padding: EdgeInsets.fromLTRB(30, 0, 10, 15),
            color: Theme.of(context).primaryColor,
            child: Text(
              translate(Keys.settings_title),
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 22, color: Colors.white),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  AccountSetting(),
                  SizedBox(height: 20),
                  AppSettings(),
                  SizedBox(height: 20),
                  OurSettings(),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[200]),
                          top: BorderSide(color: Colors.grey[200]),
                        ),
                      ),
                      width: double.infinity,
                      child: Text(
                        translate(Keys.settings_logout_btn),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class AccountSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (BuildContext context) => Account()),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey[200]),
            bottom: BorderSide(color: Colors.grey[200]),
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 28,
            child: Icon(
              Icons.person,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Larry Davis',
            style: Theme.of(context).textTheme.headline4,
          ),
          subtitle: Text(translate(Keys.settings_membership)),
          trailing: ArrowIcon(lang: lang),
        ),
      ),
    );
  }
}

class AppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]),
        ),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Container(
          margin: EdgeInsets.only(
            left: lang == 'ar' ? 0 : 15,
            right: lang == 'ar' ? 15 : 0,
          ),
          child: Column(
            children: <Widget>[
              SettingItem(
                title: translate(Keys.settings_notify),
              ),
              SettingItem(
                title: translate(Keys.settings_security),
              ),
              SettingItem(
                title: translate(Keys.settings_lang),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OurSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]),
        ),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Container(
          margin: EdgeInsets.only(
            left: lang == 'ar' ? 0 : 15,
            right: lang == 'ar' ? 15 : 0,
          ),
          child: Column(
            children: <Widget>[
              SettingItem(title: translate(Keys.settings_cache)),
              SettingItem(title: translate(Keys.settings_policy)),
              SettingItem(title: translate(Keys.settings_us)),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;

  const SettingItem({this.title});
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Container(
      padding: EdgeInsets.only(
        left: lang == 'ar'? 5 : 0,
        top: 6,
        right: lang == 'ar'? 0 : 5,
        bottom: 6,
      ),
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
          ArrowIcon(lang: lang),
        ],
      ),
    );
  }
}
