import 'package:fyp/presentation/search_screen_page/search_screen_page.dart';
import 'package:fyp/presentation/notification_screen_page/notification_screen_page.dart';
import 'package:fyp/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp/widgets/custom_search_view.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:fyp/widgets/custom_bottom_bar.dart';
import 'models/following_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/following_provider.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  FollowingScreenState createState() => FollowingScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FollowingProvider(), child: FollowingScreen());
  }
}

// ignore_for_file: must_be_immutable
class FollowingScreenState extends State<FollowingScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 11.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 17.v),
                      Padding(
                          padding: EdgeInsets.only(left: 116.h),
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 1.v),
                                child: Text("100",
                                    style: CustomTextStyles
                                        .titleLargeRobotoBlack90005)),
                            Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: Text("following",
                                    style: CustomTextStyles
                                        .titleLargeRobotoBlack90005Bold_1))
                          ])),
                      SizedBox(height: 33.v),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.h, right: 25.h),
                              child: Selector<FollowingProvider,
                                      TextEditingController?>(
                                  selector: (context, provider) =>
                                      provider.searchController,
                                  builder: (context, searchController, child) {
                                    return CustomSearchView(
                                        controller: searchController,
                                        hintText: "search",
                                        hintStyle: CustomTextStyles
                                            .bodyLargeOpenSansBlack90099,
                                        alignment: Alignment.center);
                                  }))),
                      SizedBox(height: 70.v),
                      SizedBox(
                          height: 609.v,
                          width: 385.h,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgUser,
                                    height: 47.v,
                                    width: 48.h,
                                    alignment: Alignment.bottomRight),
                                CustomImageView(
                                    imagePath: ImageConstant.imgOval35x35,
                                    height: 35.adaptSize,
                                    width: 35.adaptSize,
                                    radius: BorderRadius.circular(17.h),
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.only(
                                        right: 6.h, bottom: 10.v)),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 8.h),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              _buildFolllowing(context),
                                              SizedBox(height: 10.v),
                                              _buildFolllowing1(context),
                                              SizedBox(height: 20.v),
                                              _buildFolllowing2(context),
                                              _buildFollowBack1(context),
                                              SizedBox(height: 20.v),
                                              _buildFolllowing3(context),
                                              SizedBox(height: 10.v),
                                              _buildFolllowing4(context),
                                              SizedBox(height: 10.v),
                                              _buildFolllowing5(context),
                                              SizedBox(height: 10.v),
                                              _buildFolllowing6(context)
                                            ])))
                              ]))
                    ])),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: _buildBottomBar(context))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftOnprimary,
            margin: EdgeInsets.fromLTRB(41.h, 19.v, 378.h, 19.v),
            onTap: () {
              onTapArrowLeft(context);
            }));
  }

  /// Section Widget
  Widget _buildFollowing(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "following",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGray);
  }

  /// Section Widget
  Widget _buildFolllowing(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval2,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("asad_memoodi",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildFollowing(context)
            ]));
  }

  /// Section Widget
  Widget _buildFollowing1(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "following",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGray);
  }

  /// Section Widget
  Widget _buildFolllowing1(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval44x44,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("zahid_nawaz",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildFollowing1(context)
            ]));
  }

  /// Section Widget
  Widget _buildFollowing2(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "following",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGray);
  }

  /// Section Widget
  Widget _buildFolllowing2(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval7,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("faheem_abbas",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildFollowing2(context)
            ]));
  }

  /// Section Widget
  Widget _buildFollowBack(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "follow_back",
        margin: EdgeInsets.only(top: 16.v, bottom: 9.v),
        buttonStyle: CustomButtonStyles.fillGreenTL10);
  }

  /// Section Widget
  Widget _buildFollowing3(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "following",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGray);
  }

  /// Section Widget
  Widget _buildFollowBack1(BuildContext context) {
    return SizedBox(
        height: 63.v,
        width: 375.h,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(top: 3.v),
                  padding: EdgeInsets.symmetric(vertical: 2.v),
                  decoration: AppDecoration.fillWhiteA,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgOval44x44,
                            height: 44.adaptSize,
                            width: 44.adaptSize,
                            radius: BorderRadius.circular(22.h),
                            margin: EdgeInsets.only(
                                left: 16.h, top: 5.v, bottom: 5.v)),
                        Padding(
                            padding: EdgeInsets.only(left: 2.h, top: 15.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 2.h),
                                      child: Text("ali",
                                          style: CustomTextStyles
                                              .titleSmallRoboto)),
                                  SizedBox(height: 4.v),
                                  RichText(
                                      text: TextSpan(children: [
                                        TextSpan(text: "   ",),
                                        TextSpan(text: " "),
                                        TextSpan(
                                            text: "msg_started_following2",
                                            style: CustomTextStyles
                                                .bodyMediumff262626)
                                      ]),
                                      textAlign: TextAlign.left)
                                ])),
                        Spacer(),
                        _buildFollowBack(context)
                      ]))),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: 3.v),
                  padding: EdgeInsets.symmetric(vertical: 8.v),
                  decoration: AppDecoration.fillWhiteA,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgOval44x44,
                            height: 44.adaptSize,
                            width: 44.adaptSize,
                            radius: BorderRadius.circular(22.h),
                            margin: EdgeInsets.only(left: 16.h)),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.h, top: 11.v, bottom: 15.v),
                            child: Text("ali_jamil2",
                                style: CustomTextStyles.titleSmallRoboto)),
                        Spacer(),
                        _buildFollowing3(context)
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildFollowing4(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "following",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGray);
  }

  /// Section Widget
  Widget _buildFolllowing3(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 2.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgOval4,
                        height: 44.adaptSize,
                        width: 44.adaptSize,
                        radius: BorderRadius.circular(22.h)),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                        child: Text("mohsin_raza2",
                            style: CustomTextStyles.titleSmallRoboto))
                  ])),
          _buildFollowing4(context)
        ]));
  }

  /// Section Widget
  Widget _buildFollowing5(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "following",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGray);
  }

  /// Section Widget
  Widget _buildFolllowing4(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 2.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval44x44,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("zeeshan",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildFollowing5(context)
            ]));
  }

  /// Section Widget
  Widget _buildFollowing6(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "following",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGray);
  }

  /// Section Widget
  Widget _buildFolllowing5(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 2.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval44x44,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("hassan",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildFollowing6(context)
            ]));
  }

  /// Section Widget
  Widget _buildFollowing7(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "following",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v),
        buttonStyle: CustomButtonStyles.fillGray);
  }

  /// Section Widget
  Widget _buildFolllowing6(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval5,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("biit",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildFollowing7(context)
            ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.searchScreenPage;
      case BottomBarEnum.Plus:
        return AppRoutes.notificationScreenPage;
      case BottomBarEnum.Image13:
        return "/";
      case BottomBarEnum.Oval:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.searchScreenPage:
        return SearchScreenPage.builder(context);
      case AppRoutes.notificationScreenPage:
        return NotificationScreenPage.builder(context);
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
