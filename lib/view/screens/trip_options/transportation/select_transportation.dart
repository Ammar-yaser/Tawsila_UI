import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uber_concept/providers/make_request/PanelContollers.dart';
import 'package:uber_concept/localization/keys.dart';
import 'package:uber_concept/view/screens/trip_options/global_sections/transportation_details.dart';

class SelectTransportation extends StatefulWidget {
  @override
  _SelectTransportationState createState() => _SelectTransportationState();
}

class _SelectTransportationState extends State<SelectTransportation> {
  PanelController carsController;
  @override
  void initState() {
    super.initState();
    carsController = PanelController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    panelControllers.setCarscontroller(carsController);
  }

  @override
  Widget build(BuildContext context) {
    Size query = MediaQuery.of(context).size;

    return SlidingUpPanel(
      minHeight: 0,
      maxHeight: query.height - 100,
      isDraggable: false,
      defaultPanelState: PanelState.CLOSED,
      borderRadius: BorderRadius.circular(20),
      controller: carsController,
      color: Colors.white,
      panel: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              CustomPaint(painter: DropdownArrow()),
              SizedBox(height: 20),
              TransportationList(),
            ],
          ),
        ),
      ),
    );
  }
}

class TransportationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    return Column(
      children: transportations
          .map(
            (trans) => Column(
              children: [
                TransportationDetails(
                  name: trans['name'],
                  price: trans['price'],
                  time: trans['time'].toDouble(),
                  distance: trans['distance'].toDouble(),
                  onSelect: () {
                    panelControllers.carscontroller.close();
                    panelControllers.reqOptcontroller.open();
                  },
                ),
                Divider(),
              ],
            ),
          )
          .toList(),
    );
  }
}

class DropdownArrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(-26, 0);
    final p2 = Offset(0, 15);
    final p3 = Offset(-2, 15);
    final p4 = Offset(27, 0);
    final paint = Paint()
      ..color = Colors.grey[400]
      ..strokeWidth = 4.5;
    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

List<Map<String, dynamic>> transportations = [
  {
    'name': translate(Keys.select_car_cars_near),
    'price': 25.00,
    'time': 2,
    'distance': 0.0,
  },
  {
    'name': translate(Keys.select_car_cars_limousine),
    'price': 80.00,
    'time': 5,
    'distance': 0.2,
    // 'selected': true,
  },
  {
    'name': translate(Keys.select_car_cars_luxury),
    'price': 50.00,
    'time': 3,
    'distance': 0.4,
  },
  {
    'name': translate(Keys.select_car_cars_electric_car),
    'price': 25.00,
    'time': 2,
    'distance': 0.45,
  },
  {
    'name': translate(Keys.select_car_cars_bike),
    'price': 15.00,
    'time': 3,
    'distance': 0.48,
  },
  {
    'name': translate(Keys.select_car_cars_taxi_4),
    'price': 30.00,
    'time': 4,
    'distance': 0.5,
  },
  {
    'name': translate(Keys.select_car_cars_taxi_7),
    'price': 40.00,
    'time': 4,
    'distance': 0.67,
  },
];
