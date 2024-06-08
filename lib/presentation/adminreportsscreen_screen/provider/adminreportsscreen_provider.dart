import 'package:flutter/material.dart';
import '../../../core/services/base_service.dart';
import '../models/adminreportsscreen_model.dart';
class AdminReportsProvider extends ChangeNotifier {
  List<AdminReportModel> allReports = [];
  bool isShowLoading = true;

  Future<void> getAllReports() async {
    dynamic response = await BaseService.postRequest("Admin/AllReports", null);
    final parsed = response.cast<Map<String, dynamic>>();
    allReports = parsed.map<AdminReportModel>((json) => AdminReportModel.fromJson(json)).toList();
    print("Loaded:::::::::::::::::::");
  }
  Future<void> loadData() async {
    try {
      await getAllReports();
      isShowLoading = false;
      notifyListeners();
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
