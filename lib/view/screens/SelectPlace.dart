import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_concept/localization/keys.dart';

import 'package:uber_concept/global_exports.dart';

class SelectPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size query = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    SelectPlaceMap(),
                    SafeArea(child: PlaceSearcher()),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(22),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: IconButton(
                            icon: Icon(
                              Icons.my_location,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: query.width,
              child: RaisedButton(
                child: Text(translate(Keys.select_place_apply_btn)),
                color: theme.primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.only(bottom: 35, top: 20),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MakeRequest()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlaceSearcher extends StatefulWidget {
  @override
  _PlaceSearcherState createState() => _PlaceSearcherState();
}

class _PlaceSearcherState extends State<PlaceSearcher> {
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Icon(
              lang == 'ar' ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
              color: Colors.grey[300],
              size: 30,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Theme.of(context).cardColor,
                  filled: true,
                ),
                cursorColor: Theme.of(context).primaryColor,
                showCursor: false,
              ),
            ),
            Icon(Icons.remove_circle, color: Colors.grey[300], size: 20)
          ],
        ),
      ),
    );
  }
}

class SelectPlaceMap extends StatefulWidget {
  @override
  _SelectPlaceMapState createState() => _SelectPlaceMapState();
}

class _SelectPlaceMapState extends State<SelectPlaceMap> {
  // Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(30.033333, 31.233334),
          zoom: 18,
        ),
        onMapCreated: (GoogleMapController controller) {
          // _controller.complete(controller);
          print('hello');
        },
        markers: {
          Marker(
            markerId: MarkerId('name'),
            position: LatLng(30.033333, 31.233334),
            anchor: Offset(1, 1),
            // icon: BitmapDescriptor.defaultMarker,
          ),
        },
        onTap: (position) {
          print(position.latitude);
        },
      ),
    );
  }
}
