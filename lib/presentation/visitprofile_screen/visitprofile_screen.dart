import 'package:flutter/cupertino.dart';
import 'package:fyp/presentation/visitprofile_screen/provider/visitprofile_provider.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';

import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
class VisitProfileScreen extends StatefulWidget {
  const VisitProfileScreen({Key? key}) : super(key: key);

  @override
  VisitProfileScreenState createState() => VisitProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => VisitProfileProvider(),
        child: VisitProfileScreen());
  }
}

// ignore_for_file: must_be_immutable
class VisitProfileScreenState extends State<VisitProfileScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Provider.of<VisitProfileProvider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Consumer<VisitProfileProvider>(
              builder: (context, provider, child) =>
              provider.isLoading?
              Center(child: CircularProgressIndicator(),)
                  :Container(
                padding: EdgeInsets.symmetric(horizontal: 19.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.only(left: 25.h, right: 22.h),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: NetworkImage(
                                              BaseService.mediaUrl + "/profile/" + provider.visitProfile.picture,
                                            ),
                                          ),
                                          SizedBox(height: 15.v),
                                          Text(provider.visitProfile.name,
                                              style: CustomTextStyles.titleSmallRoboto)
                                        ]),
                                    Padding(
                                        padding: EdgeInsets.only(top: 25.v, bottom: 14.v),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 200.h,
                                                  margin: EdgeInsets.only(left: 2.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: [
                                                              Padding(
                                                                  padding:
                                                                  EdgeInsets.only(left: 4.h),
                                                                  child: Text(provider.visitProfile.totalPost.toString(),
                                                                      style: CustomTextStyles
                                                                          .titleMediumRobotoBlack90005)),
                                                              SizedBox(height: 2.v),
                                                              Text("posts",
                                                                  style:
                                                                  theme.textTheme.bodySmall)
                                                            ]),
                                                        _buildTwentyFive(context,
                                                          oneHundred: provider.visitProfile.totalFollowing.toString(),
                                                          following: "followers",),
                                                        _buildTwentyFive(context,
                                                          oneHundred: provider.visitProfile.totalFollowed.toString(),
                                                          following: "following",)
                                                      ])),
                                              SizedBox(height: 13.v),
                                              Text(provider.visitProfile.userType+'\t\t\t'+provider.visitProfile.position,
                                                  style: CustomTextStyles
                                                      .headlineSmallRobotoBlack90005)
                                            ]))
                                  ]))),
                      SizedBox(height: 38.v),
                      CustomElevatedButton(
                        onPressed: () async {
                          if(await provider.FollowById()){
                            GlobalData.showSnackBar("Done", context);
                            provider.visitProfile.isFollow = !provider.visitProfile.isFollow;
                            provider.notifyListeners();
                          }
                        },
                          width: 261.h,
                          text: provider.visitProfile.isFollow?"Following":'Follow',
                          margin: EdgeInsets.only(right: 44.h)),
                      SizedBox(height: 78.v),
                      SizedBox(height: 85.v),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, // 3 images per row
                                ),
                                itemCount: provider.visitProfile.userPosts.length,
                                itemBuilder: (context, index) {
                                  return CustomImageView(
                                    imagePath: BaseService.mediaUrl + (provider.visitProfile.userPosts[index].postImage?? ""),
                                  );
                                },
                              ),
                            ),

                          ],
                        ),
                      )
                    ]),
              ),
            ),
        )
    );
  }


  /// Common widget
  Widget _buildTwentyFive(
    BuildContext context, {
    required String oneHundred,
    required String following,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: Text(oneHundred,
              style: CustomTextStyles.titleMediumRobotoBlack90005
                  .copyWith(color: appTheme.black90005))),
      SizedBox(height: 3.v),
      Text(following,
          style:
              theme.textTheme.bodySmall!.copyWith(color: appTheme.black90005))
    ]);
  }
}
