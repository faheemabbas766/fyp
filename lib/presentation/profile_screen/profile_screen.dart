import 'package:fyp/presentation/search_screen_page/search_screen_page.dart';
import 'package:fyp/presentation/notification_screen_page/notification_screen_page.dart';
import 'package:fyp/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp/widgets/app_bar/appbar_subtitle.dart';
import 'package:fyp/widgets/app_bar/appbar_trailing_image.dart';
import 'package:fyp/widgets/custom_checkbox_button.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:fyp/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import '../viewpost_screen/viewpost_screen.dart';
import 'provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileProvider(), child: ProfileScreen());
  }
}

// ignore_for_file: must_be_immutable
class ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Consumer<ProfileProvider>(
            builder: (context, provider, child) =>
            provider.isLoading?
            Center(child: CircularProgressIndicator(),)
                :Container(
              padding: EdgeInsets.symmetric(horizontal: 19.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(child: SizedBox()),
                    Align(
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(8),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(12.0),
                                                            child: Image.network(
                                                              BaseService.mediaUrl + "/profile/" + provider.visitProfile.picture,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 10,
                                                      left: 10,
                                                      child: IconButton(
                                                        icon: Icon(Icons.arrow_back, color: Colors.white),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: NetworkImage(
                                            BaseService.mediaUrl + "/profile/" + provider.visitProfile.picture,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                                                style: CustomTextStyles.titleMediumRobotoBlack90005)),
                                                        SizedBox(height: 2.v),
                                                        Text("Posts",
                                                            style:
                                                            theme.textTheme.bodySmall)
                                                      ]),
                                                  InkWell(
                                                      onTap: (){
                                                        NavigatorService.pushNamed(
                                                          AppRoutes.followingScreen,
                                                        );
                                                      },
                                                      child: _buildTwentyFive(context, oneHundred: provider.visitProfile.totalFollowed.toString(), following: "Following",)),
                                                  InkWell(
                                                      onTap: (){
                                                        NavigatorService.pushNamed(
                                                          AppRoutes.followedScreen,
                                                        );
                                                      },
                                                      child: _buildTwentyFive(context, oneHundred: provider.visitProfile.totalFollowing.toString(), following: "Followed",))
                                                ])),
                                        SizedBox(height: 13.v),
                                        Text(provider.visitProfile.userType+'\t'+provider.visitProfile.position,
                                            style: CustomTextStyles
                                                .titleSmallRoboto)
                                      ]))
                            ])),
                    SizedBox(height: 38.v),
                    CustomElevatedButton(
                        onPressed: () async {
                          NavigatorService.pushNamed(
                            AppRoutes.editProfileScreen,
                          );
                        },
                        width: 261.h,
                        text: 'Edit Profile',
                        margin: EdgeInsets.only(right: 44.h)),
                    SizedBox(height: 55.v),
                    Column(
                      children: [
                        Container(
                          height: 390,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // 3 images per row
                            ),
                            itemCount: provider.visitProfile.userPosts.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPostScreen(postData: provider.visitProfile,index: index,),));
                                  },
                                  child: CustomImageView(
                                    fit: BoxFit.cover,
                                    imagePath: BaseService.mediaUrl + (provider.visitProfile.userPosts[index].postImage?? ""),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                      ],
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
