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

  @override
  void initState() {
    super.initState();
    Provider.of<CommentProvider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                                      Text(DateFormat('d').format(provider.commentsList[index].commentDate) + 'd', style: CustomTextStyles.bodyMediumRoboto),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_horiz_outlined),
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
