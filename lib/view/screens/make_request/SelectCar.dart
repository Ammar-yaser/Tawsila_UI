import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uber_concept/providers/make_request/PanelContollers.dart';
import 'package:uber_concept/localization/keys.dart';

class SelectCar extends StatefulWidget {
  @override
  _SelectCarState createState() => _SelectCarState();
}

class _SelectCarState extends State<SelectCar> {
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
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
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
              CarDetails(
                name: translate(Keys.select_car_cars_near),
                price: 25.00,
                time: 2,
                distance: 0,
                onSelect: () {
                  carsController.close();
                  panelControllers.reqOptcontroller.open();
                },
              ),
              Divider(),
              CarDetails(
                name: translate(Keys.select_car_cars_limousine),
                price: 80.00,
                time: 5,
                distance: 0.2,
                selected: true,
                onSelect: () {
                  // panelControl.close();
                },
              ),
              Divider(),
              CarDetails(
                name: translate(Keys.select_car_cars_luxury),
                price: 50.00,
                time: 3,
                distance: 0.4,
                onSelect: () {
                  // panelControl.close();
                  print('hello');
                },
              ),
              Divider(),
              CarDetails(
                name: translate(Keys.select_car_cars_electric_car),
                price: 25.00,
                time: 2,
                distance: 0.45,
              ),
              Divider(),
              CarDetails(
                name: translate(Keys.select_car_cars_bike),
                price: 15.00,
                time: 3,
                distance: 0.48,
              ),
              Divider(),
              CarDetails(
                name: translate(Keys.select_car_cars_taxi_4),
                price: 30.00,
                time: 4,
                distance: 0.5,
              ),
              Divider(),
              CarDetails(
                name: translate(Keys.select_car_cars_taxi_7),
                price: 40.00,
                time: 4,
                distance: 0.67,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarDetails extends StatelessWidget {
  final IconData carIcon;
  final String name;
  final double distance;
  final double price;
  final double time;
  final bool selected;
  final double iconSize;
  final Function onSelect;

  const CarDetails({
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
                    distance == 0
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
