import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uber_concept/localization/keys.dart';
import 'package:uber_concept/providers/make_request/PanelContollers.dart';
import 'package:uber_concept/view/screens/trip_options/global_sections/transportation_details.dart';

class TripOptionsPanel extends StatefulWidget {
  @override
  _TripOptionsPanelState createState() => _TripOptionsPanelState();
}

class _TripOptionsPanelState extends State<TripOptionsPanel> {
  PanelController reqOptController;
  @override
  void initState() {
    super.initState();
    reqOptController = PanelController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    panelControllers.setReqOptcontroller(reqOptController);
  }

  @override
  Widget build(BuildContext context) {
    Size query = MediaQuery.of(context).size;
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    return SlidingUpPanel(
      minHeight: 0,
      maxHeight: (query.height / 3) + 30,
      isDraggable: false,
      defaultPanelState: PanelState.OPEN,
      borderRadius: BorderRadius.circular(20),
      controller: reqOptController,
      color: Colors.white,
      panel: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10),
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
              // Select Transportation
              Flexible(
                flex: 1,
                child: TransportationDetails(
                  name: translate(Keys.select_car_cars_near),
                  time: 2,
                  price: 25.00,
                  distance: 0,
                  iconSize: 80,
                  onSelect: () {
                    reqOptController.close();
                    panelControllers.carscontroller.open();
                  },
                ),
              ),
              Expanded(flex: 2, child: Options())
            ],
          ),
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size query = MediaQuery.of(context).size;
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: CustomizeOptions(),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: query.width,
              child: RaisedButton(
                child: Text(
                  translate(Keys.customize_details_confirm_btn),
                ),
                color: theme.primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onPressed: () {
                  panelControllers.reqOptcontroller.close();
                  panelControllers.driverAnimateController.forward();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomizeOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomizeOptionsItem(
            icon: Icons.account_balance_wallet,
            title: translate(Keys.customize_details_options_payment),
          ),
          SizedBox(
            height: 45,
            child: VerticalDivider(
              width: 1,
              color: Colors.grey[300],
            ),
          ),
          CustomizeOptionsItem(
            icon: Icons.card_giftcard,
            title: translate(Keys.customize_details_options_code),
            optionAction: () {
              panelControllers.reqOptcontroller.close();
              panelControllers.promoCodecontroller.open();
            },
          ),
          SizedBox(
            height: 45,
            child: VerticalDivider(
              width: 1,
              color: Colors.grey[300],
            ),
          ),
          CustomizeOptionsItem(
            icon: Icons.settings,
            title: translate(
              Keys.customize_details_options_options,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomizeOptionsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function optionAction;

  const CustomizeOptionsItem(
      {Key key, this.icon, this.title, this.optionAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: optionAction,
      child: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Container(
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                title,
                style: theme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
