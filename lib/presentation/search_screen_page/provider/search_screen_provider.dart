import 'package:flutter/material.dart';
import 'package:fyp/core/global/global.dart';
import 'package:fyp/data/models/politician_model.dart';

class SearchScreenProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  List<Politician> searchList = [];

  SearchScreenProvider() {
    searchController.addListener(search);
  }

  void search() {
    final query = searchController.text.toLowerCase();
    searchList = GlobalData.allPoliticianList
        .where((politician) =>
        politician.userFullName.toLowerCase().contains(query))
        .toList();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.removeListener(search);
    searchController.dispose();
    super.dispose();
  }
}
