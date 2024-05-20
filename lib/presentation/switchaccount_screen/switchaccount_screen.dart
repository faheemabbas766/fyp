import 'dart:io';
import 'package:fyp/presentation/editprofile_screen/provider/editprofile_provider.dart';
import 'package:fyp/widgets/custom_radio_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import '../../widgets/custom_elevated_button.dart';
import 'provider/switchaccount_provider.dart';

class SwitchAccountScreen extends StatefulWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  SwitchAccountScreenState createState() => SwitchAccountScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SwitchAccountProvider(),
      child: SwitchAccountScreen(),
    );
  }
}

class SwitchAccountScreenState extends State<SwitchAccountScreen> {
  ImagePicker _imagePicker = ImagePicker();
  String? imagePath;
  File? _selectedImage;
  Future<void> pickImage(BuildContext context) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        setState(() {
          imagePath = _selectedImage!.path;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Upgrade Account Request",
            style: CustomTextStyles.titleMediumBlack90005Bold,),
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 18.h,
            vertical: 34.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: BaseService.mediaUrl+"Profile/"+(GlobalData.prefs.getString('user_pic')??''),
                height: 110.adaptSize,
                fit: BoxFit.cover,
                width: 110.adaptSize,
                radius: BorderRadius.circular(55.0),
              ),
              SizedBox(height: 31.v),
              Text(
                "Switch Account",
                style: CustomTextStyles.titleMediumGreen900,
              ),
              SizedBox(height: 16.v),
              Text(
                "Choose your Role",
                style: CustomTextStyles.titleMediumBlack90005Bold,
              ),
              SizedBox(height: 25.v),
              _buildGroup194(context),
              SizedBox(height: 24.v),
              Text(
                "Please upload a clear photo, a scanned copy of your CNIC, and proof of residence for account verification.",
                style: CustomTextStyles.bodyMediumff262626,
              ),
              SizedBox(height: 31.v),
              imagePath != null ? Expanded(
                flex: 10,
                child: InkWell(
                  onTap: () async {
                    await pickImage(context);
                    setState(() {});},
                  child: Image.file(
                    File(imagePath ?? ''),
                    fit: BoxFit.cover,
                    height: 293.v,
                    width: 409.h,
                  ),
                ),
              )
                  :InkWell(
                onTap: (){
                  pickImage(context);
                },
                child: DottedBorder(
                  color: appTheme.black90003,
                  padding: EdgeInsets.only(
                    left: 1.h,
                    top: 1.v,
                    right: 1.h,
                    bottom: 1.v,
                  ),
                  strokeWidth: 1.h,
                  dashPattern: [
                    4,
                    4,
                  ],
                  child: Container(
                    width: 282.h,
                    height: 100.h,
                    decoration: AppDecoration.outlineBlack90003,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Upload File",
                          style: CustomTextStyles.bodyLarge16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              CustomElevatedButton(
                height: 42.0,
                text: "Send Request",
                buttonTextStyle: CustomTextStyles.titleMediumGray50,
                onPressed: () async {
                  try{
                    if(_selectedImage!=null){
                      BaseService.showLoading("Uploading Request...", context);
                      Map<String,String> body = {
                        'User_cnic':GlobalData.prefs.getString('cnic')!,
                        'request_typerequest_type':Provider.of<SwitchAccountProvider>(context,listen: false).radioGroup,
                      };
                      Map<String, dynamic> fileFields = {
                        'request_document': _selectedImage,
                      };
                      await BaseService.postRequest('Main/UpgradeAccountRequest', body,fileFields: fileFields);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(child: Text('Request Successful!')),
                        ),
                      );
                      _selectedImage = null;
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(child: Text("Select a document first.")),
                        ),
                      );
                    }
                  }catch(e){
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(child: Text(e.toString())),
                      ),
                    );
                  }
                },
              ),

              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup194(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.h,
        right: 47.h,
      ),
      child: Consumer<SwitchAccountProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 38.v,
                        right: 10.h,
                      ),
                      child: CustomRadioButton(
                        text: "MNA",
                        value: "MNA",
                        groupValue: provider.radioGroup,
                        onChange: (value) {
                          provider.changeRadioButton(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 20), // Adjust the width as needed
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 38.v,
                        left: 10.h,
                      ),
                      child: CustomRadioButton(
                        text: "MPA",
                        value: "MPA",
                        groupValue: provider.radioGroup,
                        onChange: (value) {
                          provider.changeRadioButton(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Adjust the height as needed
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 10.h,
                      ),
                      child: CustomRadioButton(
                        text: "Journalist",
                        value: "Journalist",
                        groupValue: provider.radioGroup,
                        onChange: (value) {
                          provider.changeRadioButton(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 20), // Adjust the width as needed
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                      ),
                      child: CustomRadioButton(
                        text: "Admin",
                        value: "Admin",
                        groupValue: provider.radioGroup,
                        onChange: (value) {
                          provider.changeRadioButton(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
