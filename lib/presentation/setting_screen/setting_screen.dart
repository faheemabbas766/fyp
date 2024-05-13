import 'package:fyp/presentation/search_screen_page/search_screen_page.dart';
import 'package:fyp/presentation/notification_screen_page/notification_screen_page.dart';
import 'package:fyp/widgets/custom_icon_button.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:fyp/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp/widgets/app_bar/appbar_title_image.dart';
import 'package:fyp/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:fyp/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:fyp/widgets/custom_search_view.dart';
import 'package:fyp/widgets/custom_bottom_bar.dart';
import 'models/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/setting_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SettingScreenState createState() => SettingScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: SettingScreen(),
    );
  }
}

class SettingScreenState extends State<SettingScreen> {
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
        body: Container(
          height: 882.v,
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              _buildView(context),
              _buildLogout(context),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 73.v),
                  child: Selector<SettingProvider, TextEditingController?>(
                    selector: (
                      context,
                      provider,
                    ) =>
                        provider.searchController,
                    builder: (context, searchController, child) {
                      return CustomSearchView(
                        width: 259.h,
                        controller: searchController,
                        hintText: "search",
                        alignment: Alignment.topRight,
                        contentPadding: EdgeInsets.only(
                          top: 10.v,
                          right: 30.h,
                          bottom: 10.v,
                        ),
                        borderDecoration: SearchViewStyleHelper.fillGray,
                        fillColor: appTheme.gray200,
                      );
                    },
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 47.v,
                width: 48.h,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(
                  right: 34.h,
                  bottom: 28.v,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgOval35x35,
                height: 35.adaptSize,
                width: 35.adaptSize,
                radius: BorderRadius.circular(
                  17.h,
                ),
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(
                  right: 40.h,
                  bottom: 38.v,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 6.h,
            right: 4.h,
          ),
          child: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildView(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          right: 307.h,
          bottom: 104.v,
        ),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 359.v,
                width: 361.h,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 359.v,
                        width: 121.h,
                        decoration: BoxDecoration(
                          color: appTheme.gray5001,
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.onErrorContainer
                                  .withOpacity(0.29),
                              spreadRadius: 2.h,
                              blurRadius: 2.h,
                              offset: Offset(
                                0,
                                1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 12.v,
                          right: 18.h,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgArrowDownOnprimary,
                              height: 6.v,
                              width: 10.h,
                              margin: EdgeInsets.symmetric(vertical: 6.v),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgMegaphone,
                              height: 17.v,
                              width: 20.h,
                              margin: EdgeInsets.only(
                                left: 104.h,
                                bottom: 1.v,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15.v),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                CustomIconButton(
                                  height: 64.adaptSize,
                                  width: 64.adaptSize,
                                  padding: EdgeInsets.all(23.h),
                                  decoration: IconButtonStyleHelper.outlineGray,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgPlusOnprimary,
                                  ),
                                ),
                                SizedBox(height: 3.v),
                                Text(
                                  "new",
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .bodySmallOpenSansOnPrimary_2,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18.h),
                              child: _buildAddNewStory(
                                context,
                                sport: "friends",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 18.h),
                              child: _buildAddNewStory(
                                context,
                                sport: "sport",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 240.h,
                          top: 74.v,
                          right: 16.h,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 12.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.v),
                                    child: Text(
                                      "54",
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .bodyLargeOpenSansOnPrimaryLight,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.v),
                                    child: Text(
                                      "834",
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .bodyLargeOpenSansOnPrimaryLight,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 21.v),
                                    child: Text(
                                      "followers",
                                      textAlign: TextAlign.center,
                                      style:
                                          CustomTextStyles.bodyMediumOnPrimary,
                                    ),
                                  ),
                                  Container(
                                    height: 35.v,
                                    width: 57.h,
                                    margin: EdgeInsets.only(left: 22.h),
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "following",
                                            style: CustomTextStyles
                                                .bodyMediumOnPrimary,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 22.h),
                                            child: Text(
                                              "4",
                                              style: CustomTextStyles
                                                  .bodyLargeOpenSansOnPrimaryLight,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 57.v),
                            SizedBox(
                              height: 34.v,
                              width: 105.h,
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: 105.h,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "msg_digital_goodies2",
                                              style: CustomTextStyles
                                                  .bodySmallOpenSansff262626,
                                            ),
                                            TextSpan(
                                              text: "pixsellz",
                                              style: CustomTextStyles
                                                  .bodySmallOpenSansff05386b,
                                            ),
                                            TextSpan(
                                              text: "msg_everything_is_designed"
                                                  ,
                                              style: CustomTextStyles
                                                  .bodySmallOpenSansff262626,
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      height: 28.v,
                                      width: 92.h,
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.primary,
                                        borderRadius: BorderRadius.circular(
                                          6.h,
                                        ),
                                        border: Border.all(
                                          color: theme
                                              .colorScheme.onErrorContainer,
                                          width: 1.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgMask,
                height: 44.v,
                width: 121.h,
                alignment: Alignment.center,
              ),
              SizedBox(height: 1.v),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle,
                      height: 124.adaptSize,
                      width: 124.adaptSize,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle124x125,
                      height: 124.v,
                      width: 125.h,
                      margin: EdgeInsets.only(left: 1.h),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle124x124,
                      height: 124.adaptSize,
                      width: 124.adaptSize,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle1,
                      height: 124.adaptSize,
                      width: 124.adaptSize,
                      margin: EdgeInsets.only(left: 1.h),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle2,
                      height: 124.v,
                      width: 125.h,
                      margin: EdgeInsets.only(left: 1.h),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLogout(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          right: 29.h,
          bottom: 37.v,
        ),
        child: IntrinsicWidth(
          child: SizedBox(
            height: 845.v,
            width: 399.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 148.h,
                      top: 33.v,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.h,
                      vertical: 244.v,
                    ),
                    decoration: AppDecoration.outlineOnErrorContainer1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        CustomElevatedButton(
                          height: 49.v,
                          text: "logout",
                          margin: EdgeInsets.only(right: 46.h),
                          buttonTextStyle: CustomTextStyles.headlineSmallRoboto,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 79.v,
                    width: 251.h,
                    margin: EdgeInsets.only(
                      top: 44.v,
                      right: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.whiteA70001,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.onErrorContainer
                              .withOpacity(0.29),
                          spreadRadius: 2.h,
                          blurRadius: 2.h,
                          offset: Offset(
                            0,
                            -0.33,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomAppBar(
                  height: 44.v,
                  title: Row(
                    children: [
                      AppbarTitleImage(
                        imagePath: ImageConstant.imgLocation,
                        margin: EdgeInsets.only(
                          top: 16.v,
                          bottom: 17.v,
                        ),
                      ),
                      AppbarSubtitleOne(
                        text: "jacob_w",
                        margin: EdgeInsets.only(
                          left: 6.h,
                          top: 12.v,
                          bottom: 11.v,
                        ),
                      ),
                      Container(
                        height: 44.v,
                        width: 251.h,
                        margin: EdgeInsets.only(
                          left: 158.h,
                          right: 56.h,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 44.v,
                                width: 251.h,
                                decoration: BoxDecoration(
                                  color: appTheme.whiteA70001,
                                  boxShadow: [
                                    BoxShadow(
                                      color: theme.colorScheme.onErrorContainer
                                          .withOpacity(0.29),
                                      spreadRadius: 2.h,
                                      blurRadius: 2.h,
                                      offset: Offset(
                                        0,
                                        1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(36.h, 15.v, 142.h, 9.v),
                              child: Row(
                                children: [
                                  AppbarTitleImage(
                                    imagePath: ImageConstant.imgRefresh,
                                  ),
                                  AppbarSubtitleTwo(
                                    text: "settings",
                                    margin: EdgeInsets.only(
                                      left: 5.h,
                                      top: 1.v,
                                      bottom: 1.v,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 159.h,
                      top: 114.v,
                      right: 41.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.v),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 8.adaptSize,
                                      width: 8.adaptSize,
                                      margin: EdgeInsets.only(left: 2.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          4.h,
                                        ),
                                        border: Border.all(
                                          color: appTheme.black90005,
                                          width: 2.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.v),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgEllipse25,
                                      height: 5.v,
                                      width: 13.h,
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19.h),
                                child: Text(
                                  "msg_follow_and_invite",
                                  style: CustomTextStyles.bodyMediumInter,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 9.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorBlack90005,
                          height: 8.adaptSize,
                          width: 8.adaptSize,
                          margin: EdgeInsets.only(left: 24.h),
                        ),
                        SizedBox(height: 5.v),
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgNotificationsNone,
                              height: 25.adaptSize,
                              width: 25.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 13.h,
                                top: 4.v,
                                bottom: 3.v,
                              ),
                              child: Text(
                                "notifications",
                                style: CustomTextStyles.bodyMediumInter,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25.v),
                        Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgPrivacy,
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      alignment: Alignment.center,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 6.v,
                                        width: 8.h,
                                        margin: EdgeInsets.only(bottom: 3.v),
                                        decoration: BoxDecoration(
                                          color: appTheme.black90005,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16.h,
                                  top: 3.v,
                                ),
                                child: Text(
                                  "privacy",
                                  style: CustomTextStyles.bodyMediumInter,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 27.v),
                        Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgMicrosoftAdmin,
                                height: 22.adaptSize,
                                width: 22.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.h,
                                  top: 4.v,
                                ),
                                child: Text(
                                  "security",
                                  style: CustomTextStyles.bodyMediumInter,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 29.v),
                        Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgLock,
                                height: 18.adaptSize,
                                width: 18.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 17.h),
                                child: Text(
                                  "accounts",
                                  style: CustomTextStyles.bodyMediumInter,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 33.v),
                        Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 1.v),
                                padding: EdgeInsets.symmetric(horizontal: 3.h),
                                decoration:
                                    AppDecoration.outlineBlack900051.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder9,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 2.v),
                                    Text(
                                      "lbl",
                                      style:
                                          CustomTextStyles.labelLargeBlack90005,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 17.h,
                                  top: 2.v,
                                ),
                                child: Text(
                                  "help",
                                  style: CustomTextStyles.bodyMediumInter,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.v),
                        Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Row(
                            children: [
                              Container(
                                height: 18.adaptSize,
                                width: 18.adaptSize,
                                padding: EdgeInsets.all(1.h),
                                decoration:
                                    AppDecoration.outlineBlack900051.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder9,
                                ),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgInformation,
                                  height: 12.adaptSize,
                                  width: 12.adaptSize,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 17.h),
                                child: Text(
                                  "about",
                                  style: CustomTextStyles.bodyMediumInter,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildAddNewStory(
    BuildContext context, {
    required String sport,
  }) {
    return Column(
      children: [
        Container(
          height: 64.adaptSize,
          width: 64.adaptSize,
          padding: EdgeInsets.all(3.h),
          decoration: AppDecoration.outlineGray.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder32,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgOval1,
            height: 56.adaptSize,
            width: 56.adaptSize,
            radius: BorderRadius.circular(
              28.h,
            ),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: 3.v),
        Text(
          sport,
          textAlign: TextAlign.center,
          style: CustomTextStyles.bodySmallOpenSansOnPrimary_2.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
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
}
