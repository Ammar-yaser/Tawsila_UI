import 'package:flutter/foundation.dart';

class IntroState with ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
}
