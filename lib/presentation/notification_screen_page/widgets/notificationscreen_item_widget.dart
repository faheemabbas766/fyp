import '../models/notificationscreen_item_model.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';

// ignore: must_be_immutable
class NotificationscreenItemWidget extends StatelessWidget {
  NotificationscreenItemWidget(
    this.notificationscreenItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationscreenItemModel notificationscreenItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 1.h),
          padding: EdgeInsets.symmetric(vertical: 2.v),
          decoration: AppDecoration.fillWhiteA,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomImageView(
                imagePath: notificationscreenItemModelObj.asadMehmood,
                height: 44.adaptSize,
                width: 44.adaptSize,
                radius: BorderRadius.circular(
                  22.h,
                ),
                margin: EdgeInsets.only(
                  left: 16.h,
                  top: 5.v,
                  bottom: 5.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 2.h,
                  top: 15.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        notificationscreenItemModelObj.asadMehmood1!,
                        style: CustomTextStyles.titleSmallRoboto,
                      ),
                    ),
                    SizedBox(height: 4.v),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "   ",
                          ),
                          TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "msg_started_following2",
                            style: CustomTextStyles.bodyMediumff262626,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Spacer(),
              _buildFollowBack(context),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.v),
          decoration: AppDecoration.fillWhiteA,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 5.v,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: notificationscreenItemModelObj.asadMehmood2,
                      height: 44.adaptSize,
                      width: 44.adaptSize,
                      radius: BorderRadius.circular(
                        22.h,
                      ),
                      margin: EdgeInsets.only(bottom: 5.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 2.h,
                        top: 10.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.h),
                            child: Text(
                              notificationscreenItemModelObj.zahidNawaz!,
                              style: CustomTextStyles.titleSmallRoboto,
                            ),
                          ),
                          SizedBox(height: 4.v),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "   ",
                                ),
                                TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: "msg_started_following2",
                                  style: CustomTextStyles.bodyMediumff262626,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildFollowBack1(context),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFollowBack(BuildContext context) {
    return CustomElevatedButton(
      width: 129.h,
      text: "follow_back",
      margin: EdgeInsets.only(
        top: 16.v,
        bottom: 9.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildFollowBack1(BuildContext context) {
    return CustomElevatedButton(
      width: 129.h,
      text: "follow_back",
      margin: EdgeInsets.only(
        top: 16.v,
        bottom: 9.v,
      ),
    );
  }
}
