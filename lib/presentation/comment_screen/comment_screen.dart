import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/core/services/base_service.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/global/global.dart';
import '../../widgets/custom_elevated_button.dart';
import 'provider/comment_provider.dart';
class CommentScreen extends StatefulWidget {
  CommentScreen({Key? key}) : super(key: key);
  @override
  CommentScreenState createState() => CommentScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CommentProvider(), child: CommentScreen());
  }
}

class CommentScreenState extends State<CommentScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  TextEditingController _commentController = TextEditingController();
  String? _selectedReportType;
  TextEditingController _reasonController = TextEditingController();

  final List<String> _reportTypes = [
    "Something else",
    "False Information",
    "It's Inappropriate",
    "Spam",
    "Misleading",
    "Scam or Fraud"
  ];

  List<String> items = ['Report'];

  @override
  void initState() {
    super.initState();
    Provider.of<CommentProvider>(context, listen: false).loadData();
  }

  Widget _buildAutoLayoutVertical(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('Report')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 2),
            Container(
              padding: EdgeInsets.symmetric(vertical: 28.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Report",
                        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      CustomElevatedButton(
                          onPressed: () async {
                            try{
                              if(_selectedReportType!=null){

                                BaseService.showLoading("Reporting...", context);
                                Map<String,String> body = {
                                  'reportReason':_reasonController.text,
                                  'cnic':GlobalData.prefs.getString('cnic')!,
                                  'reportType':_selectedReportType!,
                                  'postId':GlobalData.postId,
                                  'commentId':GlobalData.commentId,
                                };
                                await BaseService.postRequest('Main/ReportComment', body);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(child: Text('Report Successful!')),
                                  ),
                                );
                                _selectedReportType = null;
                                _reasonController.clear();
                                Navigator.of(context).pop();

                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(child: Text("Select Type first"
                                        "")),
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
                          text: "Post Report",
                          buttonTextStyle:
                          CustomTextStyles.titleLargeRobotoWhiteA70001),
                    ],
                  ),
                  SizedBox(height: 14.0),
                  Padding(
                    padding: EdgeInsets.only(left: 46.0),
                    child: Text(
                      "Why are you reporting?",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46.0),
                    child: Material(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        value: _selectedReportType,
                        hint: Text('Select a reason', style: TextStyle(color: Colors.grey)),
                        items: _reportTypes.map((String reason) {
                          return DropdownMenuItem<String>(
                            value: reason,
                            child: Text(reason),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedReportType = newValue;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        iconSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Material(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 46.0),
                      child: TextField(
                        controller: _reasonController,
                        decoration: InputDecoration(
                          hintText: "Explain your reason",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                        ),
                        maxLines: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: appTheme.whiteA70001,
        body: Column(
          children: [
            SizedBox(height: 20),
            Divider(
              color: appTheme.black90004,
              thickness: 5,
              indent: 70,
              endIndent: 70,
            ),
            SizedBox(height: 7.v),
            Align(
              alignment: Alignment.center,
              child: Text("Comments", style: CustomTextStyles.headlineSmallBlack90005),
            ),
            Divider(
              height: 30,
              color: appTheme.black90004,
              thickness: 0.7,
            ),
            Expanded(
              child: Consumer<CommentProvider>(
                builder: (context, provider, child) => provider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                  itemCount: provider.commentsList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                BaseService.mediaUrl + "/profile/" + provider.commentsList[index].userPicture,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(provider.commentsList[index].userName, style: CustomTextStyles.titleSmallRobotoMedium),
                                      SizedBox(width: 10),
                                      Text(GlobalData.timeAgo(provider.commentsList[index].commentDate), style: CustomTextStyles.bodyMediumRoboto),
                                      Spacer(),
                                      DropdownButton2<String>(
                                        isExpanded: true,
                                        items: items
                                            .map((String item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                            .toList(),
                                        value: null,
                                        onChanged: (String? value) {
                                          if(value == 'Report'){
                                            GlobalData.commentId = provider.commentsList[index].commentId.toString();
                                            showDialog(
                                                context: context,
                                                builder: (context) => _buildAutoLayoutVertical(context));
                                            // NavigatorService.pushNamed(
                                            //   AppRoutes.postreportScreen,
                                            // );
                                          }
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          width: 20,
                                        ),
                                        iconStyleData: const IconStyleData(
                                          icon: Icon(
                                            Icons.more_horiz_outlined,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor: Colors.black,
                                          iconDisabledColor: Colors.black,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(14),
                                            color: Colors.white,
                                          ),
                                          offset: const Offset(-20, 0),
                                          scrollbarTheme: ScrollbarThemeData(
                                            radius: const Radius.circular(40),
                                            thickness: WidgetStateProperty.all<double>(6),
                                            thumbVisibility: WidgetStateProperty.all<bool>(true),
                                          ),
                                        ),
                                        menuItemStyleData: const MenuItemStyleData(
                                          height: 40,
                                          padding: EdgeInsets.only(left: 14, right: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    provider.commentsList[index].commentText,
                                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  CustomElevatedButton(
                      onPressed: () async {
                        try{
                          if(_commentController.text.isNotEmpty){
                            BaseService.showLoading("Comment Uploading...", context);
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            Map<String,String> body = {
                              'cnic':prefs.getString('cnic')!,
                              'postId':GlobalData.postId,
                              'commentText':_commentController.text,
                            };
                            await BaseService.postRequest('Main/AddComment', body);
                            Provider.of<CommentProvider>(context, listen: false).loadData();
                            Navigator.of(context).pop();
                            GlobalData.showSnackBar('Data Posted Successful!', context);
                            _commentController.clear();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(child: Text("can't send empty comment.")),
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
                      CustomTextStyles.titleLargeRobotoWhiteA70001),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
