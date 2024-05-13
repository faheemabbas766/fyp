import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/admindashboardscreen_model.dart';

/// A provider class for the AdmindashboardScreen.
///
/// This provider manages the state of the AdmindashboardScreen, including the
/// current admindashboardscreenModelObj

// ignore_for_file: must_be_immutable
class AdmindashboardscreenProvider extends ChangeNotifier {
  AdmindashboardscreenModel admindashboardscreenModelObj =
      AdmindashboardscreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
