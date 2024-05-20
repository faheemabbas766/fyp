import 'package:flutter/material.dart';
import '../models/dashboard1_model.dart';

/// A provider class for the Dashboard1Screen.
///
/// This provider manages the state of the Dashboard1Screen, including the
/// current dashboard1ModelObj
class Dashboard1Provider extends ChangeNotifier {
  Dashboard1Model dashboard1ModelObj = Dashboard1Model();

  @override
  void dispose() {
    super.dispose();
  }
}
