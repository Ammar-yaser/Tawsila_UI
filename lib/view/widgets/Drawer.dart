import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';
import 'package:uber_concept/global_exports.dart';

class GlobalDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              UserInfo(lang: lang),
              Container(
                margin: EdgeInsets.only(
                  left: lang == 'ar' ? 0 : size.width * 0.1,
                  right: lang == 'ar' ? size.width * 0.1 : 0,
                ),
                child: Column(
                  children: <Widget>[
                    DrawerTaps(
                      title: translate(Keys.home_drawer_title_1),
                      icon: Icons.home,
                      pageToGo: Home(),
                    ),
                    DrawerTaps(
                      title: translate(Keys.home_drawer_title_2),
                      icon: Icons.account_balance_wallet,
                      pageToGo: Wallet(),
                    ),
                    DrawerTaps(
                      title: translate(Keys.home_drawer_title_3),
                      icon: Icons.history,
                      pageToGo: History(),
                    ),
                    DrawerTaps(
                      title: translate(Keys.home_drawer_title_4),
                      icon: Icons.notifications,
                      pageToGo: Notifications(),
                    ),
                    DrawerTaps(
                      title: translate(Keys.home_drawer_title_5),
                      icon: Icons.card_giftcard,
                      pageToGo: InviteFriends(),
                    ),
                    DrawerTaps(
                      title: translate(Keys.home_drawer_title_6),
                      icon: Icons.settings,
                      pageToGo: Settings(),
                    ),
                    DrawerTaps(
                      title: translate(Keys.home_drawer_title_7),
                      icon: Icons.exit_to_app,
                      pageToGo: Home(),
                    ),
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

class UserInfo extends StatelessWidget {
  final String lang;
  UserInfo({@required this.lang});
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      margin: const EdgeInsets.only(bottom: 25),
      accountName: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          'Ammar Yasser',
          style:
              Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),
        ),
      ),
      accountEmail: Container(
        padding: lang == 'ar'
            ? const EdgeInsets.fromLTRB(2, 1, 5, 1)
            : const EdgeInsets.fromLTRB(10, 1, 2, 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              translate(Keys.home_drawer_hm_money),
              style: TextStyle(fontSize: 13),
            ),
            Text(
              '2500',
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              lang == 'ar'
                  ? Icons.keyboard_arrow_left
                  : Icons.keyboard_arrow_right,
              size: 15,
              color: Colors.grey,
            )
          ],
        ),
      ),
      currentAccountPicture: InkWell(
        onTap: () {
          print('image');
        },
        child: CircleAvatar(
          radius: 40,
          child: Icon(
            Icons.camera_alt,
            size: 40,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class DrawerTaps extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget pageToGo;

  const DrawerTaps({Key key, this.title, this.icon, this.pageToGo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => pageToGo),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.grey, size: 25),
            SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
