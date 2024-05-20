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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 3.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.h),
                              child: Column(children: [
                                _buildMNAUCRWP(context),
                                SizedBox(height: 2.v),
                                Text("msg_passionate_advocate",
                                    style: CustomTextStyles.bodyMediumRoboto),
                                SizedBox(height: 40.v),
                                CustomElevatedButton(
                                    width: 261.h,
                                    text: "edit_profile",
                                    onPressed: () {
                                      onTapEditProfile(context);
                                    }),
                                SizedBox(height: 57.v),
                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildUnsplashNtAJUXocaY(context,
                                          unsplashNtAJUXocaY: ImageConstant
                                              .imgUnsplashNtAjuxocay125x124,
                                          unsplashXckXTOtIQ: ImageConstant
                                              .imgUnsplashXck4xto4tiq2,
                                          unsplashIvXBRQvfZo: ImageConstant
                                              .imgUnsplashXck4xto4tiq125x125),
                                      SizedBox(height: 1.v),
                                      _buildUnsplashNtAJUXocaY(context,
                                          unsplashNtAJUXocaY: ImageConstant
                                              .imgUnsplashNtAjuxocay1,
                                          unsplashXckXTOtIQ: ImageConstant
                                              .imgUnsplashXck4xto4tiq3,
                                          unsplashIvXBRQvfZo: ImageConstant
                                              .imgUnsplash5ivxbrqvfzo125x125),
                                      SizedBox(height: 1.v),
                                      _buildUnsplashNtAJUXocaY3(context)
                                    ])
                              ]))))
                ])),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(left: 37.h, right: 26.h),
                child: _buildBottomBar(context))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 33.h, top: 17.v, bottom: 18.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "asad2", margin: EdgeInsets.only(left: 41.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMegaphone,
              margin: EdgeInsets.fromLTRB(23.h, 21.v, 23.h, 17.v))
        ]);
  }

  /// Section Widget
  Widget _buildMNAUCRWP(BuildContext context) {
    return SizedBox(
        height: 121.v,
        width: 365.h,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Text("asad_mehmood2",
                  style: CustomTextStyles.titleSmallRoboto)),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 14.v),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgEllipse1,
                            height: 89.adaptSize,
                            width: 89.adaptSize,
                            radius: BorderRadius.circular(44.h),
                            margin: EdgeInsets.only(bottom: 17.v)),
                        Padding(
                            padding: EdgeInsets.only(top: 25.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 207.h,
                                      margin: EdgeInsets.only(right: 22.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(children: [
                                              Text("1_132",
                                                  style: CustomTextStyles
                                                      .titleMediumRobotoBlack90005),
                                              SizedBox(height: 1.v),
                                              Text("posts",
                                                  style:
                                                      theme.textTheme.bodySmall)
                                            ]),
                                            _buildFive(context,
                                                four: "60k",
                                                following: "followers",),
                                            _buildFive(context,
                                                four: "4",
                                                following: "following",)
                                          ])),
                                  SizedBox(height: 13.v),
                                  Selector<ProfileProvider, bool?>(
                                      selector: (context, provider) =>
                                          provider.mnaucrwp,
                                      builder: (context, mnaucrwp, child) {
                                        return CustomCheckboxButton(
                                            width: 227.h,
                                            text: "mna_uc_12_rwp",
                                            value: mnaucrwp,
                                            isRightCheck: true,
                                            onChange: (value) {
                                              context
                                                  .read<ProfileProvider>()
                                                  .changeCheckBox1(value);
                                            });
                                      })
                                ]))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildUnsplashNtAJUXocaY3(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          height: 235.v,
          width: 124.h,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            CustomImageView(
                imagePath: ImageConstant.imgUnsplashNtAjuxocay2,
                height: 125.v,
                width: 124.h,
                alignment: Alignment.topCenter),
            CustomImageView(
                imagePath: ImageConstant.imgUnsplashNtAjuxocay2,
                height: 125.v,
                width: 124.h,
                alignment: Alignment.bottomCenter)
          ])),
      SizedBox(
          height: 235.v,
          width: 126.h,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            CustomImageView(
                imagePath: ImageConstant.imgUnsplashXck4xto4tiq4,
                height: 125.adaptSize,
                width: 125.adaptSize,
                alignment: Alignment.topCenter),
            CustomImageView(
                imagePath: ImageConstant.imgUnsplashXck4xto4tiq4,
                height: 125.adaptSize,
                width: 125.adaptSize,
                alignment: Alignment.bottomCenter)
          ])),
      SizedBox(
          height: 235.v,
          width: 162.h,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            CustomImageView(
                imagePath: ImageConstant.imgUnsplash5ivxbrqvfzo125x147,
                height: 125.v,
                width: 147.h,
                alignment: Alignment.topRight),
            CustomImageView(
                imagePath: ImageConstant.imgUnsplash5ivxbrqvfzo125x147,
                height: 125.v,
                width: 162.h,
                alignment: Alignment.bottomCenter)
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildFive(
    BuildContext context, {
    required String four,
    required String following,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 19.h),
          child: Text(four,
              style: CustomTextStyles.titleMediumRobotoBlack90005
                  .copyWith(color: appTheme.black90005))),
      SizedBox(height: 3.v),
      Text(following,
          style:
              theme.textTheme.bodySmall!.copyWith(color: appTheme.black90005))
    ]);
  }

  /// Common widget
  Widget _buildUnsplashNtAJUXocaY(
    BuildContext context, {
    required String unsplashNtAJUXocaY,
    required String unsplashXckXTOtIQ,
    required String unsplashIvXBRQvfZo,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomImageView(
          imagePath: unsplashNtAJUXocaY, height: 125.v, width: 124.h),
      CustomImageView(
          imagePath: unsplashXckXTOtIQ,
          height: 125.adaptSize,
          width: 125.adaptSize),
      CustomImageView(
          imagePath: unsplashIvXBRQvfZo, height: 125.v, width: 162.h)
    ]);
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

  /// Navigates to the editprofileScreen when the action is triggered.
  onTapEditProfile(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
