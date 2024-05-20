import 'package:fyp/presentation/search_screen_page/search_screen_page.dart';
import 'package:fyp/presentation/notification_screen_page/notification_screen_page.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:fyp/widgets/custom_rating_bar.dart';
import 'package:fyp/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/dashboard1_provider.dart';

class Dashboard1Screen extends StatefulWidget {
  const Dashboard1Screen({Key? key})
      : super(
          key: key,
        );

  @override
  Dashboard1ScreenState createState() => Dashboard1ScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Dashboard1Provider(),
      child: Dashboard1Screen(),
    );
  }
}

class Dashboard1ScreenState extends State<Dashboard1Screen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 44.v,
                width: 375.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteA70001,
                ),
              ),
              CustomElevatedButton(
                height: 56.v,
                text: "uc",
                margin: EdgeInsets.only(
                  left: 6.h,
                  right: 4.h,
                ),
                rightIcon: Container(
                  margin: EdgeInsets.only(left: 30.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgHomeWhiteA70001,
                    height: 29.v,
                    width: 35.h,
                  ),
                ),
                buttonStyle: CustomButtonStyles.fillPrimaryTL13,
                buttonTextStyle: theme.textTheme.headlineSmall!,
              ),
              SizedBox(height: 21.v),
              _buildTwentyEight(context),
              SizedBox(height: 26.v),
              _buildRow(context),
              SizedBox(height: 9.v),
              Padding(
                padding: EdgeInsets.only(left: 25.h),
                child: Text(
                  "msg_imran_khan_the_great",
                  style: CustomTextStyles.bodyLargePavanam,
                ),
              ),
              SizedBox(height: 10.v),
              CustomImageView(
                imagePath: ImageConstant.imgDownload1,
                height: 365.v,
                width: 406.h,
                alignment: Alignment.center,
              ),
              SizedBox(height: 10.v),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 50.h,
                    right: 39.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgOffer,
                            height: 25.adaptSize,
                            width: 25.adaptSize,
                          ),
                          SizedBox(height: 9.v),
                          Text(
                            "11_2k",
                            style: CustomTextStyles.bodyMediumJudson,
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 44,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.v),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgMusic,
                              height: 25.adaptSize,
                              width: 25.adaptSize,
                            ),
                            SizedBox(height: 6.v),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "1_2k",
                                style: CustomTextStyles.bodyMediumJudson,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 29.h,
                          top: 3.v,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSearchBlack90001,
                              height: 22.adaptSize,
                              width: 22.adaptSize,
                              alignment: Alignment.center,
                            ),
                            SizedBox(height: 9.v),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "2k",
                                style: CustomTextStyles.bodyMediumJudson,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(
                        flex: 55,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 7.v,
                          bottom: 28.v,
                        ),
                        child: CustomRatingBar(
                          initialRating: 0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 9.h,
                          top: 2.v,
                          bottom: 24.v,
                        ),
                        child: Text(
                          "4_3",
                          style:
                              CustomTextStyles.titleLargeRobotoBlack90005Bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 13.v),
              Divider(
                color: appTheme.black90005,
                indent: 6.h,
                endIndent: 20.h,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          child: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyEight(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 6.h,
        right: 4.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.fillGray50001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "all",
              style: theme.textTheme.headlineSmall,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgScania,
            height: 29.v,
            width: 38.h,
            margin: EdgeInsets.only(
              right: 1.h,
              bottom: 5.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 4.h,
        right: 11.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.outlineOnErrorContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 149.h,
            margin: EdgeInsets.only(top: 2.v),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgPti1,
                  height: 33.adaptSize,
                  width: 33.adaptSize,
                  margin: EdgeInsets.only(bottom: 1.v),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "msg_imran_khan_mna",
                      style: CustomTextStyles.bodyMediumOnPrimaryLight_1,
                    ),
                    Text(
                      "uc_34_rwp",
                      style: CustomTextStyles.bodySmallOpenSansOnPrimary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgMoreIcon,
            height: 3.v,
            width: 15.h,
            margin: EdgeInsets.only(
              top: 17.v,
              right: 5.h,
              bottom: 17.v,
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
