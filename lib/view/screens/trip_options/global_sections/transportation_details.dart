import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

class TransportationDetails extends StatelessWidget {
  final IconData carIcon;
  final String name;
  final double distance;
  final double price;
  final double time;
  final bool selected;
  final double iconSize;
  final Function onSelect;

  const TransportationDetails({
    Key key,
    this.carIcon,
    @required this.name,
    @required this.distance,
    @required this.price,
    @required this.time,
    this.selected = false,
    this.iconSize,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size query = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onSelect,
      child: Container(
        height: iconSize == null ? 50 : null,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: <Widget>[
            Image.asset('assets/images/car.png', width: iconSize ?? 70),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    name,
                    style: theme.textTheme.headline6.copyWith(fontSize: 16),
                  ),
                  Text(
                    distance == 0.0
                        ? 'Near by you'
                        : '$distance ${translate(Keys.select_driver_distance_measureing_unit)}',
                    style: theme.textTheme.caption.copyWith(fontSize: 14),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '\$$price',
                    style: theme.textTheme.headline6,
                  ),
                  Text(
                    '$time ${translate(Keys.select_driver_time_measureing_unit)}',
                    style: theme.textTheme.caption.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}