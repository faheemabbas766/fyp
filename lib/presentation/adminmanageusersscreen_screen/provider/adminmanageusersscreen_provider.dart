import 'package:flutter/material.dart';
import '../models/adminmanageusersscreen_model.dart';

/// A provider class for the AdminmanageusersScreen.
///
/// This provider manages the state of the AdminmanageusersScreen, including the
/// current adminmanageusersscreenModelObj

// ignore_for_file: must_be_immutable
class AdminmanageusersscreenProvider extends ChangeNotifier {
  AdminmanageusersscreenModel adminmanageusersscreenModelObj =
      AdminmanageusersscreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
