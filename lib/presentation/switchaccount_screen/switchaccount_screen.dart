import 'package:fyp/widgets/custom_radio_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'models/switchaccount_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/switchaccount_provider.dart';

class SwitchaccountScreen extends StatefulWidget {
  const SwitchaccountScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SwitchaccountScreenState createState() => SwitchaccountScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SwitchaccountProvider(),
      child: SwitchaccountScreen(),
    );
  }
}

class SwitchaccountScreenState extends State<SwitchaccountScreen> {
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
            horizontal: 18.h,
            vertical: 34.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "cancel",
                style: CustomTextStyles.bodyLargeOpenSansOnPrimary16,
              ),
              SizedBox(height: 22.v),
              CustomImageView(
                imagePath: ImageConstant.imgEllipse35,
                height: 110.adaptSize,
                width: 110.adaptSize,
                radius: BorderRadius.circular(
                  55.h,
                ),
              ),
              SizedBox(height: 31.v),
              Text(
                "Switch to Account",
                style: CustomTextStyles.titleMediumGreen900,
              ),
              SizedBox(height: 56.v),
              Text(
                "choose your role",
                style: CustomTextStyles.titleMediumBlack90005Bold,
              ),
              SizedBox(height: 25.v),
              _buildGroup194(context),
              SizedBox(height: 54.v),
              Text(
                "Please upload a clear photo, a scanned copy of your CNIC, and proof of residence for account verification.",
                style: CustomTextStyles.titleMediumBlack90005Bold,
                textAlign: TextA,
              ),
              SizedBox(height: 31.v),
              DottedBorder(
                color: appTheme.black90003,
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 1.v,
                  right: 1.h,
                  bottom: 1.v,
                ),
                strokeWidth: 1.h,
                dashPattern: [
                  4,
                  4,
                ],
                child: Container(
                  width: 282.h,
                  height: 100.h,
                  decoration: AppDecoration.outlineBlack90003,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Upload File",
                        style: CustomTextStyles.bodyLarge16,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildGroup194(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.h,
        right: 47.h,
      ),
      child: Consumer<SwitchaccountProvider>(
        builder: (context, provider, child) {
          return provider.switchaccountModelObj!.radioList.isNotEmpty
              ? Column(
                  children: [
                    CustomRadioButton(
                      text: "Member of Provincial Assembly",
                      value: provider.switchaccountModelObj.radioList[0] ?? "",
                      groupValue: provider.radioGroup,
                      onChange: (value) {
                        provider.changeRadioButton1(value);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 38.v,
                        right: 10.h,
                      ),
                      child: CustomRadioButton(
                        text: "Member of National Assembly",
                        value:
                            provider.switchaccountModelObj.radioList[1] ?? "",
                        groupValue: provider.radioGroup,
                        onChange: (value) {
                          provider.changeRadioButton1(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 40.v,
                        right: 209.h,
                      ),
                      child: CustomRadioButton(
                        text: "journalist",
                        value:
                            provider.switchaccountModelObj.radioList[2] ?? "",
                        groupValue: provider.radioGroup,
                        onChange: (value) {
                          provider.changeRadioButton1(value);
                        },
                      ),
                    ),
                  ],
                )
              : Container();
        },
      ),
    );
  }
}
