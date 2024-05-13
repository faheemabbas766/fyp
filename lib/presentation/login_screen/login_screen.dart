import 'package:fyp/core/utils/validation_functions.dart';
import 'package:fyp/widgets/custom_text_form_field.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(), child: LoginScreen());
  }
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 21.h, vertical: 16.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 101.h),
                                      child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                ImageConstant.imgLeftArrow1,
                                                height: 23.adaptSize,
                                                width: 23.adaptSize,
                                                margin: EdgeInsets.only(
                                                    bottom: 49.v),
                                                onTap: () {
                                                  onTapImgLeftArrowOne(context);
                                                }),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 75.h, top: 19.v),
                                                child: Text("Welcome",
                                                    style: theme.textTheme
                                                        .displayMedium))
                                          ]))),
                              SizedBox(height: 17.v),
                              Text("Login to your account",
                                  style: CustomTextStyles
                                      .titleMediumLatoGray50003),
                              SizedBox(height: 65.v),
                              SizedBox(
                                  height: 514.v,
                                  width: 383.h,
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                                height: 10.v,
                                                width: 16.h,
                                                margin: EdgeInsets.only(
                                                    right: 15.h),
                                                decoration: BoxDecoration(
                                                    color: theme
                                                        .colorScheme.onError,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8.h)))),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 18.h,
                                                    vertical: 29.v),
                                                decoration: AppDecoration
                                                    .fillPrimary
                                                    .copyWith(
                                                    borderRadius:
                                                    BorderRadiusStyle
                                                        .customBorderTL144),
                                                child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: [
                                                      Text("Login",
                                                          style: CustomTextStyles
                                                              .displayMediumWhiteA70001),
                                                      SizedBox(height: 106.v),
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              left: 15.h,
                                                              right: 16.h),
                                                          child: Selector<
                                                              LoginProvider,
                                                              TextEditingController?>(
                                                              selector: (context,
                                                                  provider) =>
                                                              provider
                                                                  .cnicNumberController,
                                                              builder: (context,
                                                                  cnicNumberController,
                                                                  child) {
                                                                return CustomTextFormField(
                                                                    controller:
                                                                    cnicNumberController,
                                                                    hintText:
                                                                    "cnic number"
                                                                    ,
                                                                    textInputType:
                                                                    TextInputType
                                                                        .number,
                                                                    validator:
                                                                        (value) {
                                                                      if (!isNumeric(
                                                                          value)) {
                                                                        return "Please enter valid number";
                                                                      }
                                                                      return null;
                                                                    });
                                                              })),
                                                      SizedBox(height: 46.v),
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              left: 15.h,
                                                              right: 16.h),
                                                          child: Consumer<
                                                              LoginProvider>(
                                                              builder: (context, provider, child) {
                                                                return CustomTextFormField(
                                                                    controller: provider.passwordController,
                                                                    hintText: "password",
                                                                    textInputAction: TextInputAction.done,
                                                                    textInputType: TextInputType.visiblePassword,
                                                                    suffix: InkWell(
                                                                        onTap: () {
                                                                          provider
                                                                              .changePasswordVisibility();
                                                                        },
                                                                        child: Icon(provider.isShowPassword?Icons.visibility:Icons.visibility_off
                                                                          , color: Colors.tealAccent,)),
                                                                    suffixConstraints:
                                                                    BoxConstraints(
                                                                        maxHeight:
                                                                        22.v),
                                                                    validator: (value) {
                                                                      if (value ==
                                                                          null ||
                                                                          (!isValidPassword(
                                                                              value,
                                                                              isRequired:
                                                                              true))) {
                                                                        return "please enter valid password";
                                                                      }
                                                                      return null;
                                                                    },
                                                                    obscureText: provider.isShowPassword);
                                                              })),
                                                      SizedBox(height: 59.v),
                                                      Consumer<
                                                          LoginProvider>(
                                                          builder: (context, provider, child) {
                                                            return CustomElevatedButton(
                                                                height: 47.v,
                                                                text: "Login",
                                                                buttonStyle:
                                                                CustomButtonStyles
                                                                    .outlineBlackTL23,
                                                                buttonTextStyle:
                                                                CustomTextStyles
                                                                    .titleMediumLato,
                                                                onPressed: () {
                                                                  provider.login(context);
                                                                });
                                                          }),
                                                      SizedBox(height: 78.v)
                                                    ])))
                                      ])),
                              SizedBox(height: 41.v),
                              GestureDetector(
                                  onTap: () {
                                    onTapTen(context);
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding:
                                            EdgeInsets.only(bottom: 1.v),
                                            child: Text(
                                                "Don't have an account?",
                                                style: CustomTextStyles
                                                    .titleSmallLato)),
                                        Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text("Sign up",
                                                style: CustomTextStyles
                                                    .titleSmallLatoOrange500))
                                      ])),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Navigates to the welcomeScreen when the action is triggered.
  onTapImgLeftArrowOne(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.welcomeScreen,
    );
  }

  /// Navigates to the dashboardScreen when the action is triggered.
  onTapLOGIN(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashboardScreen,
    );
  }

  /// Navigates to the sginUpScreen when the action is triggered.
  onTapTen(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sginUpScreen,
    );
  }
}
