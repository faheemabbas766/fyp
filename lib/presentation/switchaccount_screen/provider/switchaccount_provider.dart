import 'package:flutter/material.dart';
import '../models/switchaccount_model.dart';

class SwitchAccountProvider extends ChangeNotifier {
  String? radioGroup;
  String? platform;
  String? position;
  Party? selectedParty;

  void updateSelectedParty(Party value) {
    selectedParty = value;
    platform = value.partyName; // Update platform when the party is selected
    notifyListeners();
  }

  void changeRadioButton(String? value) {
    radioGroup = value;
    platform = null;
    position = null;
    selectedParty = null; // Reset selected party when the role changes
    notifyListeners();
  }

  void updatePlatform(String value) {
    platform = value;
    notifyListeners();
  }

  void updatePosition(String value) {
    position = value;
    notifyListeners();
  }
}
