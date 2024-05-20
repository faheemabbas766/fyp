import 'dart:io';
import 'package:fyp/core/services/base_service.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/global/global.dart';
import 'provider/addpost_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  AddPostScreenState createState() => AddPostScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AddpostProvider(), child: AddPostScreen());
  }
}

class AddPostScreenState extends State<AddPostScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  String? imagePath;
  File? _selectedImage;
  TextEditingController _textEditingController = TextEditingController();
  List<String> _suggestions = [];
  List<String> _filteredSuggestions = [];
  bool _showSuggestions = false;
  String _selectedPoliticianCNIC = '';
  TextEditingController politicianNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    politicianNameController.addListener(_onTextChanged);
    _suggestions = List<String>.from(GlobalData.allPoliticianList.map((item) =>
    "${item['PoliticianCNIC']} - ${item['UserFullName']}"));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    politicianNameController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _filteredSuggestions = _suggestions
          .where((name) =>
          name.toLowerCase().contains(_textEditingController.text.toLowerCase()))
          .take(3)
          .toList();
      _showSuggestions = _filteredSuggestions.isNotEmpty;
    });
  }

  void _onSuggestionSelected(String suggestion) {
    setState(() {
      politicianNameController.text = suggestion.split('-')[1];
      _selectedPoliticianCNIC = suggestion.split('-')[0];
      print('Selected CNIC:'+_selectedPoliticianCNIC);
      _showSuggestions = false;
    });
    FocusScope.of(context).requestFocus(FocusNode());
  }
  ImagePicker _imagePicker = ImagePicker();
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
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 9.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 25.h, right: 25.h),
                                  child: Row(
                                      children: [
                                        Text("New Post",
                                            style: CustomTextStyles
                                                .titleLargeRobotoBlack90005Bold_1),
                                        Spacer(),
                                        CustomElevatedButton(
                                            onPressed: () async {
                                              try{
                                                if(_selectedPoliticianCNIC.isNotEmpty){

                                                  BaseService.showLoading("Post Uploading...", context);
                                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                                  Map<String,String> body = {
                                                    'post_text':_textEditingController.text,
                                                    'user_cnic':prefs.getString('cnic')!,
                                                    'post_uc':prefs.getString('user_uc')!,
                                                    'politician_id':_selectedPoliticianCNIC,
                                                  };
                                                  Map<String, dynamic> fileFields = {
                                                    'post_image': _selectedImage, // 'post_image' should match the key for your image in the server
                                                  };
                                                  await BaseService.postRequest('Main/AddPost', body,fileFields: fileFields);
                                                  Navigator.of(context).pop();
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Center(child: Text('Data Posted Successful!')),
                                                    ),
                                                  );
                                                  _selectedImage = null;
                                                  _textEditingController.clear();
                                                }else{
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Center(child: Text("Select a Politician first.")),
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
                                            height: 52.v,
                                            width: 132.h,
                                            text: "Post",
                                            buttonTextStyle:
                                            CustomTextStyles.titleLargeRobotoWhiteA70001)
                                      ])),
                              SizedBox(height: 20.v),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    TextField(
                                      controller: politicianNameController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Politician\'s Name',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                                      ),
                                    ),
                                    if (_showSuggestions)
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: _filteredSuggestions
                                              .map(
                                                (suggestion) => ListTile(
                                              title: Text(suggestion.split('-')[1]),
                                              onTap: () => _onSuggestionSelected(suggestion),
                                            ),
                                          )
                                              .toList(),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.v),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 36.h),
                                      child: CustomTextFormField(
                                        controller: _textEditingController,
                                        hintText: "Add your opinion here...",
                                        hintStyle: TextStyle(color: Colors.black12, fontSize: 18),
                                        maxLines: 10,
                                        textStyle: TextStyle(color: Colors.black, fontSize: 14),
                                      )),
                                ),
                              ),
                              SizedBox(height: 10.v),
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
                                  : Expanded(
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () async {
                                      await pickImage(context);
                                      setState(() {});},
                                      icon: Icon(Icons.cloud_upload_outlined,
                                      size: 200,
                                                                      ),
                                                                    ),
                                    ),
                                  ),
                              Spacer(),
                            ]))),
                SizedBox(height: 3.v)
              ]
          ),
        )
    );
  }
}
