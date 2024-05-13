import 'models/postreport_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/postreport_provider.dart';

class PostreportScreen extends StatefulWidget {
  const PostreportScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PostreportScreenState createState() => PostreportScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostreportProvider(),
      child: PostreportScreen(),
    );
  }
}

class PostreportScreenState extends State<PostreportScreen> {
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
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 6.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 18.v),
              Container(
                height: 16.v,
                width: 12.h,
                margin: EdgeInsets.only(right: 37.h),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "2",
                        style: CustomTextStyles.labelLargeGray100,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "2",
                        style: CustomTextStyles.labelLargeGray100,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40.h),
                child: Text(
                  "2",
                  style: CustomTextStyles.labelLargeGray100,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 37.h),
                child: Text(
                  "2",
                  style: CustomTextStyles.labelLargeGray100,
                ),
              ),
              SizedBox(height: 36.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 42.h,
                    right: 98.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 36.v),
                        child: Text(
                          "uc",
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 36.v),
                        child: Text(
                          "all",
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.v),
              _buildPtiOne(context),
              SizedBox(height: 33.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 23.h),
                  child: Text(
                    "msg_imran_khan_great",
                    style: CustomTextStyles.labelLargeRobotoBlack90005,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
              SizedBox(
                height: 521.v,
                width: 390.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgDownload1,
                      height: 322.v,
                      width: 364.h,
                      alignment: Alignment.topCenter,
                    ),
                    _buildAutoLayoutVertical(context),
                  ],
                ),
              ),
              SizedBox(height: 84.v),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 115.h,
                  child: Divider(
                    color: appTheme.black90005,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPtiOne(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 23.h,
          right: 15.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgPti1,
              height: 41.adaptSize,
              width: 41.adaptSize,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 6.h,
                top: 12.v,
                bottom: 11.v,
              ),
              child: Text(
                "asad_mehmood2",
                style: CustomTextStyles.titleSmallRobotoMedium,
              ),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgGroup,
              height: 12.v,
              width: 1.h,
              margin: EdgeInsets.only(
                top: 10.v,
                bottom: 18.v,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAutoLayoutVertical(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 28.v),
        decoration: AppDecoration.outlineBlack.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.v),
            Align(
              alignment: Alignment.center,
              child: Container(
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
            ),
            SizedBox(height: 4.v),
            Align(
              alignment: Alignment.center,
              child: Text(
                "pti_imran_khan",
                style: CustomTextStyles.titleSmallRobotoSemiBold,
              ),
            ),
            SizedBox(height: 16.v),
            Divider(
              color: theme.colorScheme.onPrimaryContainer,
            ),
            SizedBox(height: 7.v),
            Align(
              alignment: Alignment.center,
              child: Text(
                "report2",
                style: CustomTextStyles.titleMediumBlack90005,
              ),
            ),
            SizedBox(height: 14.v),
            Padding(
              padding: EdgeInsets.only(left: 46.h),
              child: Text(
                "msg_why_are_you_reporting",
                style: CustomTextStyles.labelLargeOpenSansBlack90005,
              ),
            ),
            SizedBox(height: 10.v),
            Padding(
              padding: EdgeInsets.only(left: 47.h),
              child: Text(
                "something_else",
                style: CustomTextStyles.bodyMediumRoboto,
              ),
            ),
            SizedBox(height: 12.v),
            Padding(
              padding: EdgeInsets.only(left: 47.h),
              child: Text(
                "msg_false_infromation",
                style: CustomTextStyles.bodyMediumRoboto,
              ),
            ),
            SizedBox(height: 10.v),
            Padding(
              padding: EdgeInsets.only(left: 47.h),
              child: Text(
                "msg_it_s_inappropriate",
                style: CustomTextStyles.bodyMediumRoboto,
              ),
            ),
            SizedBox(height: 15.v),
            Padding(
              padding: EdgeInsets.only(left: 47.h),
              child: Text(
                "spam",
                style: CustomTextStyles.bodyMediumRoboto,
              ),
            ),
            SizedBox(height: 14.v),
            Padding(
              padding: EdgeInsets.only(left: 47.h),
              child: Text(
                "misleading",
                style: CustomTextStyles.bodyMediumRoboto,
              ),
            ),
            SizedBox(height: 11.v),
            Padding(
              padding: EdgeInsets.only(left: 47.h),
              child: Text(
                "scam_or_fraud",
                style: CustomTextStyles.bodyMediumRoboto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
