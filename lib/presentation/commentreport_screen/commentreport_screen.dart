import 'package:fyp/presentation/search_screen_page/search_screen_page.dart';
import 'package:fyp/presentation/notification_screen_page/notification_screen_page.dart';
import 'package:fyp/widgets/custom_bottom_bar.dart';
import 'models/commentreport_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/commentreport_provider.dart';

class CommentreportScreen extends StatefulWidget {
  const CommentreportScreen({Key? key})
      : super(
          key: key,
        );

  @override
  CommentreportScreenState createState() => CommentreportScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommentreportProvider(),
      child: CommentreportScreen(),
    );
  }
}

class CommentreportScreenState extends State<CommentreportScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: 917.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.h,
                          vertical: 40.v,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Divider(
                                color: appTheme.black90004,
                                indent: 147.h,
                              ),
                            ),
                            SizedBox(height: 7.v),
                            Padding(
                              padding: EdgeInsets.only(left: 118.h),
                              child: Text(
                                "comments",
                                style: CustomTextStyles.headlineSmallBlack90005,
                              ),
                            ),
                            SizedBox(height: 45.v),
                            _buildAliKhan(context),
                            SizedBox(height: 51.v),
                            _buildFahadAhmed1(context),
                            SizedBox(height: 12.v),
                            _buildDCounter(context),
                            SizedBox(height: 18.v),
                            _buildBilalAkram3(context),
                            SizedBox(height: 63.v),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 114.v),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Divider(
                            color: appTheme.black90005,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.v),
              SizedBox(
                height: 2.v,
                width: 115.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 115.h,
                        child: Divider(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 115.h,
                        child: Divider(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 11.h),
          child: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAliKhan(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 7.h,
        right: 51.h,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse3,
            height: 52.v,
            width: 51.h,
            margin: EdgeInsets.only(bottom: 2.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 287.h,
                    child: Row(
                      children: [
                        Text(
                          "ali_khan",
                          style: CustomTextStyles.titleSmallRobotoMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Text(
                            "2_d",
                            style: CustomTextStyles.bodyMediumRoboto,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.imgMoreIcon,
                          height: 3.v,
                          width: 14.h,
                          margin: EdgeInsets.only(
                            top: 7.v,
                            bottom: 6.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 264.h,
                    margin: EdgeInsets.only(right: 22.h),
                    child: Text(
                      "msg_imran_khan_s_leadership",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFahadAhmed1(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 7.h,
        right: 51.h,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse452x51,
            height: 52.v,
            width: 51.h,
            margin: EdgeInsets.only(bottom: 2.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBilalAkram(
                    context,
                    bilalAkram: "fahad_ahmed",
                  ),
                  Container(
                    width: 264.h,
                    margin: EdgeInsets.only(right: 22.h),
                    child: Text(
                      "msg_imran_khan_s_leadership",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDCounter(BuildContext context) {
    return Container(
      height: 412.v,
      width: 390.h,
      margin: EdgeInsets.only(left: 1.h),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 166.h,
                bottom: 179.v,
              ),
              child: Text(
                "1_d",
                style: CustomTextStyles.bodyMediumRoboto,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 162.h,
                bottom: 58.v,
              ),
              child: Text(
                "1_d",
                style: CustomTextStyles.bodyMediumRoboto,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 67.h,
                top: 28.v,
                right: 32.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "jamal_qureshi",
                        style: CustomTextStyles.titleSmallRobotoMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "3_d",
                          style: CustomTextStyles.bodyMediumRoboto,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        imagePath: ImageConstant.imgMoreIcon,
                        height: 3.v,
                        width: 14.h,
                        margin: EdgeInsets.only(
                          top: 9.v,
                          bottom: 5.v,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.v),
                  Container(
                    width: 225.h,
                    margin: EdgeInsets.only(
                      left: 4.h,
                      right: 61.h,
                    ),
                    child: Text(
                      "msg_imran_khan_s_leadership2",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 55.v),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: _buildBilalAkram(
                      context,
                      bilalAkram: "bilal_akram",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 67.h,
                bottom: 68.v,
              ),
              child: Text(
                "bilal_akram",
                style: CustomTextStyles.titleSmallRobotoMedium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 231.h,
              margin: EdgeInsets.only(
                left: 70.h,
                bottom: 146.v,
              ),
              child: Text(
                "msg_kudos_to_imran_khan",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 224.h,
              margin: EdgeInsets.only(
                left: 66.h,
                bottom: 30.v,
              ),
              child: Text(
                "msg_as_a_leader_imran",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 2.h,
                right: 333.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse552x51,
                    height: 52.v,
                    width: 51.h,
                  ),
                  SizedBox(height: 115.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse652x51,
                    height: 52.v,
                    width: 51.h,
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 79.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse7,
                    height: 52.v,
                    width: 51.h,
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgMoreIcon,
            height: 3.v,
            width: 14.h,
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(
              right: 32.h,
              bottom: 74.v,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 34.v),
              decoration: AppDecoration.outlineBlack.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 9.v),
                  Container(
                    height: 56.adaptSize,
                    width: 56.adaptSize,
                    decoration: AppDecoration.outlineBlack90005.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder28,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgPti156x56,
                      height: 56.adaptSize,
                      width: 56.adaptSize,
                      radius: BorderRadius.circular(
                        28.h,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: 4.v),
                  Text(
                    "pti_imran_khan",
                    style: CustomTextStyles.titleSmallRobotoSemiBold,
                  ),
                  SizedBox(height: 16.v),
                  Divider(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  SizedBox(height: 17.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.v),
                          child: Text(
                            "report2",
                            style: CustomTextStyles.bodyMediumRoboto,
                          ),
                        ),
                        Container(
                          height: 19.adaptSize,
                          width: 19.adaptSize,
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.h,
                            vertical: 8.v,
                          ),
                          decoration: AppDecoration.fillRed.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder9,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgVectorWhiteA70001,
                            height: 2.v,
                            width: 11.h,
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 34.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 1.v,
                            bottom: 2.v,
                          ),
                          child: Text(
                            "msg_add_to_favourites",
                            style: CustomTextStyles.bodyMediumRoboto,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgAutoLayoutVertical,
                          height: 20.v,
                          width: 32.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: _buildAutoLayoutHorizontal(
                      context,
                      restrict: "mute",
                    ),
                  ),
                  SizedBox(height: 32.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: _buildAutoLayoutHorizontal(
                      context,
                      restrict: "restrict",
                    ),
                  ),
                  SizedBox(height: 32.v),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.h),
                      child: Text(
                        "unfollow",
                        style: CustomTextStyles.bodyMediumRoboto,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBilalAkram3(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 58.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse652x51,
            height: 52.v,
            width: 51.h,
            margin: EdgeInsets.only(bottom: 17.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 13.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: _buildBilalAkram(
                      context,
                      bilalAkram: "bilal_akram",
                    ),
                  ),
                  SizedBox(
                    width: 231.h,
                    child: Text(
                      "msg_kudos_to_imran_khan",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
  Widget _buildBilalAkram(
    BuildContext context, {
    required String bilalAkram,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bilalAkram,
          style: CustomTextStyles.titleSmallRobotoMedium.copyWith(
            color: appTheme.black90005,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgMoreIcon,
          height: 3.v,
          width: 14.h,
          margin: EdgeInsets.only(
            top: 2.v,
            bottom: 11.v,
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildAutoLayoutHorizontal(
    BuildContext context, {
    required String restrict,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          restrict,
          style: CustomTextStyles.bodyMediumRoboto.copyWith(
            color: appTheme.black90005,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgSettings,
          height: 14.v,
          width: 26.h,
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
