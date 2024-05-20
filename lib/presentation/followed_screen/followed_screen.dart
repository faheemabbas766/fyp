import 'package:fyp/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp/widgets/custom_search_view.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import '../dashboard_screen/provider/dashboard_provider.dart';
import 'provider/followed_provider.dart';

class FollowedScreen extends StatefulWidget {
  const FollowedScreen({Key? key}) : super(key: key);

  @override
  FollowedScreenState createState() => FollowedScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FollowedProvider(), child: FollowedScreen());
  }
}

class FollowedScreenState extends State<FollowedScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Provider.of<FollowedProvider>(context,listen: false).loadData();
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
            'Followed You',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Consumer<FollowedProvider>(
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
                          provider.followedList.length.toString(),
                          style: CustomTextStyles.titleLargeRobotoBlack90005,
                        ),
                        SizedBox(width: 10.h),
                        Text(
                          "Total Followed",
                          style: CustomTextStyles.titleLargeRobotoBlack90005Bold_1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.v),
                  SizedBox(height: 16.v),
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.followedList.length,
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
                                      BaseService.mediaUrl + "/profile/" + provider.followedList[index].userPicture,
                                    ),// Ensure sharp circle edge
                                  ),
                                  SizedBox(width: 5.h),
                                  Text(
                                    provider.followedList[index].userName,
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
                                  if (await Provider.of<DashboardProvider>(context,listen: false).FollowById(provider.followedList[index].userCnic)) {
                                    provider.followedList[index].followedBack = !provider.followedList[index].followedBack;
                                    GlobalData.showSnackBar(
                                        provider.followedList[index].followedBack ? "Following" : 'Follow Back', context);
                                    setState(() {

                                    });
                                  }
                                },
                                buttonStyle: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: provider.followedList[index].followedBack?Colors.green:Colors.red, // Text color
                                ),

                                text: provider.followedList[index].followedBack?"Following":"Follow Back",
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
