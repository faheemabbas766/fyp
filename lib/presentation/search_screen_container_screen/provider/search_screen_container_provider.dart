import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/search_screen_container_model.dart';

/// A provider class for the SearchScreenContainerScreen.
///
/// This provider manages the state of the SearchScreenContainerScreen, including the
/// current searchScreenContainerModelObj

// ignore_for_file: must_be_immutable
class SearchScreenContainerProvider extends ChangeNotifier {
  SearchScreenContainerModel searchScreenContainerModelObj =
      SearchScreenContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
