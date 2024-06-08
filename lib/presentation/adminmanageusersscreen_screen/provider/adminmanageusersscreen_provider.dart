import 'package:flutter/material.dart';
import '../../../core/services/base_service.dart';
import '../models/adminmanageusersscreen_model.dart';

class AdminManageUsersScreenProvider extends ChangeNotifier {
  List<RequestModel> allRequests = [];
  bool isShowLoading = true;

  AdminManageUsersScreenProvider() {
    loadData();
  }

  Future<void> getAllReports() async {
    dynamic response = await BaseService.postRequest("Admin/AllUpgradeRequests", null);
    final parsed = response.cast<Map<String, dynamic>>();
    allRequests = parsed.map<RequestModel>((json) => RequestModel.fromJson(json)).toList();
    isShowLoading = false;
    notifyListeners();
  }

  Future<void> loadData() async {
    try {
      await getAllReports();
    } catch (e) {
      isShowLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
