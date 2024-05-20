import 'package:fyp/widgets/app_bar/custom_app_bar.dart';
import 'package:fyp/widgets/app_bar/appbar_leading_image.dart';
import 'package:fyp/widgets/app_bar/appbar_subtitle_two.dart';
import 'widgets/notificationscreen_item_widget.dart';
import 'models/notificationscreen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/notification_screen_provider.dart';

// ignore_for_file: must_be_immutable
class NotificationScreenPage extends StatefulWidget {
  const NotificationScreenPage({Key? key})
      : super(
          key: key,
        );

  @override
  NotificationScreenPageState createState() => NotificationScreenPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationScreenProvider(),
      child: NotificationScreenPage(),
    );
  }
}

class NotificationScreenPageState extends State<NotificationScreenPage> {
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
          padding: EdgeInsets.symmetric(horizontal: 11.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.only(left: 31.h),
                child: Text(
                  "follow_requests",
                  style: CustomTextStyles.titleSmallOpenSansOnPrimary,
                ),
              ),
              Spacer(),
              _buildNotificationScreen(context),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 47.v,
                  width: 48.h,
                  margin: EdgeInsets.only(right: 24.h),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgUser,
                        height: 47.v,
                        width: 48.h,
                        alignment: Alignment.center,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgOval35x35,
                        height: 35.adaptSize,
                        width: 35.adaptSize,
                        radius: BorderRadius.circular(
                          17.h,
                        ),
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 2.v),
                      ),
                    ],
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 52.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgNotificationsNone,
        margin: EdgeInsets.only(
          left: 27.h,
          top: 15.v,
          bottom: 15.v,
        ),
      ),
      title: AppbarSubtitleTwo(
        text: "notifications",
        margin: EdgeInsets.only(left: 13.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationScreen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 29.h),
      child: Consumer<NotificationScreenProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 10.v,
              );
            },
            itemCount: provider
                .notificationScreenModelObj.notificationscreenItemList.length,
            itemBuilder: (context, index) {
              NotificationscreenItemModel model = provider
                  .notificationScreenModelObj.notificationscreenItemList[index];
              return NotificationscreenItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
