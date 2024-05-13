import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/adminreportsscreen_model.dart';

/// A provider class for the AdminreportsScreen.
///
/// This provider manages the state of the AdminreportsScreen, including the
/// current adminreportsscreenModelObj

// ignore_for_file: must_be_immutable
class AdminreportsscreenProvider extends ChangeNotifier {
  AdminreportsscreenModel adminreportsscreenModelObj =
      AdminreportsscreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
