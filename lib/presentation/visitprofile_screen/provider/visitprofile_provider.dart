import 'package:flutter/material.dart';
import '../../../core/global/global.dart';
import '../../../core/services/base_service.dart';
import '../models/visitprofile_model.dart';

class VisitProfileProvider extends ChangeNotifier {
  late VisitProfileModel visitProfile;
  bool isLoading = true;
  loadData() async {
    visitProfile = await getProfileInfoById(GlobalData.profileCnic);
    isLoading = false;
    notifyListeners();
  }
  Future<bool> FollowById() async {
    Map<String, String> requestBody = {
      'userCnic':GlobalData.prefs.getString('cnic')!,
      'accountCnic':GlobalData.profileCnic,
    };
    await BaseService.postRequest("Main/FollowById", requestBody);
    return true;
  }
  Future<VisitProfileModel> getProfileInfoById(String ProfileCnic) async {
    Map<String, String> requestBody ={
      'profileCnic':ProfileCnic,
      'cnic':GlobalData.prefs.getString('cnic')!
    };
    dynamic response = await BaseService.postRequest("Main/UserInfoById", requestBody);
    Map<String, dynamic> jsonData = response;
    return VisitProfileModel.fromJson(jsonData);
  }
  @override
  void dispose() {
    super.dispose();
  }
}
