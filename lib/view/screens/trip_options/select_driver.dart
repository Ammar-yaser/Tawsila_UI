import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:uber_concept/providers/make_request/PanelContollers.dart';
import 'package:uber_concept/localization/keys.dart';

import 'ConfirmBookingAlert.dart';
import 'global_sections/DistanceInfo.dart';
import 'global_sections/DriverInfo.dart';
import 'global_sections/RequestButton.dart';

class SelectDriver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 35),
      child: Swiper(
        itemCount: 3,
        scrollDirection: Axis.vertical,
        curve: Curves.linear,
        itemWidth: 300.0,
        itemHeight: 250,
        duration: 300,
        // autoplay: true,
        scale: 0,
        fade: 0,        
        layout: SwiperLayout.STACK,
        itemBuilder: (_, index) {
          return DriverCard();
        },
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    ThemeData theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DriverInfo(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                children: <Widget>[
                  recommendationImage(),
                  recommendationImage(),
                  recommendationImage(),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '25 ${translate(Keys.select_driver_recommend)}',
                      style: theme.textTheme.subtitle2,
                    ),
                  )
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey[300]),
            DistanceInfo(
              confirmButton: RequestButton(
                title: translate(Keys.select_driver_btn_title),
                pressAction: () async {
                  bool result = await showCupertinoDialog(
                    context: context,
                    builder: (_) => ConfirmBooking(),
                  );
                  if (result) {
                    panelControllers.driverAnimateController.reverse();
            panelControllers.previewAnimateController.forward();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recommendationImage() {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: CircleAvatar(
        radius: 12,
        backgroundImage: AssetImage('assets/images/person.jpg'),
      ),
    );
  }
}
