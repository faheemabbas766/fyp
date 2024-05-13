import 'package:flutter/material.dart';
import 'package:fyp/presentation/bottom_app_bar/bottom_app_bar_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/admindashboardscreen_screen/admindashboardscreen_screen.dart';
import '../presentation/adminreportsscreen_screen/adminreportsscreen_screen.dart';
import '../presentation/adminmanageusersscreen_screen/adminmanageusersscreen_screen.dart';
import '../presentation/welcome_screen/welcome_screen.dart';
import '../presentation/search_screen_container_screen/search_screen_container_screen.dart';
import '../presentation/dashboard1_screen/dashboard1_screen.dart';
import '../presentation/dashboard2_screen/dashboard2_screen.dart';
import '../presentation/commentreport_screen/commentreport_screen.dart';
import '../presentation/postreport_screen/postreport_screen.dart';
import '../presentation/switchaccount_screen/switchaccount_screen.dart';
import '../presentation/setting_screen/setting_screen.dart';
import '../presentation/addpost_screen/addpost_screen.dart';
import '../presentation/following_screen/following_screen.dart';
import '../presentation/followed_screen/followed_screen.dart';
import '../presentation/visitprofile_screen/visitprofile_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/adminuserdetailscreen_screen/adminuserdetailscreen_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/sgin_up_screen/sgin_up_screen.dart';
import '../presentation/dashboard_screen/dashboard_screen.dart';
import '../presentation/comment_screen/comment_screen.dart';
import '../presentation/editprofile_screen/editprofile_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String admindashboardScreen =
      '/admindashboardscreen_screen';

  static const String adminreportsScreen = '/adminreportsscreen_screen';

  static const String adminmanageusersScreen =
      '/adminmanageusersscreen_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String searchScreenContainerScreen =
      '/search_screen_container_screen';

  static const String searchScreenPage = '/search_screen_page';

  static const String dashboard1Screen = '/dashboard1_screen';

  static const String dashboard2Screen = '/dashboard2_screen';

  static const String commentreportScreen = '/commentreport_screen';

  static const String postreportScreen = '/postreport_screen';

  static const String switchaccountScreen = '/switchaccount_screen';

  static const String settingScreen = '/setting_screen';

  static const String addPostScreen = '/addpost_screen';

  static const String notificationScreenPage = '/notification_screen_page';

  static const String followingScreen = '/following_screen';

  static const String followedScreen = '/followed_screen';

  static const String visitProfileScreen = '/visitprofile_screen';

  static const String profileScreen = '/profile_screen';

  static const String adminUserDetailScreen =
      '/adminuserdetailscreen_screen';

  static const String loginScreen = '/login_screen';

  static const String sginUpScreen = '/sgin_up_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String commentScreen = '/comment_screen';

  static const String editProfileScreen = '/editprofile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String homeScreen = '/bottom_app_bar';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        admindashboardScreen: AdmindashboardScreen.builder,
        adminreportsScreen: AdminreportsScreen.builder,
        adminmanageusersScreen: AdminmanageusersScreen.builder,
        welcomeScreen: WelcomeScreen.builder,
        searchScreenContainerScreen: SearchScreenContainerScreen.builder,
        dashboard1Screen: Dashboard1Screen.builder,
        dashboard2Screen: Dashboard2Screen.builder,
        commentreportScreen: CommentreportScreen.builder,
        postreportScreen: PostreportScreen.builder,
        switchaccountScreen: SwitchaccountScreen.builder,
        settingScreen: SettingScreen.builder,
        addPostScreen: AddPostScreen.builder,
        followingScreen: FollowingScreen.builder,
        followedScreen: FollowedScreen.builder,
        visitProfileScreen: VisitProfileScreen.builder,
        profileScreen: ProfileScreen.builder,
        adminUserDetailScreen: AdminuserdetailScreen.builder,
        loginScreen: LoginScreen.builder,
        sginUpScreen: SginUpScreen.builder,
        dashboardScreen: DashboardScreen.builder,
        commentScreen: CommentScreen.builder,
        editProfileScreen: EditprofileScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder,
        homeScreen: BottomAppBarScreen.builder
      };
}
