import 'package:flutter/material.dart';

class ArrowIcon extends StatelessWidget {
  final String lang;
  const ArrowIcon({this.lang = 'en'});

  @override
  Widget build(BuildContext context) {
    return Icon(
      lang == 'ar' ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
      color: Colors.grey[500],
    );
  }
}
