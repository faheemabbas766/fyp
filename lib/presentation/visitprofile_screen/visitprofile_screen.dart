import 'package:fyp/presentation/viewpost_screen/viewpost_screen.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width/1.5,
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
                                                  _buildTwentyFive(context, oneHundred: provider.visitProfile.totalPost.toString(), following: "Posts",),
                                                  _buildTwentyFive(context, oneHundred: provider.visitProfile.totalFollowing.toString(), following: "Following",),
                                                  _buildTwentyFive(context, oneHundred: provider.visitProfile.totalFollowed.toString(), following: "Followed",)
                                                ]),
                                          ],
                                        )),
                                    SizedBox(height: 13.v),
                                    Text(provider.visitProfile.userType+'\t'+provider.visitProfile.position,
                                        style: CustomTextStyles
                                            .titleSmallRoboto),
                                    ])
                            ])),
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
                              return Stack(
                                children: [
                                  // The image or video content
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CustomImageView(
                                      fit: BoxFit.cover,
                                      imagePath: BaseService.mediaUrl + (provider.visitProfile.userPosts[index].postImage ?? ""),
                                    ),
                                  ),
                                  // Transparent overlay that captures taps
                                  Positioned.fill(
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
                                        color: Colors.transparent, // Makes the InkWell invisible
                                      ),
                                    ),
                                  ),
                                ],
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
