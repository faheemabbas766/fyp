import 'dart:io';

import 'package:fyp/core/services/base_service.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../core/global/global.dart';
import 'provider/addpost_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  AddPostScreenState createState() => AddPostScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddpostProvider(),
      child: AddPostScreen(),
    );
  }
}

class AddPostScreenState extends State<AddPostScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  String? filePath;
  File? _selectedFile;
  TextEditingController _textEditingController = TextEditingController();
  List<String> _suggestions = [];
  List<String> _filteredSuggestions = [];
  bool _showSuggestions = false;
  String _selectedPoliticianCNIC = '';
  TextEditingController politicianNameController = TextEditingController();
  ImagePicker _imagePicker = ImagePicker();
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    politicianNameController.addListener(_onTextChanged);
    _suggestions = List<String>.from(GlobalData.allPoliticianList
        .map((item) => "${item.politicianCNIC} - ${item.userFullName}"));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    politicianNameController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _filteredSuggestions = _suggestions
          .where((name) => name
          .toLowerCase()
          .contains(politicianNameController.text.toLowerCase()))
          .take(3)
          .toList();
      _showSuggestions = _filteredSuggestions.isNotEmpty;
    });
  }

  void _onSuggestionSelected(String suggestion) {
    setState(() {
      politicianNameController.text = suggestion.split('-')[1].trim();
      _selectedPoliticianCNIC = suggestion.split('-')[0].trim();
      _showSuggestions = false;
    });
    FocusScope.of(context).requestFocus(FocusNode());
  }

  Future<void> pickMedia(BuildContext context) async {
    try {
      final result = await showDialog<int>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Select media type'),
          content: Text('Choose whether to pick an image or a video.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 0); // 0 represents image
              },
              child: Text('Image'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 1); // 1 represents video
              },
              child: Text('Video'),
            ),
          ],
        ),
      );

      if (result == null) return;

      final XFile? pickedFile = result == 0
          ? await _imagePicker.pickImage(source: ImageSource.gallery)
          : await _imagePicker.pickVideo(source: ImageSource.gallery);

      if (pickedFile != null) {
        _selectedFile = File(pickedFile.path);
        if (pickedFile.path.endsWith('.mp4')) {
          _videoController = VideoPlayerController.file(_selectedFile!)
            ..initialize().then((_) {
              setState(() {});
              _videoController!.play();
            });
        }
        setState(() {
          filePath = _selectedFile!.path;
        });
      }
    } catch (e) {
      print('Error picking media: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18),
                Row(
                  children: [
                    Text(
                      "New Post",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    CustomElevatedButton(
                      onPressed: () async {
                        try {
                          if (_selectedPoliticianCNIC.isNotEmpty) {
                            BaseService.showLoading(
                                "Post Uploading...", context);
                            Map<String, String> body = {
                              'post_text': _textEditingController.text,
                              'user_cnic': GlobalData.prefs.getString('cnic')!,
                              'post_uc': GlobalData.prefs.getString('user_uc')!,
                              'politician_id': _selectedPoliticianCNIC,
                            };
                            Map<String, dynamic> fileFields = {
                              'post_image': _selectedFile,
                            };
                            await BaseService.postRequest(
                                'Main/AddPost', body,
                                fileFields: fileFields);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(
                                    child: Text('Data Posted Successfully!')),
                              ),
                            );
                            _selectedFile = null;
                            _textEditingController.clear();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(
                                    child: Text("Select a Politician first.")),
                              ),
                            );
                          }
                        } catch (e) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(child: Text(e.toString())),
                            ),
                          );
                        }
                      },
                      height: 52,
                      width: 132,
                      text: "Post",
                      buttonTextStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 16.0),
                        ),
                      ),
                      if (_showSuggestions)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(8.0)),
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
                                title: Text(suggestion.split('-')[1].trim()),
                                onTap: () =>
                                    _onSuggestionSelected(suggestion),
                              ),
                            )
                                .toList(),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CustomTextFormField(
                      controller: _textEditingController,
                      hintText: "Add your opinion here...",
                      hintStyle: TextStyle(color: Colors.black12, fontSize: 18),
                      maxLines: 10,
                      textStyle: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                if (filePath != null)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: InkWell(
                      onTap: () async {
                        await pickMedia(context);
                        setState(() {});
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: filePath!.endsWith('.mp4')
                            ? _videoController != null &&
                            _videoController!.value.isInitialized
                            ? AspectRatio(
                          aspectRatio:
                          _videoController!.value.aspectRatio,
                          child: VideoPlayer(_videoController!),
                        )
                            : Center(child: CircularProgressIndicator())
                            : Image.file(
                          File(filePath!),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                    ),
                  )
                else
                  Center(
                    child: IconButton(
                      onPressed: () async {
                        await pickMedia(context);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.cloud_upload_outlined,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
