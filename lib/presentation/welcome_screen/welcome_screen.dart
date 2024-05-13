import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:fyp/widgets/custom_outlined_button.dart';
import 'models/welcome_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/welcome_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => WelcomeProvider(), child: WelcomeScreen());
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: appTheme.whiteA70001,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    color: appTheme.whiteA70001,
                    gradient: LinearGradient(
                        begin: Alignment(0.56, 0.32),
                        end: Alignment(0.5, 0.79),
                        colors: [
                          appTheme.black90047,
                          appTheme.black90005.withOpacity(0.89)
                        ])),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 42.h, vertical: 108.v),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(flex: 56),
                          Container(
                              width: 263.h,
                              margin: EdgeInsets.only(right: 80.h),
                              child: Text("Welcome to the Politician Portal.",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .displayMediumMontserratWhiteA70001)),
                          Spacer(flex: 43),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.h),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: CustomElevatedButton(
                                            height: 50.v,
                                            text: "Sign Up",
                                            margin: EdgeInsets.only(right: 5.h),
                                            buttonTextStyle: CustomTextStyles
                                                .titleMediumMontserrat,
                                            onPressed: () {
                                              onTapSignUp(context);
                                            })),
                                    Expanded(
                                        child: CustomOutlinedButton(
                                            text: "Log In",
                                            margin: EdgeInsets.only(left: 5.h),
                                            onPressed: () {
                                              onTapLogIn(context);
                                            }))
                                  ]))
                        ])))));
  }

  /// Navigates to the sginUpScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sginUpScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
