import 'package:flutter/material.dart';
import '../../../core/global/global.dart';
import '../../../core/services/base_service.dart';
import '../models/following_model.dart';

class FollowingProvider extends ChangeNotifier {
  bool isShowLoading= true;
  late List<FollowingModel> followingList;
  loadData() async {
    followingList = await getAllFollowing();
    isShowLoading = false;
    notifyListeners();
  }
  Future<List<FollowingModel>> getAllFollowing() async {
    Map<String, String> requestBody = {
      'cnic': GlobalData.prefs.getString('cnic')!,
    };
    dynamic response = await BaseService.postRequest("Main/AllFollowing", requestBody);
    final parsed = response.cast<Map<String, dynamic>>();
    return parsed.map<FollowingModel>((json) => FollowingModel.fromJson(json)).toList();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
