import 'package:flutter/material.dart';
import '../models/setting_model.dart';

/// A provider class for the SettingScreen.
///
/// This provider manages the state of the SettingScreen, including the
/// current settingModelObj
class SettingProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  SettingModel settingModelObj = SettingModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
