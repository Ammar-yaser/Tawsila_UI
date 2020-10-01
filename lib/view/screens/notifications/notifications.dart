import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
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
            padding: EdgeInsets.fromLTRB(
              lang == 'ar' ? 10 : 30,
              0,
              lang == 'ar' ? 30 : 10,
              20,
            ),
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  translate(Keys.notification_title),
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white),
                ),
                CircleAvatar(
                    radius: 20,
                    child: Icon(
                      Icons.delete,
                      size: 25,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.1)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (_, index) {
                return NotificationForm();
              },
            ),
          )
        ],
      )),
    );
  }
}

class NotificationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200],
          ),
        ),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[400],
            child: Icon(Icons.system_update_alt, color: Colors.white, size: 20),
          ),
          SizedBox(width: 10),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'System',
                  style:
                      Theme.of(context).textTheme.headline4.copyWith(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Your booking #1234 has been suc...',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
