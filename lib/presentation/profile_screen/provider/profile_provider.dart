import 'package:flutter/material.dart';
import '../models/profile_model.dart';

/// A provider class for the ProfileScreen.
///
/// This provider manages the state of the ProfileScreen, including the
/// current profileModelObj

// ignore_for_file: must_be_immutable
class ProfileProvider extends ChangeNotifier {
  ProfileModel profileModelObj = ProfileModel();

  bool mnaucrwp = false;

  @override
  void dispose() {
    super.dispose();
  }

  void changeCheckBox1(bool value) {
    mnaucrwp = value;
    notifyListeners();
  }
}
