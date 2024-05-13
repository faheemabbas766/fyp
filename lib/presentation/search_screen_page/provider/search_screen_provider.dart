import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/search_screen_model.dart';

/// A provider class for the SearchScreenPage.
///
/// This provider manages the state of the SearchScreenPage, including the
/// current searchScreenModelObj

// ignore_for_file: must_be_immutable
class SearchScreenProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  SearchScreenModel searchScreenModelObj = SearchScreenModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
