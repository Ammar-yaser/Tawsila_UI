import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

class DistanceInfo extends StatelessWidget {
  final Widget confirmButton;

  const DistanceInfo({this.confirmButton});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/car.png', width: 70),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      DistanceInfoItem(
                        title: translate(Keys.select_driver_distance_title),
                        subtitle:
                            '0.2 ${translate(Keys.select_driver_distance_measureing_unit)}',
                      ),
                      DistanceInfoItem(
                        title: translate(Keys.select_driver_time_title),
                        subtitle:
                            '2 ${translate(Keys.select_driver_time_measureing_unit)}',
                      ),
                      DistanceInfoItem(
                        title: translate(Keys.select_driver_price_title),
                        subtitle: '\$25.00',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          confirmButton,
              
          SizedBox(height: 10)
        ],
      ),
    );
  }
}

class DistanceInfoItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const DistanceInfoItem({Key key, this.title, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: theme.caption.copyWith(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(subtitle, style: theme.subtitle2),
        ],
      ),
    );
  }
}