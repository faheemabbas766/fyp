import 'package:fyp/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp/widgets/custom_search_view.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'models/followed_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
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
                padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 16.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 116.h),
                          child: Row(children: [
                            Text("100",
                                style: CustomTextStyles
                                    .titleLargeRobotoBlack90005),
                            Padding(
                                padding: EdgeInsets.only(left: 10.h),
                                child: Text("follower",
                                    style: CustomTextStyles
                                        .titleLargeRobotoBlack90005Bold_1))
                          ])),
                      SizedBox(height: 35.v),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.h, right: 25.h),
                              child: Selector<FollowedProvider,
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
                      _buildFolllowing(context),
                      SizedBox(height: 10.v),
                      _buildFolllowing1(context),
                      SizedBox(height: 20.v),
                      _buildFolllowing2(context),
                      _buildFiftyNine(context),
                      SizedBox(height: 20.v),
                      _buildFolllowing3(context),
                      SizedBox(height: 10.v),
                      _buildFolllowing4(context),
                      SizedBox(height: 10.v),
                      _buildFolllowing5(context),
                      SizedBox(height: 10.v),
                      _buildFolllowing6(context),
                      SizedBox(height: 5.v)
                    ]))));
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
  Widget _buildUnfollow(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "unfollow",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v));
  }

  /// Section Widget
  Widget _buildFolllowing(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h, right: 29.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval44x44,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("asad_memoodi",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildUnfollow(context)
            ]));
  }

  /// Section Widget
  Widget _buildUnfollow1(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "unfollow",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v));
  }

  /// Section Widget
  Widget _buildFolllowing1(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h, right: 30.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval7,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("zahid_nawaz",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildUnfollow1(context)
            ]));
  }

  /// Section Widget
  Widget _buildUnfollow2(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "unfollow",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v));
  }

  /// Section Widget
  Widget _buildFolllowing2(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h, right: 30.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval44x44,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("faheem_abbas",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildUnfollow2(context)
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
  Widget _buildUnfollow3(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "unfollow",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v));
  }

  /// Section Widget
  Widget _buildFiftyNine(BuildContext context) {
    return Container(
        height: 63.v,
        width: 375.h,
        margin: EdgeInsets.only(left: 1.h),
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
                            imagePath: ImageConstant.imgOval3,
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
                        _buildUnfollow3(context)
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildUnfollow4(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "unfollow",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v));
  }

  /// Section Widget
  Widget _buildFolllowing3(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 31.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval4,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("mohsin_raza2",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildUnfollow4(context)
            ]));
  }

  /// Section Widget
  Widget _buildUnfollow5(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "unfollow",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v));
  }

  /// Section Widget
  Widget _buildFolllowing4(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 31.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval6,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("zeeshan",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildUnfollow5(context)
            ]));
  }

  /// Section Widget
  Widget _buildUnfollow6(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "unfollow",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v));
  }

  /// Section Widget
  Widget _buildFolllowing5(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 31.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval7,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("hassan",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildUnfollow6(context)
            ]));
  }

  /// Section Widget
  Widget _buildUnfollow7(BuildContext context) {
    return CustomElevatedButton(
        width: 129.h,
        text: "unfollow",
        margin: EdgeInsets.only(top: 11.v, bottom: 4.v));
  }

  /// Section Widget
  Widget _buildFolllowing6(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h, right: 30.h),
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.fillWhiteA,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgOval44x44,
                  height: 44.adaptSize,
                  width: 44.adaptSize,
                  radius: BorderRadius.circular(22.h),
                  margin: EdgeInsets.only(left: 16.h)),
              Padding(
                  padding: EdgeInsets.only(left: 5.h, top: 10.v, bottom: 16.v),
                  child: Text("biit",
                      style: CustomTextStyles.titleSmallRoboto)),
              Spacer(),
              _buildUnfollow7(context)
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
