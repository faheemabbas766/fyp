import 'package:flutter/material.dart';
import 'package:fyp/core/global/global.dart';
import 'package:fyp/core/services/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/navigator_service.dart';
import '../../../routes/app_routes.dart';
import '../models/login_model.dart';
class LoginProvider extends ChangeNotifier {
  TextEditingController cnicNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel loginModelObj = LoginModel();

  bool isShowPassword = true;

  @override
  void dispose() {
    super.dispose();
    cnicNumberController.dispose();
    passwordController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
  Future<void> login(BuildContext context) async {
    Map<String, String> requestBody = {
      'cnic': cnicNumberController.text,
      'password': passwordController.text,
    };
    try{
      dynamic response = await BaseService.postRequest("Auth/Login", requestBody);
      SharedPreferences pref = await SharedPreferences.getInstance();
      response.forEach((key, value) {
        pref.setString(key, value.toString());
      });
      GlobalData.showSnackBar("Login Successful!", context);
      print(response.toString());
      Set<String> keys = pref.getKeys();
      for (String key in keys) {
        print('$key: ${pref.get(key)}');
      }
      if(response['role']=='Admin'){
        NavigatorService.pushNamed(
          AppRoutes.admindashboardScreen,
        );
      }else{
        NavigatorService.pushNamed(
          AppRoutes.homeScreen,
        );
      }
    }catch(e){
      GlobalData.showSnackBar("Login Failed:::${e.toString()}", context);
      print(e);
    }
  }
}
