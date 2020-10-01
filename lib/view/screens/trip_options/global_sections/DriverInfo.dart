import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DriverInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100].withOpacity(0.6),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage('assets/images/person.jpg'),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Gregory Smith',
                      style: theme.textTheme.headline4.copyWith(fontSize: 15)),
                  Row(
                    children: <Widget>[
                      RatingBarIndicator(
                        rating: 0.7,
                        unratedColor: Colors.white,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 1,
                        itemSize: 24.0,
                        direction: Axis.vertical,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${5 * 0.7}',
                        style: theme.textTheme.caption.copyWith(fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // TODO: open chat page
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withGreen(12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(Icons.chat, size: 20, color: Colors.white),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(Icons.call, size: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}