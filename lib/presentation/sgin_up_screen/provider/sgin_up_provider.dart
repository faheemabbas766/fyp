import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/services/base_service.dart';
import '../models/sgin_up_model.dart';

class SginUpProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedTehsil;
  String? selectedUc;
  SginUpModel sginUpModelObj = SginUpModel();
  bool isShowPassword = true;
  bool isMale = false;
  File? _selectedImage;
  ImagePicker _imagePicker = ImagePicker(); // Change the variable name to _imagePicker

  Future<void> pickImage(BuildContext context) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  // Function to get the path of the selected image
  String? getSelectedImagePath() {
    return _selectedImage?.path;
  }

  void setGender(bool? value) {
    isMale = value!;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    cnicController.dispose();
    phoneController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  Future<bool> signUp() async {
    Map<String, String> requestBody = {
      'cnic': cnicController.text,
      'full_name': fullNameController.text,
      'password': passwordController.text,
      'user_province': selectedProvince!,
      'user_district': selectedDistrict!,
      'user_tehsil': selectedTehsil!,
      'user_uc': selectedUc!,
      'user_phone': phoneController.text,
    };
    try {
      String? imagePath = getSelectedImagePath();
      if (imagePath != null) {
        requestBody['image_path'] = imagePath;
      }
      dynamic response = await BaseService.postRequest("Auth/SignUp", requestBody);
      print(response.toString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
