import 'models/admindashboardscreen_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/admindashboardscreen_provider.dart';

class AdmindashboardScreen extends StatefulWidget {
  const AdmindashboardScreen({Key? key}) : super(key: key);

  @override
  AdmindashboardScreenState createState() =>
      AdmindashboardScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AdmindashboardscreenProvider(),
        child: AdmindashboardScreen());
  }
}

class AdmindashboardScreenState
    extends State<AdmindashboardScreen> {
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
                padding:
                    EdgeInsets.symmetric(horizontal: 19.h, vertical: 113.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgPTreatmanet1,
                      height: 158.v,
                      width: 161.h),
                  Spacer(flex: 47),
                  _buildWidget(context),
                  SizedBox(height: 43.v),
                  Padding(
                      padding: EdgeInsets.only(left: 27.h, right: 32.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("report",
                                style: CustomTextStyles
                                    .titleLargeRobotoBlack90005Bold_1),
                            Text("manage_users",
                                style: CustomTextStyles
                                    .titleLargeRobotoBlack90005Bold_1)
                          ])),
                  Spacer(flex: 52)
                ]))));
  }

  /// Section Widget
  Widget _buildWidget(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CustomImageView(
          imagePath: ImageConstant.imgImage8,
          height: 131.v,
          width: 153.h,
          onTap: () {
            onTapImgImageEight(context);
          }),
      CustomImageView(
          imagePath: ImageConstant.imgImage9,
          height: 131.v,
          width: 150.h,
          onTap: () {
            onTapImgImageNine(context);
          })
    ]);
  }

  /// Navigates to the adminreportsScreen when the action is triggered.
  onTapImgImageEight(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.adminreportsScreen,
    );
  }

  /// Navigates to the adminmanageusersScreen when the action is triggered.
  onTapImgImageNine(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.adminmanageusersScreen,
    );
  }
}
