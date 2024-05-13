import 'package:fyp/widgets/custom_elevated_button.dart';
import 'models/adminreportsscreen_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/adminreportsscreen_provider.dart';

class AdminreportsScreen extends StatefulWidget {
  const AdminreportsScreen({Key? key}) : super(key: key);

  @override
  AdminreportsScreenState createState() =>
      AdminreportsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AdminreportsscreenProvider(),
        child: AdminreportsScreen());
  }
}

class AdminreportsScreenState extends State<AdminreportsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 41.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 17.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgArrowLeft,
                                    height: 20.v,
                                    width: 10.h,
                                    margin: EdgeInsets.only(bottom: 39.v),
                                    onTap: () {
                                      onTapImgArrowLeft(context);
                                    }),
                                Padding(
                                    padding: EdgeInsets.only(left: 29.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("reports",
                                              style: CustomTextStyles
                                                  .titleLargeRobotoBlack90005Bold_1),
                                          Text("201",
                                              style: CustomTextStyles
                                                  .headlineLargeGray600)
                                        ]))
                              ])),
                      SizedBox(height: 28.v),
                      Padding(
                          padding: EdgeInsets.only(left: 5.h, right: 95.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 214.v),
                                    child: Column(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgEllipse3,
                                          height: 52.v,
                                          width: 49.h),
                                      SizedBox(height: 38.v),
                                      CustomImageView(
                                          imagePath: ImageConstant.imgEllipse4,
                                          height: 52.v,
                                          width: 49.h)
                                    ])),
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 14.h),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  height: 34.v,
                                                  width: 82.h,
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Text(
                                                                "what_the_hell"
                                                                    ,
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyMedium)),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        17.v),
                                                            child: _buildZahid(
                                                                context,
                                                                zahid:
                                                                    "asad"
                                                                        ,
                                                                dCounter:
                                                                    "2_d"
                                                                        ,))
                                                      ])),
                                              Row(children: [
                                                Text("violation_type",
                                                    style: theme
                                                        .textTheme.bodyMedium),
                                                Text("abused_content",
                                                    style: theme
                                                        .textTheme.bodyMedium)
                                              ]),
                                              SizedBox(height: 1.v),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 20.h),
                                                  child: Row(children: [
                                                    _buildApprove(context),
                                                    _buildDecline(context)
                                                  ])),
                                              SizedBox(height: 6.v),
                                              _buildZahid(context,
                                                  zahid: "zahid",
                                                  dCounter: "2_d",),
                                              SizedBox(
                                                  width: 264.h,
                                                  child: Text(
                                                      "msg_imran_khan_s_leadership"
                                                          ,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              SizedBox(
                                                  height: 211.v,
                                                  width: 264.h,
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: 68
                                                                            .h),
                                                                child: Text(
                                                                    "msg_miss_information"
                                                                        ,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyMedium))),
                                                        Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                                "violation_type"
                                                                    ,
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyMedium)),
                                                        CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgFile2023050920Ei9y1b,
                                                            height: 194.v,
                                                            width: 263.h,
                                                            alignment: Alignment
                                                                .bottomCenter)
                                                      ]))
                                            ])))
                              ])),
                      SizedBox(height: 11.v),
                      Padding(
                          padding: EdgeInsets.only(left: 69.h),
                          child: Row(children: [
                            _buildAppove(context),
                            _buildDecline1(context)
                          ])),
                      SizedBox(height: 33.v),
                      Padding(
                          padding: EdgeInsets.only(right: 100.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgEllipse5,
                                    height: 52.v,
                                    width: 50.h,
                                    margin: EdgeInsets.only(bottom: 51.v)),
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 13.h),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildHassan(context,
                                                  hassan: "umair",
                                                  dCounter: "3_d",),
                                              SizedBox(
                                                  width: 264.h,
                                                  child: Text(
                                                      "msg_imran_khan_s_leadership"
                                                          ,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              Row(children: [
                                                Text("violation_type",
                                                    style: theme
                                                        .textTheme.bodyMedium),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.h),
                                                    child: Text(
                                                        "abused_content",
                                                        style: theme.textTheme
                                                            .bodyMedium))
                                              ]),
                                              SizedBox(height: 4.v),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 17.h),
                                                  child: Row(children: [
                                                    _buildAppove1(context),
                                                    _buildDecline2(context)
                                                  ]))
                                            ])))
                              ])),
                      SizedBox(height: 7.v),
                      Padding(
                          padding: EdgeInsets.only(right: 118.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgEllipse6,
                                    height: 52.v,
                                    width: 50.h,
                                    margin: EdgeInsets.only(bottom: 43.v)),
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 13.h),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildHassan(context,
                                                  hassan: "hassan",
                                                  dCounter: "4_d",),
                                              SizedBox(height: 1.v),
                                              Text(
                                                  "msg_imran_khan_s_sincerity"
                                                      ,
                                                  style: theme
                                                      .textTheme.bodyMedium),
                                              SizedBox(height: 5.v),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    _buildDecline3(context),
                                                    _buildDecline4(context)
                                                  ]),
                                              SizedBox(height: 7.v),
                                              Row(children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 1.v),
                                                    child: Text(
                                                        "violation_type",
                                                        style: theme.textTheme
                                                            .bodyMedium)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.h),
                                                    child: Text("spam",
                                                        style: theme.textTheme
                                                            .bodyMedium))
                                              ])
                                            ])))
                              ])),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  Widget _buildApprove(BuildContext context) {
    return CustomElevatedButton(
        width: 121.h,
        text: "approve",
        buttonStyle: CustomButtonStyles.fillGreen,
        buttonTextStyle: theme.textTheme.titleMedium!,
        onPressed: () {
          onTapApprove(context);
        });
  }

  /// Section Widget
  Widget _buildDecline(BuildContext context) {
    return CustomElevatedButton(
        width: 114.h,
        text: "decline",
        margin: EdgeInsets.only(left: 9.h),
        buttonStyle: CustomButtonStyles.fillGreen,
        buttonTextStyle: theme.textTheme.titleMedium!,
        onPressed: () {
          onTapDecline(context);
        });
  }

  /// Section Widget
  Widget _buildAppove(BuildContext context) {
    return CustomElevatedButton(
        width: 114.h,
        text: "appove",
        buttonStyle: CustomButtonStyles.fillGreen,
        buttonTextStyle: theme.textTheme.titleMedium!);
  }

  /// Section Widget
  Widget _buildDecline1(BuildContext context) {
    return CustomElevatedButton(
        width: 114.h,
        text: "decline",
        margin: EdgeInsets.only(left: 16.h),
        buttonStyle: CustomButtonStyles.fillGreen,
        buttonTextStyle: theme.textTheme.titleMedium!);
  }

  /// Section Widget
  Widget _buildAppove1(BuildContext context) {
    return CustomElevatedButton(
        width: 116.h,
        text: "appove",
        buttonStyle: CustomButtonStyles.fillGreen,
        buttonTextStyle: theme.textTheme.titleMedium!);
  }

  /// Section Widget
  Widget _buildDecline2(BuildContext context) {
    return CustomElevatedButton(
        width: 116.h,
        text: "decline",
        margin: EdgeInsets.only(left: 15.h),
        buttonStyle: CustomButtonStyles.fillGreen,
        buttonTextStyle: theme.textTheme.titleMedium!);
  }

  /// Section Widget
  Widget _buildDecline3(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "decline",
            margin: EdgeInsets.only(right: 7.h),
            buttonStyle: CustomButtonStyles.fillGreen,
            buttonTextStyle: theme.textTheme.titleMedium!));
  }

  /// Section Widget
  Widget _buildDecline4(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "decline",
            margin: EdgeInsets.only(left: 7.h),
            buttonStyle: CustomButtonStyles.fillGreen,
            buttonTextStyle: theme.textTheme.titleMedium!));
  }

  /// Common widget
  Widget _buildZahid(
    BuildContext context, {
    required String zahid,
    required String dCounter,
  }) {
    return Row(children: [
      Text(zahid,
          style: CustomTextStyles.titleSmallRobotoMedium
              .copyWith(color: appTheme.black90005)),
      Padding(
          padding: EdgeInsets.only(left: 27.h),
          child: Text(dCounter,
              style: CustomTextStyles.bodyMediumRoboto
                  .copyWith(color: appTheme.black90005)))
    ]);
  }

  /// Common widget
  Widget _buildHassan(
    BuildContext context, {
    required String hassan,
    required String dCounter,
  }) {
    return Row(children: [
      Text(hassan,
          style: CustomTextStyles.titleSmallRobotoMedium
              .copyWith(color: appTheme.black90005)),
      Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(dCounter,
              style: CustomTextStyles.bodyMediumRoboto
                  .copyWith(color: appTheme.black90005)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the admindashboardScreen when the action is triggered.
  onTapApprove(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.admindashboardScreen,
    );
  }

  /// Navigates to the admindashboardScreen when the action is triggered.
  onTapDecline(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.admindashboardScreen,
    );
  }
}
