import 'package:flutter/material.dart';
import '../models/switchaccount_model.dart';
class SwitchAccountProvider extends ChangeNotifier {
  SwitchaccountModel switchAccountModelObj = SwitchaccountModel();

  String radioGroup = "MNA";

  @override
  void dispose() {
    super.dispose();
  }

  void changeRadioButton(String value) {
    radioGroup = value;
    notifyListeners();
  }
}
