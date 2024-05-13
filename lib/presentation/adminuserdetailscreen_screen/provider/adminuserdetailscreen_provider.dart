import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/adminuserdetailscreen_model.dart';

/// A provider class for the AdminuserdetailScreen.
///
/// This provider manages the state of the AdminuserdetailScreen, including the
/// current adminuserdetailscreenModelObj

// ignore_for_file: must_be_immutable
class AdminuserdetailscreenProvider extends ChangeNotifier {
  AdminuserdetailscreenModel adminuserdetailscreenModelObj =
      AdminuserdetailscreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
