import 'package:flutter/material.dart';
import 'package:fyp/presentation/adminuserdetailscreen_screen/models/adminuserdetailscreen_model.dart';

import '../../../core/global/global.dart';
import '../../../core/services/base_service.dart';
class AdminuserdetailscreenProvider extends ChangeNotifier {
  late AdminRequestProfileModel requestProfile;
  bool isLoading = true;
  loadData() async {
    requestProfile = await getProfileInfoById(GlobalData.profileCnic);
    isLoading = false;
    notifyListeners();
  }
  Future<AdminRequestProfileModel> getProfileInfoById(String ProfileCnic) async {
    Map<String, String> requestBody ={
      'profileCnic':ProfileCnic,
      'cnic':GlobalData.prefs.getString('cnic')!
    };
    dynamic response = await BaseService.postRequest("Main/UserInfoById", requestBody);
    Map<String, dynamic> jsonData = response;
    return AdminRequestProfileModel.fromJson(jsonData);
  }
}
