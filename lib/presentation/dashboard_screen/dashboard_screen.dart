import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import 'provider/dashboard_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  DashboardScreenState createState() => DashboardScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DashboardProvider(), child: DashboardScreen());
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    await showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          child: Text("Report"),
          value: "report",
        ),
        PopupMenuItem(
          child: Text("Delete"),
          value: "delete",
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == "report") {
        // Handle report action
      } else if (value == "delete") {
        // Handle delete action
      }
    });
  }
  @override
  void initState() {
    super.initState();
    Provider.of<DashboardProvider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            body: Consumer<DashboardProvider>(
              builder: (context, provider, child) => provider.isShowLoading?
              Center(child: CircularProgressIndicator())
                  :Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUC(context),
                  SizedBox(height: 1.v),
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.allPosts.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 7.h, vertical: 12.h, ),
                              padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 5.v),
                              decoration: AppDecoration.outlineOnErrorContainer,
                              child: GestureDetector(
                                onTap: (){
                                  GlobalData.profileCnic = provider.allPosts[index].userCNIC;
                                  NavigatorService.pushNamed(
                                    AppRoutes.visitProfileScreen,
                                  );
                                },
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      CircleAvatar(
                                        radius: 15.h + 15.v,
                                        backgroundColor: Colors.transparent, // Optional background color for clarity
                                        backgroundImage: NetworkImage(
                                          BaseService.mediaUrl + "/profile/" + provider.allPosts[index].userPicture,
                                        ),// Ensure sharp circle edge
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 12.h),
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(provider.allPosts[index].userName,
                                                    style: CustomTextStyles.bodyMediumOnPrimaryLight_1),
                                                SizedBox(height: 2.v),
                                                Text(provider.allPosts[index].accountType,
                                                    style: CustomTextStyles.bodySmallOpenSansOnPrimary)
                                              ])),
                                      CustomImageView(
                                          imagePath: ImageConstant.imgCheckmark,
                                          color: Colors.blue,
                                          height: 20.v,
                                          margin: EdgeInsets.only(left: 28.h)),
                                      TextButton(onPressed: () async {
                                        if(await provider.FollowById(provider.allPosts[index].userCNIC)){
                                        provider.allPosts[index].followed = !provider.allPosts[index].followed;
                                        GlobalData.showSnackBar(provider.allPosts[index].followed?"Following":'Unfollowed', context);
                                        provider.notifyListeners();
                                        }
                                      }, child: Text(provider.allPosts[index].followed?"Following":'Follow+')),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          _showPopupMenu(context);
                                        },
                                        icon: Icon(Icons.more_horiz_outlined),
                                      ),
                                    ]),
                              )),
                          SizedBox(height: 14.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Text(provider.allPosts[index].postText!,
                                  style: CustomTextStyles.bodyMediumPavanamff000000,
                                ),
                                provider.allPosts[index].postImage!=null?Container(
                                  width: double.maxFinite,
                                  child: Image.network(
                                    BaseService.mediaUrl+(provider.allPosts[index].postImage??""),
                                  ),
                                ):Container(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribute space evenly
                                  children: [
                                    Row(
                                      children: [
                                        for (int i = 0; i < 5; i++)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 1.0), // Customize the horizontal spacing here
                                            child: GestureDetector(
                                                onTap: (){
                                                  provider.allPosts[index].rate_score= i+1;
                                                  provider.notifier();
                                                  provider.ratePost(index);
                                                },
                                                child: Icon(i<provider.allPosts[index].rate_score? Icons.star:Icons.star_border, color: Colors.yellow)),
                                          ),
                                        SizedBox(width: 10,),
                                        Text(provider.allPosts[index].totalRating.toString(),style: CustomTextStyles.titleLargeBlack90005),
                                      ],
                                    ),
                                    // Column(
                                    //   children: [
                                    //     IconButton(
                                    //       onPressed: () {},
                                    //       icon: Icon(Icons.thumb_up),
                                    //     ),
                                    //     Text("11.2k", style: CustomTextStyles.bodyMediumJudson),
                                    //   ],
                                    // ),
                                    // Column(
                                    //   children: [
                                    //     IconButton(
                                    //       onPressed: () {},
                                    //       icon: Icon(Icons.thumb_down),
                                    //     ),
                                    //     Text("11.2k", style: CustomTextStyles.bodyMediumJudson),
                                    //   ],
                                    // ),
                                    IconButton(
                                      onPressed: () {
                                        GlobalData.postId = provider.allPosts[index].postId.toString();
                                        NavigatorService.pushNamed(
                                          AppRoutes.commentScreen,
                                        );
                                      },
                                      icon: Icon(Icons.comment_sharp),
                                    ),
                                    Expanded(
                                        child: Text(provider.allPosts[index].recentComment??'',
                                            style: CustomTextStyles.bodyMediumJudson,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: appTheme.black90005,
                            indent: 6.h,
                            endIndent: 6.h,
                          ),
                        ],
                      ),),
                  ),
                ]
            ),)
        )
    );
  }
  /// Section Widget
  Widget _buildUC(BuildContext context) {
    return Column(
        children: [
      CustomElevatedButton(
          height: 56.v,
          text: "UC",
          buttonStyle: CustomButtonStyles.outlineBlack,
          buttonTextStyle: TextStyle(fontSize: 10),),
    ]
    );
  }
}
