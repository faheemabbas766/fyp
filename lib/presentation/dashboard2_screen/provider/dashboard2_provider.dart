import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/dashboard2_model.dart';

/// A provider class for the Dashboard2Screen.
///
/// This provider manages the state of the Dashboard2Screen, including the
/// current dashboard2ModelObj

// ignore_for_file: must_be_immutable
class Dashboard2Provider extends ChangeNotifier {
  Dashboard2Model dashboard2ModelObj = Dashboard2Model();

  @override
  void dispose() {
    super.dispose();
  }
}
