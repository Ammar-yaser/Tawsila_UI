import 'package:flutter/animation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelControllers {
  PanelController _carscontroller;
  PanelController _reqOptcontroller;
  PanelController _promoCodecontroller;
  AnimationController _driverAnimateController;
  AnimationController _previewAnimateController;

  // select car panel controller
  void setCarscontroller(PanelController controller) =>
      _carscontroller = controller;
  PanelController get carscontroller => _carscontroller;

  // Request options panel controller
  void setReqOptcontroller(PanelController controller) =>
      _reqOptcontroller = controller;
  PanelController get reqOptcontroller => _reqOptcontroller;

  // promocode panel controller
  void setPromoCodecontroller(PanelController controller) =>
      _promoCodecontroller = controller;
  PanelController get promoCodecontroller => _promoCodecontroller;

  // select driver section animation controller
  void setDriverController(AnimationController controller) =>
      _driverAnimateController = controller;
  AnimationController get driverAnimateController => _driverAnimateController;

  // select driver section animation controller
  void setPreviewController(AnimationController controller) =>
      _previewAnimateController = controller;
  AnimationController get previewAnimateController => _previewAnimateController;
}
