import 'package:fyp/presentation/search_screen_page/search_screen_page.dart';
import 'package:fyp/presentation/notification_screen_page/notification_screen_page.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:fyp/widgets/custom_rating_bar.dart';
import 'package:fyp/widgets/custom_bottom_bar.dart';
import 'models/dashboard2_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/dashboard2_provider.dart';

class Dashboard2Screen extends StatefulWidget {
  const Dashboard2Screen({Key? key}) : super(key: key);

  @override
  Dashboard2ScreenState createState() => Dashboard2ScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Dashboard2Provider(), child: Dashboard2Screen());
  }
}

// ignore_for_file: must_be_immutable
class Dashboard2ScreenState extends State<Dashboard2Screen> {
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
                child: Column(children: [
                  _buildUC(context),
                  SizedBox(height: 15.v),
                  _buildTwentySix(context),
                  SizedBox(height: 40.v),
                  _buildRow(context),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: 278.h,
                          margin: EdgeInsets.only(left: 30.h),
                          child: Text("msg_exciting_news",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodyMediumPavanam))),
                  SizedBox(height: 13.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgDownload2,
                      height: 322.v,
                      width: 393.h),
                  SizedBox(height: 9.v),
                  _buildOffer(context),
                  SizedBox(height: 13.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Divider(
                          color: appTheme.black90005,
                          indent: 6.h,
                          endIndent: 20.h)),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(right: 11.h),
                child: _buildBottomBar(context))));
  }

  /// Section Widget
  Widget _buildUC(BuildContext context) {
    return SizedBox(
        height: 88.v,
        width: 425.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  height: 44.v,
                  width: 375.h,
                  decoration: BoxDecoration(color: appTheme.whiteA70001))),
          CustomElevatedButton(
              height: 56.v,
              width: 418.h,
              text: "uc",
              rightIcon: Container(
                  margin: EdgeInsets.only(left: 30.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgHomeWhiteA70001,
                      height: 29.v,
                      width: 35.h)),
              buttonStyle: CustomButtonStyles.fillPrimaryTL13,
              buttonTextStyle: theme.textTheme.headlineSmall!,
              alignment: Alignment.bottomCenter)
        ]));
  }

  /// Section Widget
  Widget _buildTwentySix(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 8.h, right: 3.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 9.v),
        decoration: AppDecoration.fillGray50001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text("all", style: theme.textTheme.headlineSmall)),
          CustomImageView(
              imagePath: ImageConstant.imgScania,
              height: 29.v,
              width: 38.h,
              margin: EdgeInsets.only(top: 3.v, right: 7.h, bottom: 3.v))
        ]));
  }

  /// Section Widget
  Widget _buildRow(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 3.h, right: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 1.v),
        decoration: AppDecoration.outlineOnErrorContainer,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgPti1,
                  height: 33.adaptSize,
                  width: 33.adaptSize,
                  margin: EdgeInsets.only(bottom: 19.v)),
              Padding(
                  padding: EdgeInsets.only(left: 12.h, bottom: 16.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("iasad_mehmood",
                            style: CustomTextStyles.bodyMediumOnPrimaryLight_1),
                        SizedBox(height: 2.v),
                        Text("journalist",
                            style: CustomTextStyles.bodySmallOpenSansOnPrimary)
                      ])),
              CustomImageView(
                  imagePath: ImageConstant.imgCheckmark,
                  height: 9.v,
                  width: 10.h,
                  margin: EdgeInsets.only(left: 28.h, top: 15.v, bottom: 27.v)),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgMoreIcon,
                  height: 3.v,
                  width: 15.h,
                  margin: EdgeInsets.only(top: 14.v, right: 5.h, bottom: 34.v))
            ]));
  }

  /// Section Widget
  Widget _buildOffer(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgOffer,
                    height: 25.adaptSize,
                    width: 25.adaptSize),
                SizedBox(height: 9.v),
                Text("11_2k", style: CustomTextStyles.bodyMediumJudson)
              ]),
              Spacer(flex: 27),
              Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgMusic,
                            height: 25.adaptSize,
                            width: 25.adaptSize),
                        SizedBox(height: 6.v),
                        Align(
                            alignment: Alignment.center,
                            child: Text("1_2k",
                                style: CustomTextStyles.bodyMediumJudson))
                      ])),
              Padding(
                  padding: EdgeInsets.only(left: 29.h, top: 3.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgSearchBlack90001,
                            height: 22.adaptSize,
                            width: 22.adaptSize,
                            alignment: Alignment.center,
                            onTap: () {
                              onTapImgSearch(context);
                            }),
                        SizedBox(height: 9.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text("2k",
                                style: CustomTextStyles.bodyMediumJudson))
                      ])),
              Spacer(flex: 72),
              Padding(
                  padding: EdgeInsets.only(top: 7.v, bottom: 28.v),
                  child: CustomRatingBar(initialRating: 0)),
              Padding(
                  padding: EdgeInsets.only(left: 9.h, top: 2.v, bottom: 24.v),
                  child: Text("4_3",
                      style: CustomTextStyles.titleLargeRobotoBlack90005Bold))
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

  /// Navigates to the commentScreen when the action is triggered.
  onTapImgSearch(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.commentScreen,
    );
  }
}
