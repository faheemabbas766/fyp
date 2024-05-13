import 'package:flutter/material.dart';
import 'package:fyp/core/services/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/global/global.dart';
import '../models/dashboard_model.dart';
class DashboardProvider extends ChangeNotifier {
  PostDashboardModel? dashboardModelObj;
  bool isShowLoading = true;
  late List<PostDashboardModel> allPosts;

  Future<List<PostDashboardModel>> getAllPosts() async {
    Map<String, String> requestBody ={
      'cnic':GlobalData.prefs.getString('cnic')!,
    };
    dynamic response = await BaseService.postRequest("Main/AllPost", requestBody);
    final parsed = response.cast<Map<String, dynamic>>();
    return parsed.map<PostDashboardModel>((json) => PostDashboardModel.fromJson(json)).toList();
  }
  void notifier(){
    notifyListeners();
  }
  Future<List<PostDashboardModel>> ratePost(int index) async {
    Map<String, String> requestBody = {
      'postId':allPosts[index].postId.toString(),
      'score':allPosts[index].rate_score.toString(),
      'cnic':GlobalData.prefs.getString('cnic')!,
    };
    dynamic response = await BaseService.postRequest("Main/RatePost", requestBody);
    final parsed = response.cast<Map<String, dynamic>>();
    return parsed.map<PostDashboardModel>((json) => PostDashboardModel.fromJson(json)).toList();
  }
  Future<bool> FollowById(String accountCnic) async {
    Map<String, String> requestBody = {
      'userCnic':GlobalData.prefs.getString('cnic')!,
      'accountCnic':accountCnic,
    };
    dynamic response = await BaseService.postRequest("Main/FollowById", requestBody);
    return true;
  }
  loadData() async {
    allPosts = await getAllPosts();
    isShowLoading = false;
    notifyListeners();
  }
  @override
  void dispose() {
    super.dispose();
  }
}
