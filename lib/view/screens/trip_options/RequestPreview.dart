import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/view/widgets/DashLine.dart';
import 'package:uber_concept/localization/keys.dart';

import 'global_sections/DistanceInfo.dart';
import 'global_sections/DriverInfo.dart';
import 'global_sections/RequestButton.dart';

class RequestPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: PreviewCard(),
    );
  }
}

class PreviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DriverInfo(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: PlacesPreview(),
            ),
            Divider(height: 1, color: Colors.grey[300]),
            DistanceInfo(
              confirmButton: RequestButton(
                title: translate(Keys.trip_preview_btn_title),
                color: Colors.black.withGreen(30),
                pressAction: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlacesPreview extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Theme.of(context);
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.my_location,
                  color: Theme.of(context).primaryColor,
                  size: 25,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        translate(Keys.trip_preview_trip_loc_ft_loc),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: lang == 'ar' ? 6 : 10),
                      Divider(height: 1, color: Colors.grey[300]),
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomPaint(
            painter: DashLine(
              lang == 'ar' ? -12.5 : 12.5,
              -7,
              15,
            ),
          ),
          SizedBox(height: lang == 'ar' ? 4 : 8),
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 25,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '105 William St, Chicago, US',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}