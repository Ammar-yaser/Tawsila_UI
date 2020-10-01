import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'ArrowIcon.dart';
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