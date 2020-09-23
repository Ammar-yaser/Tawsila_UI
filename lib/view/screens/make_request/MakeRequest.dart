import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:uber_concept/providers/make_request/PanelContollers.dart';
import 'RequestPreview.dart';

import 'PromocodePanel.dart';
import 'RequestOptions.dart';
import 'SelectCar.dart';
import 'SelectDriver.dart';

class MakeRequest extends StatelessWidget {
  final Widget child;
  final Widget position;

  const MakeRequest({Key key, this.child, this.position}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Size query = MediaQuery.of(context).size;
    // ThemeData theme = Theme.of(context);
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    bool isArabic = local.currentLocale.languageCode == 'ar';
    return Provider(
      create: (BuildContext context) => PanelControllers(),
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              RequestMap(),
              Positioned(
                top: 10,
                left: isArabic ? null : -10,
                right: isArabic ? -10 : null,
                child: SafeArea(
                  child: RaisedButton(
                    elevation: 5,
                    shape: CircleBorder(),
                    color: Colors.white,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey[300],
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimateDriverPanel(),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimateReqPreview(),
              ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child: Container(
              //     alignment: Alignment.center,
              //     height: query.height / 2,
              //     child: position != null ? position : Container(),
              //   ),
              // ),
              // child ?? Container(),
              RequestOptions(),
              SelectCar(),
              PromocodePanel(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimateDriverPanel extends StatefulWidget {
  @override
  _AnimateDriverPanelState createState() => _AnimateDriverPanelState();
}

class _AnimateDriverPanelState extends State<AnimateDriverPanel>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    panelControllers.setDriverController(controller);
  }

  @override
  Widget build(BuildContext context) {
    Size query = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Transform(
        transform:
            Matrix4.translationValues(animation.value * query.width, 0, 0),
        child: Container(
          alignment: Alignment.center,
          height: query.height / 2,
          child: SelectDriver(),
        ),
      ),
    );
  }
}

class AnimateReqPreview extends StatefulWidget {
  @override
  _AnimateReqPreviewState createState() => _AnimateReqPreviewState();
}

class _AnimateReqPreviewState extends State<AnimateReqPreview>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    panelControllers.setPreviewController(controller);
  }

  @override
  Widget build(BuildContext context) {
    Size query = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Transform(
        transform:
            Matrix4.translationValues(animation.value * query.width, 0, 0),
        child: Container(
          alignment: Alignment.center,
          height: query.height / 2,
          child: RequestPreview(),
        ),
      ),
    );
  }
}

class RequestMap extends StatefulWidget {
  @override
  _RequestMapState createState() => _RequestMapState();
}

class _RequestMapState extends State<RequestMap> {
  double camZoom = 13;
  double camTilt = 0;
  double camBearing = 30;
  PointLatLng sourceLoc = PointLatLng(42.7477863, -71.1699932);
  PointLatLng destLoc = PointLatLng(42.6871386, -71.2143403);

  Completer<GoogleMapController> _controller = Completer();
  // this set will hold my markers
  Set<Marker> _markers = {};
  // this will hold the generated polylines
  Set<Polyline> _polylines = {};
  // this will hold each polyline coordinate as Lat and Lng pairs
  List<LatLng> polylineCoordinates = [];
  // this is the key object - the PolylinePoints
// which generates every polyline between start and finish
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyDg_SfkX-Vf_VmJHKvYH33CUnFshk14c4I";
  // for my custom icons
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
      zoom: camZoom,
      bearing: camBearing,
      tilt: camTilt,
      target: LatLng(sourceLoc.latitude, sourceLoc.longitude),
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        markers: _markers,
        polylines: _polylines,
        initialCameraPosition: initialLocation,
        onMapCreated: onMapCreated,
        // initialCameraPosition: CameraPosition(
        //   target: LatLng(30.033333, 31.233334),
        //   zoom: 18,
        // ),
        // onMapCreated: (GoogleMapController controller) {
        //   // _controller.complete(controller);
        //   print('hello');
        // },

        // markers: {
        //   Marker(
        //     markerId: MarkerId('name'),
        //     position: LatLng(30.033333, 31.233334),
        //     anchor: Offset(1, 1),
        //     // icon: BitmapDescriptor.defaultMarker,
        //   ),
        // },
        onTap: (position) {
          print(position.latitude);
        },
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    // setMapPins();
    setPolylines();
  }

  setPolylines() async {
    PolylineResult result = await polylinePoints?.getRouteBetweenCoordinates(
      googleAPIKey,
      sourceLoc,
      destLoc,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      Polyline polyline = Polyline(
        polylineId: PolylineId('poly'),
        color: Color.fromARGB(255, 40, 122, 198),
        points: polylineCoordinates,
      );

      _polylines.add(polyline);
    });
  }
}
