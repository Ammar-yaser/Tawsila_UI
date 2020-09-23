import 'package:flutter/material.dart';

// Language localization
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uber_concept/localization/keys.dart';

// packages
import 'package:sliding_up_panel/sliding_up_panel.dart';

// pages and widgets classes
import 'package:uber_concept/view/widgets/DashLine.dart';

class HomePanel extends StatelessWidget {
  // PanelController _panel = PanelController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return SlidingUpPanel(
      minHeight: lang == 'ar' ? 210 : 200,
      maxHeight: height - 60,
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      // controller: _panel,
      color: Colors.grey[100],
      panel: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 60,
                  height: 5,
                  color: Colors.grey[500],
                ),
              ),
            ),
            TripPoints(),
            SuggestedPlaces(),
            Divider(height: 15, thickness: 15, color: Colors.grey[300]),
            Padding(
              padding: lang == 'ar'
                  ? const EdgeInsets.fromLTRB(0, 20, 18, 10)
                  : const EdgeInsets.fromLTRB(18, 20, 0, 10),
              child: Text(
                translate(Keys.home_fam_locatoins).toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.grey[400]),
              ),
            ),
            Expanded(child: PopularLocations()),
          ],
        ),
      ),
    );
  }
}

class TripPoints extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Container(
      height: lang == 'ar' ? 111 : 90, 
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.my_location,
                  color: Theme.of(context).primaryColor,
                  size: 25,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        translate(Keys.home_ft_point).toUpperCase(),
                        style: theme.textTheme.caption,
                      ),
                      Text(
                        translate(Keys.home_ft_point_loc),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
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
              lang == 'ar' ? -19 : -12,
              lang == 'ar' ? 40 : 30,
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 25,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      translate(Keys.home_sd_point).toUpperCase(),
                      style: theme.textTheme.caption,
                    ),
                    Text(
                      '105 William St, Chicago, US',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
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

class Remove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.my_location,
                color: Theme.of(context).primaryColor,
                size: 25,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      translate(Keys.home_ft_point).toUpperCase(),
                      style: theme.textTheme.caption,
                    ),
                    Text(
                      translate(Keys.home_ft_point_loc),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Divider(height: 1, color: Colors.grey[300]),
                  ],
                ),
              )
            ],
          ),
        ),
        CustomPaint(
          painter: DashLine(0, 0, 30),
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.red,
                size: 25,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(
                      translate(Keys.home_sd_point).toUpperCase(),
                      style: theme.textTheme.caption,
                    ),
                    Text(
                      '105 William St, Chicago, US',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SuggestedPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 8),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          return GestureDetector(
            // onTap: () {},
            child: Card(
              margin: const EdgeInsets.only(right: 8, bottom: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(translate(Keys.home_famous)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PopularLocations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemCount: 10,
      itemBuilder: (_, index) {
        return PopularLocationItem(
          isFav: index == 4 ? true : false,
        );
      },
    );
  }
}

class PopularLocationItem extends StatelessWidget {
  final bool isFav;

  const PopularLocationItem({Key key, this.isFav = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      // height: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200],
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  translate(Keys.home_famous),
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
          ),
          Icon(isFav ? Icons.star : Icons.star_border,
              color: Colors.yellow, size: 32),
        ],
      ),
    );
  }
}
