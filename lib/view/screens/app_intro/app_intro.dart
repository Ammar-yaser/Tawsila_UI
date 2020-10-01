import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import '../../../providers/ui_state/intro_state.dart';
import 'app_intro_screens.dart';


class AppIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IntroState>(
      create: (BuildContext context) => IntroState(),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: AppIntroView(),
        ),
      ),
    );
  }
}

class AppIntroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IntroState _pageNum = Provider.of<IntroState>(context, listen: false);
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            children: <Widget>[
              FirstPage(),
              SecondPage(),
              ThirdPage(),
            ],
            onPageChanged: (int page) => _pageNum.currentPage = page,
          ),
        ),
        PageViewIndecator(),
      ],
    );
  }
}

class PageViewIndecator extends StatelessWidget {
  static Alignment align;
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate localDelegate = LocalizedApp.of(context).delegate;
    String lang = localDelegate.currentLocale.languageCode;
    bool isArabic = lang == 'ar';
    return Selector<IntroState, int>(
      selector: (_, introState) => introState.currentPage,
      builder: (_, pageIndex, __) {
        switch (pageIndex) {
          case 0:
            isArabic
                ? align = Alignment.centerRight
                : align = Alignment.centerLeft;
            break;
          case 1:
            align = Alignment.center;
            break;
          case 2:
            isArabic
                ? align = Alignment.centerLeft
                : align = Alignment.centerRight;
            break;
        }
        return Container(
          height: 30,
          alignment: Alignment.topCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            curve: Curves.fastOutSlowIn,
            alignment: align,
            width: 100,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              height: 6,
              width: 100 / 3,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        );
      },
    );
  }
}
