import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RequestButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback pressAction;
  const RequestButton({this.title, this.color, this.pressAction});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(title),
        color: color ?? theme.primaryColor,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        onPressed: pressAction
      ),
    );
  }
}
