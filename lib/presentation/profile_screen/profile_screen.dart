import 'package:fyp/widgets/custom_elevated_button.dart';
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
          appBar: AppBar(backgroundColor: Colors.transparent,),
          body: SingleChildScrollView(
            child: Consumer<ProfileProvider>(
              builder: (context, provider, child) =>
              provider.isLoading?
              Center(child: CircularProgressIndicator(),)
                  :Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
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
                                SizedBox(height: 8), // Add some spacing between the CircleAvatar and the Text
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width/4,
                                  child: Text(
                                    provider.visitProfile.name,
                                    maxLines: 5,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.titleSmallRoboto,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width/1.6,
                                      margin: EdgeInsets.only(left: 2.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              _buildTwentyFive(context, oneHundred: GlobalData.getOrdinal(provider.visitProfile.rank), following: "Ranking",),
                                              _buildTwentyFive(context, oneHundred: provider.visitProfile.popScore.toString(), following: "Pop Rating"),
                                              _buildTwentyFive(context, oneHundred: provider.visitProfile.postsRating.toString(), following: "Posts Rating",),
                                            ],
                                          ),
                                          Row(
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
                                              ]),
                                        ],
                                      )),
                                  SizedBox(height: 13.v),
                                  Text(provider.visitProfile.userType+'\t'+provider.visitProfile.position,
                                      style: CustomTextStyles
                                          .titleSmallRoboto)
                                ])
                          ]),
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
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      CustomImageView(
                                        fit: BoxFit.cover,
                                        imagePath: BaseService.mediaUrl + (provider.visitProfile.userPosts[index].postImage ?? ""),
                                      ),
                                      Positioned(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => ViewPostScreen(
                                                  postData: provider.visitProfile,
                                                  index: index,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                          ),
                                        ),
                                      ),
                                    ],
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text(oneHundred,
          style: CustomTextStyles.titleMediumRobotoBlack90005
              .copyWith(color: appTheme.black90005)),
      SizedBox(height: 3.v),
      Text(following,
          style:
          theme.textTheme.bodySmall!.copyWith(color: appTheme.black90005))
    ]);
  }
}
