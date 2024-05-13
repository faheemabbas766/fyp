import 'models/adminmanageusersscreen_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/adminmanageusersscreen_provider.dart';

class AdminmanageusersScreen extends StatefulWidget {
  const AdminmanageusersScreen({Key? key}) : super(key: key);

  @override
  AdminmanageusersScreenState createState() =>
      AdminmanageusersScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AdminmanageusersscreenProvider(),
        child: AdminmanageusersScreen());
  }
}

class AdminmanageusersScreenState
    extends State<AdminmanageusersScreen> {
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
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 40.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowDown,
                                height: 16.adaptSize,
                                width: 16.adaptSize,
                                margin: EdgeInsets.only(bottom: 6.v),
                                onTap: () {
                                  onTapImgArrowDown(context);
                                }),
                            Padding(
                                padding: EdgeInsets.only(left: 9.h),
                                child: Text("manage_users",
                                    style: CustomTextStyles
                                        .titleMediumBlack90005Bold_1))
                          ]),
                      SizedBox(height: 36.v),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h, right: 63.h),
                          child: Row(children: [
                            Text("name",
                                style: CustomTextStyles.titleSmall15),
                            Spacer(flex: 64),
                            Text("role",
                                style: CustomTextStyles.titleSmall15),
                            Spacer(flex: 35),
                            Text("status",
                                style: CustomTextStyles.titleSmall15)
                          ])),
                      SizedBox(height: 19.v),
                      Padding(
                          padding: EdgeInsets.only(left: 1.h, right: 62.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            onTapTxtAsadMehmood(context);
                                          },
                                          child: Text("asad_mehmood",
                                              style:
                                                  theme.textTheme.titleSmall)),
                                      SizedBox(height: 3.v),
                                      Text("view_details",
                                          style: theme.textTheme.labelLarge!
                                              .copyWith(
                                                  decoration:
                                                      TextDecoration.underline))
                                    ]),
                                Spacer(flex: 47),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 19.v),
                                    child: Text("mma",
                                        style: theme.textTheme.titleSmall)),
                                Spacer(flex: 52),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 19.v),
                                    child: Text("active",
                                        style: theme.textTheme.titleSmall))
                              ])),
                      SizedBox(height: 16.v),
                      Padding(
                          padding: EdgeInsets.only(right: 57.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 4.v),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 2.h),
                                              child: Text("farah_hassan",
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          SizedBox(height: 7.v),
                                          Text("view_details",
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline))
                                        ])),
                                Spacer(flex: 53),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.v, bottom: 23.v),
                                    child: Text("mpa",
                                        style: theme.textTheme.titleSmall)),
                                Spacer(flex: 46),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 27.v),
                                    child: Text("inactive",
                                        style: theme.textTheme.titleSmall))
                              ])),
                      SizedBox(height: 25.v),
                      Padding(
                          padding: EdgeInsets.only(right: 69.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 4.v),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 2.h),
                                              child: Text("zahid_nawaz",
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          SizedBox(height: 7.v),
                                          Text("view_details",
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline))
                                        ])),
                                Spacer(flex: 58),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.v, bottom: 23.v),
                                    child: Text("journalist",
                                        style: theme.textTheme.titleSmall)),
                                Spacer(flex: 41),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 27.v),
                                    child: Text("active2",
                                        style: theme.textTheme.titleSmall))
                              ])),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(right: 57.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 4.v),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 2.h),
                                              child: Text("faheem_abbas",
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          SizedBox(height: 7.v),
                                          Text("view_details",
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline))
                                        ])),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.v, bottom: 23.v),
                                    child: Text("mpa",
                                        style: theme.textTheme.titleSmall)),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 27.v),
                                    child: Text("inactive",
                                        style: theme.textTheme.titleSmall))
                              ])),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(right: 69.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 4.v),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 2.h),
                                              child: Text("mohsin_raza",
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          SizedBox(height: 7.v),
                                          Text("view_details",
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline))
                                        ])),
                                Spacer(flex: 58),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.v, bottom: 23.v),
                                    child: Text("journalist",
                                        style: theme.textTheme.titleSmall)),
                                Spacer(flex: 41),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 27.v),
                                    child: Text("active2",
                                        style: theme.textTheme.titleSmall))
                              ])),
                      SizedBox(height: 23.v),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h, right: 54.h),
                          child: _buildSaad(context,
                              saad: "ali_jamil",
                              viewDetails: "view_details",
                              mPA: "mpa",
                              inactive: "inactive",)),
                      SizedBox(height: 25.v),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h, right: 66.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 5.v),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 2.h),
                                              child: Text(
                                                  "iqrar_ul_hassan",
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          SizedBox(height: 5.v),
                                          Text("view_details",
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline))
                                        ])),
                                Spacer(flex: 46),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 3.v, bottom: 24.v),
                                    child: Text("journalist",
                                        style: theme.textTheme.titleSmall)),
                                Spacer(flex: 53),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 27.v),
                                    child: Text("active2",
                                        style: theme.textTheme.titleSmall))
                              ])),
                      SizedBox(height: 25.v),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h, right: 54.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 210.h,
                                    margin: EdgeInsets.only(top: 4.v),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildFiftyFour(context,
                                              imranKhan: "imran_khan",
                                              viewDetails:
                                                  "view_details",),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 23.v),
                                              child: Text("mpa",
                                                  style: theme
                                                      .textTheme.titleSmall))
                                        ])),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 27.v),
                                    child: Text("inactive",
                                        style: theme.textTheme.titleSmall))
                              ])),
                      SizedBox(height: 25.v),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h, right: 54.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 4.v),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 2.h),
                                              child: Text("nawaz_sharif",
                                                  style: theme
                                                      .textTheme.titleSmall)),
                                          SizedBox(height: 7.v),
                                          Text("view_details",
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline))
                                        ])),
                                Spacer(flex: 53),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.v, bottom: 23.v),
                                    child: Text("mpa",
                                        style: theme.textTheme.titleSmall)),
                                Spacer(flex: 46),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 27.v),
                                    child: Text("inactive",
                                        style: theme.textTheme.titleSmall))
                              ])),
                      SizedBox(height: 25.v),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h, right: 54.h),
                          child: _buildSaad(context,
                              saad: "saad",
                              viewDetails: "view_details",
                              mPA: "mpa",
                              inactive: "inactive",)),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Common widget
  Widget _buildFiftyFour(
    BuildContext context, {
    required String imranKhan,
    required String viewDetails,
  }) {
    return Column(children: [
      Text(imranKhan,
          style:
              theme.textTheme.titleSmall!.copyWith(color: appTheme.black90005)),
      SizedBox(height: 7.v),
      Text(viewDetails,
          style: theme.textTheme.labelLarge!.copyWith(
              decoration: TextDecoration.underline, color: appTheme.green900))
    ]);
  }

  /// Common widget
  Widget _buildSaad(
    BuildContext context, {
    required String saad,
    required String viewDetails,
    required String mPA,
    required String inactive,
  }) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(top: 4.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Text(saad,
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: appTheme.black90005))),
            SizedBox(height: 7.v),
            Text(viewDetails,
                style: theme.textTheme.labelLarge!.copyWith(
                    decoration: TextDecoration.underline,
                    color: appTheme.green900))
          ])),
      Spacer(flex: 57),
      Padding(
          padding: EdgeInsets.only(top: 4.v, bottom: 23.v),
          child: Text(mPA,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: appTheme.black90005))),
      Spacer(flex: 42),
      Padding(
          padding: EdgeInsets.only(bottom: 27.v),
          child: Text(inactive,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: appTheme.black90005)))
    ]);
  }

  /// Navigates to the adminreportsScreen when the action is triggered.
  onTapImgArrowDown(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.adminreportsScreen,
    );
  }

  /// Navigates to the adminuserdetailScreen when the action is triggered.
  onTapTxtAsadMehmood(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.adminUserDetailScreen,
    );
  }
}
