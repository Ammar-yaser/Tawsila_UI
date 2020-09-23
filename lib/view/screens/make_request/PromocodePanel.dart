import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uber_concept/localization/keys.dart';
import 'package:uber_concept/providers/make_request/PanelContollers.dart';
import 'package:provider/provider.dart';

class PromocodePanel extends StatefulWidget {
  @override
  _PromocodePanelState createState() => _PromocodePanelState();
}

class _PromocodePanelState extends State<PromocodePanel> {
  PanelController promoCodeController;
  @override
  void initState() {
    super.initState();
    promoCodeController = PanelController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    panelControllers.setPromoCodecontroller(promoCodeController);
  }

  @override
  Widget build(BuildContext context) {
    Size query = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    PanelControllers panelControllers =
        Provider.of<PanelControllers>(context, listen: false);
    return SlidingUpPanel(
      backdropEnabled: true,
      minHeight: 0,
      maxHeight: 200,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      isDraggable: false,
      controller: promoCodeController,
      defaultPanelState: PanelState.CLOSED,
      panel: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                translate(Keys.promocode_title),
                style: theme.textTheme.headline4.copyWith(fontSize: 16),
              ),
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.card_giftcard,
                      color: theme.primaryColor,
                    ),
                    hintText: translate(Keys.promocode_field_hint),
                    contentPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5)
                    // enabledBorder:
                    ),
                showCursor: false,
              ),
            ),
            Container(
              width: query.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                child: Text(translate(Keys.promocode_confirm_btn)),
                color: theme.primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onPressed: () {
                  promoCodeController.close();
                  panelControllers.reqOptcontroller.open();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
