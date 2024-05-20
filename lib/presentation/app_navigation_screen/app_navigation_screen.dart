import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/app_navigation_provider.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNavigationProvider(),
      child: AppNavigationScreen(),
    );
  }
}

class AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "AdminDashboardScreen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.admindashboardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "AdminReportsScreen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.adminreportsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "AdminManageUsersScreen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.adminmanageusersScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Welcome Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.welcomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search Screen - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.searchScreenContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dashboard1 Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.dashboard1Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dashboard2 Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.dashboard2Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "CommentReport Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.commentreportScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SwitchAccount Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.switchaccountScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Setting Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.settingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "AddPost Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.addPostScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Following Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.followingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Followed Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.followedScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "VisitProfile Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.visitProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "AdminUserDetailScreen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.adminUserDetailScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sgin Up Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.sginUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dashboard Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.dashboardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Comment Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.commentScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "EditProfile Screen",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
