import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:uber_concept/providers/registration/Login_state.dart';
import 'view/screens/app_intro/AppIntro.dart';
import 'view/widgets/ArrowIcon.dart';
import 'providers/registration/Signup_state.dart';
import 'utilities/validators/FormsValidation.dart';
import 'localization/keys.dart';
import 'view/screens/account/account.dart';
import 'package:uber_concept/view/screens/GetStarted.dart';
import 'package:uber_concept/view/screens/History.dart';
import 'package:uber_concept/view/screens/InviteFriends.dart';
import 'package:uber_concept/view/screens/make_request/MakeRequest.dart';
import 'package:uber_concept/view/screens/Notifications.dart';
import 'package:uber_concept/view/screens/Payment.dart';
import 'package:uber_concept/view/screens/Settings.dart';
import 'package:uber_concept/view/screens/VerifyPhone.dart';
import 'package:uber_concept/view/screens/Wallet.dart';
import 'view/screens/chat/chat.dart';
import 'view/screens/make_request/PromocodePanel.dart';
import 'view/screens/make_request/RequestOptions.dart';
import 'view/screens/make_request/RequestPreview.dart';
import 'view/screens/make_request/SelectDriver.dart';
import 'view/screens/Rating.dart';
import 'view/screens/registration/Registration.dart';
import 'view/screens/Tips.dart';
import 'view/screens/Home/Home.dart';
import 'view/screens/SelectPlace.dart';

void main() async {
  LocalizationDelegate delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: ['en_US', 'ar'],
  );
  runApp(LocalizedApp(delegate, MyApp()));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MultiProvider(
        providers: [
          Provider<FormsValidation>(
            create: (_) => FormsValidation(),
          ),
          ChangeNotifierProvider<SignupState>(
            create: (_) => SignupState(),
          ),
          ChangeNotifierProvider<LoginState>(
            create: (_) => LoginState(),
          ),
          
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'uber_concept',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            localizationDelegate
          ],
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
          theme: ThemeData(
            primarySwatch: Colors.green,
            primaryColor: const Color(0xff4BE3B0),
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            hintColor: Colors.grey[300],
            textTheme: TextTheme().copyWith(
              headline5: TextStyle(fontWeight: FontWeight.w700)
            ),
            dividerColor: Colors.green[200],
            accentColor: Colors.green,
            disabledColor: Colors.red,
            buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          home: PagesList(), //MakeRequest(),
        ),
      ),
    );
  }
}

class PagesList extends StatelessWidget {
  final Map<String, Widget> pages = {
    translate(Keys.welcome_page_name): AppIntro(),
    translate(Keys.registration_name): Registration(),
    translate(Keys.get_start_name): GetStarted(),
    translate(Keys.home_name): Home(),
    translate(Keys.account_title): Account(),
    translate(Keys.wallet_title): Wallet(),
    translate(Keys.pay_methods_title): Payment(),
    translate(Keys.settings_title): Settings(),
    translate(Keys.history_title): History(),
    translate(Keys.notification_title): Notifications(),
    translate(Keys.select_place_name): SelectPlace(),
    translate(Keys.select_driver_name): MakeRequest(position: SelectDriver()),
    translate(Keys.customize_details_name):
        MakeRequest(child: RequestOptions()),
    translate(Keys.select_car_name):
        MakeRequest(child: RequestOptions(car: true)),
    translate(Keys.promocode_title): MakeRequest(child: PromocodePanel()),
    translate(Keys.trip_preview_name): MakeRequest(position: RequestPreview()),
    translate(Keys.chat_name): Chat(),
    translate(Keys.tips_title): Tips(),
    translate(Keys.rating_title): Rating(),
    translate(Keys.invite_firends_title): InviteFriends(),
    translate(Keys.verification_title): VerifyPhone(),
  };

  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(Keys.pages_list_title),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text('Arabic'),
                  value: 'ar',
                ),
                PopupMenuItem(
                  child: Text('English'),
                  value: 'en',
                )
              ];
            },
            onSelected: (val) {
              switch (val) {
                case 'ar':
                  changeLocale(context, 'ar');
                  break;
                case 'en':
                  changeLocale(context, 'en');
                  break;
              }
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: pages.keys.length,
          itemBuilder: (_, index) {
            String title = pages.keys.toList()[index];
            Widget page = pages[title];
            return Card(
              child: ListTile(
                title: Text(title),
                trailing: ArrowIcon(lang: local.currentLocale.languageCode),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => page),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
