import 'package:fyp/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp/widgets/app_bar/appbar_title.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/adminuserdetailscreen_provider.dart';

class AdminuserdetailScreen extends StatefulWidget {
  const AdminuserdetailScreen({Key? key}) : super(key: key);

  @override
  AdminuserdetailScreenState createState() =>
      AdminuserdetailScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AdminuserdetailscreenProvider(),
        child: AdminuserdetailScreen());
  }
}

class AdminuserdetailScreenState
    extends State<AdminuserdetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 23.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgEllipse35,
                          height: 110.adaptSize,
                          width: 110.adaptSize,
                          radius: BorderRadius.circular(55.h),
                          margin: EdgeInsets.only(left: 108.h)),
                      SizedBox(height: 17.v),
                      Padding(
                          padding: EdgeInsets.only(left: 118.h),
                          child: Text("asad_mehmood",
                              style: CustomTextStyles.titleSmallRoboto)),
                      SizedBox(height: 57.v),
                      Padding(
                          padding: EdgeInsets.only(right: 74.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("name",
                                    style: CustomTextStyles
                                        .titleLargeBlack90005Bold),
                                Text("asad_mehmood",
                                    style: theme.textTheme.titleLarge)
                              ])),
                      SizedBox(height: 25.v),
                      Padding(
                          padding: EdgeInsets.only(right: 61.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 3.v),
                                    child: Text("cnic",
                                        style: CustomTextStyles
                                            .titleLargeRobotoBlack90005Bold)),
                                Text("37301_3988210_9",
                                    style:
                                        CustomTextStyles.titleLargeBlack90005_1)
                              ])),
                      SizedBox(height: 24.v),
                      Row(children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 2.v),
                            child: Text("province",
                                style:
                                    CustomTextStyles.titleLargeBlack90005Bold)),
                        Padding(
                            padding: EdgeInsets.only(left: 75.h, top: 2.v),
                            child: Text("punjab",
                                style: theme.textTheme.titleLarge))
                      ]),
                      SizedBox(height: 28.v),
                      Row(children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 1.v),
                            child: Text("district",
                                style:
                                    CustomTextStyles.titleLargeBlack90005Bold)),
                        Padding(
                            padding: EdgeInsets.only(left: 85.h),
                            child: Text("jhelum",
                                style: theme.textTheme.titleLarge))
                      ]),
                      SizedBox(height: 35.v),
                      Row(children: [
                        Text("tehsil",
                            style: CustomTextStyles.titleLargeBlack90005Bold),
                        Padding(
                            padding: EdgeInsets.only(left: 101.h),
                            child: Text("dina",
                                style: theme.textTheme.titleLarge))
                      ]),
                      SizedBox(height: 40.v),
                      Row(children: [
                        Text("union_council",
                            style: CustomTextStyles.titleLargeBlack90005Bold),
                        Padding(
                            padding: EdgeInsets.only(left: 24.h),
                            child: Text("dina",
                                style: theme.textTheme.titleLarge))
                      ]),
                      SizedBox(height: 57.v),
                      CustomElevatedButton(
                          width: 228.h,
                          text: "download",
                          margin: EdgeInsets.only(left: 50.h),
                          rightIcon: Padding(
                              padding: EdgeInsets.fromLTRB(8.h, 2.v, 17.h, 1.v),
                              child: Text("documents",
                                  style: TextStyle(
                                      color: Color(0XFFFFFFFF),
                                      fontSize: 18.fSize,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600))),
                          buttonStyle: CustomButtonStyles.fillGreen,
                          buttonTextStyle: CustomTextStyles.titleMedium18),
                      SizedBox(height: 50.v),
                      Padding(
                          padding: EdgeInsets.only(left: 22.h, right: 54.h),
                          child: Row(children: [
                            SizedBox(
                                height: 29.v,
                                width: 142.h,
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                              height: 28.v,
                                              width: 142.h,
                                              decoration: BoxDecoration(
                                                  color: appTheme.green900,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.h)))),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 30.h),
                                              child: Text("approve",
                                                  style: CustomTextStyles
                                                      .titleMedium18)))
                                    ])),
                            CustomElevatedButton(
                                width: 142.h,
                                text: "decline",
                                margin: EdgeInsets.only(left: 20.h),
                                buttonStyle: CustomButtonStyles.fillGreen,
                                buttonTextStyle: CustomTextStyles.titleMedium18)
                          ])),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowDown,
            margin: EdgeInsets.only(left: 24.h, top: 22.v, bottom: 18.v),
            onTap: () {
              onTapArrowDown(context);
            }),
        title: AppbarTitle(
            text: "user_detail", margin: EdgeInsets.only(left: 10.h)));
  }

  /// Navigates to the adminmanageusersScreen when the action is triggered.
  onTapArrowDown(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.adminmanageusersScreen,
    );
  }
}
