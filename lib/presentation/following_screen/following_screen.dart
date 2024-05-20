import 'package:flutter/material.dart';
import 'package:fyp/presentation/dashboard_screen/provider/dashboard_provider.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:fyp/core/app_export.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import 'provider/following_provider.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  FollowingScreenState createState() => FollowingScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FollowingProvider(),
      child: FollowingScreen(),
    );
  }
}

class FollowingScreenState extends State<FollowingScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Provider.of<FollowingProvider>(context,listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Following You',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Consumer<FollowingProvider>(
          builder: (context,
              provider,
              child) => provider.isShowLoading?
          Center(child: CircularProgressIndicator(),)
              :Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        provider.followingList.length.toString(),
                        style: CustomTextStyles.titleLargeRobotoBlack90005,
                      ),
                      SizedBox(width: 10.h),
                      Text(
                        "Total Following",
                        style: CustomTextStyles.titleLargeRobotoBlack90005Bold_1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.v),
                SizedBox(height: 16.v),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.followingList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10.v),
                        padding: EdgeInsets.symmetric(vertical: 10.v, horizontal: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.h),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 15.h + 15.v,
                                  backgroundColor: Colors.transparent, // Optional background color for clarity
                                  backgroundImage: NetworkImage(
                                    BaseService.mediaUrl + "/profile/" + provider.followingList[index].userPicture,
                                  ),// Ensure sharp circle edge
                                ),
                                SizedBox(width: 5.h),
                                Text(
                                  provider.followingList[index].userName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            CustomElevatedButton(
                              height: 45.v,
                              width: 130.h,
                              onPressed: () async {
                                if (await Provider.of<DashboardProvider>(context,listen: false).FollowById(provider.followingList[index].userCnic)) {
                                provider.followingList[index].followedBack = !provider.followingList[index].followedBack;
                                GlobalData.showSnackBar(
                                provider.followingList[index].followedBack ? "Start Following" : 'Stop Following', context);
                                setState(() {

                                });
                                }
                              },
                              buttonStyle: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: provider.followingList[index].followedBack?Colors.red:null, // Text color
                              ),

                              text: provider.followingList[index].followedBack?"Stop Following":"Start Following",
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
