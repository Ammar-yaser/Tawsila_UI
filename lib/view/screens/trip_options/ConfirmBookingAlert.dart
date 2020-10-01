import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:uber_concept/providers/make_request/PanelContollers.dart';

class ConfirmBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CupertinoAlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              size: 100,
              color: theme.primaryColor,
            ),
            SizedBox(height: 10),
            Text(
              'Booking Successful',
              style: theme.textTheme.headline4.copyWith(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Your booking has been confirmed.\nDriver will pickup you in 2 minutes',
              style: theme.textTheme.caption,
            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        FlatButton(
          child: Text('Done'),
          textColor: theme.primaryColor,
          onPressed: () {
            Navigator.of(context).pop(true);
            
          },
        ),
      ],
    );
  }
}
