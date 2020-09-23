import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

// packages
import 'package:google_maps_flutter/google_maps_flutter.dart';

// pages and widgets classes
import 'package:uber_concept/view/widgets/Drawer.dart';
import 'home_panel.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffold,
      drawer: GlobalDrawer(),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            GoogleMapWidget(),
            SafeArea(
              child: InkWell(
                onTap: () {
                  _scaffold.currentState.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                  ),
                ),
              ),
            ),
            HomePanel(),
          ],
        ),
      ),
    );
  }
}

class GoogleMapWidget extends StatefulWidget {
  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  Completer<GoogleMapController> _controller;
  BitmapDescriptor myIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getBytesFromCanvas(40, 40),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(30.033333, 31.233334),
                    zoom: 18,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    // _controller.complete(controller);
                    // print('hello');
                  },
                  compassEnabled: true,
                  circles: {
                    Circle(
                        circleId: CircleId('name'),
                        radius: 30,
                        center: LatLng(30.033333, 31.233334),
                        fillColor:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                        strokeWidth: 0)
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('name'),
                      position: LatLng(30.033333, 31.233334),
                      icon: BitmapDescriptor.fromBytes(snapshot.data),
                      anchor: Offset(0.5, 0.5),
                    ),
                  },
                  onTap: (position) {
                    print(position.latitude);
                  },
                ),
              );
            } else {
              return Text('error');
            }
          },
        ));
  }

  Future<Uint8List> getBytesFromCanvas(int width, int height) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.blue;
    final Radius radius = Radius.circular(40.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
}
