import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/switchaccount_model.dart';

/// A provider class for the SwitchaccountScreen.
///
/// This provider manages the state of the SwitchaccountScreen, including the
/// current switchaccountModelObj
class SwitchaccountProvider extends ChangeNotifier {
  SwitchaccountModel switchaccountModelObj = SwitchaccountModel();

  String radioGroup = "";

  @override
  void dispose() {
    super.dispose();
  }

  void changeRadioButton1(String value) {
    radioGroup = value;
    notifyListeners();
  }
}
