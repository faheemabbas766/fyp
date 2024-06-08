import 'dart:io';
import 'package:fyp/core/services/base_service.dart';
import 'package:fyp/widgets/custom_text_form_field.dart';
import 'package:fyp/widgets/custom_drop_down.dart';
import 'models/sgin_up_model.dart';
import 'package:fyp/core/utils/validation_functions.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/sgin_up_provider.dart';

class SginUpScreen extends StatefulWidget {
  const SginUpScreen({Key? key}) : super(key: key);

  @override
  SginUpScreenState createState() => SginUpScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SginUpProvider(), child: SginUpScreen());
  }
}

class SginUpScreenState extends State<SginUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _gender="Male";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            appBar: AppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("Welcome",
                                          style:
                                          theme.textTheme.displayMedium)),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                        "Signup to your account",
                                        style: CustomTextStyles
                                            .titleMediumLatoGray50003),
                                  ),
                                  Container(
                                      height: 10.v,
                                      width: 16.h,
                                      margin: EdgeInsets.only(right: 16.h),
                                      decoration: BoxDecoration(
                                          color: theme.colorScheme.onError,
                                          borderRadius:
                                          BorderRadius.circular(8.h))),
                                  SizedBox(height: 6.v),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 19.h, vertical: 10.v),
                                      decoration: AppDecoration.fillPrimary
                                          .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderBL100),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Theme.of(context).cardColor,
                                              child: Provider.of<SginUpProvider>(context, listen: false).getSelectedImagePath() != null
                                                  ? ClipOval(
                                                child: Image.file(
                                                  File(Provider.of<SginUpProvider>(context, listen: false).getSelectedImagePath() ?? ''),
                                                  fit: BoxFit.cover,
                                                  width: double.infinity, // Set width to fill the circle avatar
                                                  height: double.infinity, // Set height to fill the circle avatar
                                                ),
                                              )
                                                  : IconButton(
                                                onPressed: () async {
                                                  await Provider.of<SginUpProvider>(context, listen: false).pickImage(context);
                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.person),
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h, right: 15.h),
                                                child: Selector<SginUpProvider,
                                                    TextEditingController?>(
                                                    selector: (context, provider) => provider.cnicController,
                                                    builder: (context,
                                                        cnicController,
                                                        child) {
                                                      return CustomTextFormField(
                                                          controller:
                                                          cnicController,
                                                          hintText: "cnic",
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Please enter valid CNIC";
                                                            }
                                                            return null;
                                                          },
                                                          contentPadding: EdgeInsets.symmetric(vertical: 8.v));
                                                    })),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h, right: 15.h),
                                                child: Selector<SginUpProvider,
                                                    TextEditingController?>(
                                                    selector: (context,
                                                        provider) =>
                                                    provider
                                                        .fullNameController,
                                                    builder: (context,
                                                        fullNameController,
                                                        child) {
                                                      return CustomTextFormField(
                                                          controller:
                                                          fullNameController,
                                                          hintText: "Full Name",
                                                          validator: (value) {
                                                            if (value == null && value=="") {
                                                              return "Please enter name";
                                                            }
                                                            return null;
                                                          },
                                                          contentPadding:
                                                          EdgeInsets
                                                              .symmetric(
                                                              vertical:
                                                              10.v));
                                                    })),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h, right: 15.h),
                                                child: Selector<SginUpProvider,
                                                    TextEditingController?>(
                                                    selector: (context,
                                                        provider) =>
                                                    provider
                                                        .phoneController,
                                                    builder: (context,
                                                        phoneController,
                                                        child) {
                                                      return CustomTextFormField(
                                                          controller:
                                                          phoneController,
                                                          hintText: "Phone Number",
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Please enter name";
                                                            }
                                                            return null;
                                                          },
                                                          contentPadding:
                                                          EdgeInsets
                                                              .symmetric(
                                                              vertical:
                                                              10.v));
                                                    })),

                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h),
                                                child: Text("Province",
                                                    style: theme.textTheme
                                                        .labelMedium)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h, right: 15.h),
                                                child: Selector<SginUpProvider,
                                                    SginUpModel?>(
                                                    selector: (context,
                                                        provider) =>
                                                    provider.sginUpModelObj,
                                                    builder: (context,
                                                        sginUpModelObj, child) {
                                                      return CustomDropDown(
                                                          hintText: "Province",
                                                          items: sginUpModelObj
                                                              ?.provinceDropdownItemList ??
                                                              [],
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Please select a value";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) {
                                                            context.read<SginUpProvider>().selectedProvince= value.title;
                                                          });
                                                    })),

                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h),
                                                child: Text("District",
                                                    style: theme.textTheme
                                                        .labelMedium)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h, right: 15.h),
                                                child: Selector<SginUpProvider,
                                                    SginUpModel?>(
                                                    selector: (context,
                                                        provider) =>
                                                    provider.sginUpModelObj,
                                                    builder: (context,
                                                        sginUpModelObj, child) {
                                                      return CustomDropDown(
                                                          hintText: "District",
                                                          items: sginUpModelObj
                                                              ?.districtDropdownItemList ??
                                                              [],
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Please select a value";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) {
                                                            context.read<SginUpProvider>().selectedDistrict = value.title;
                                                          });
                                                    })),

                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h),
                                                child: Text("Tehsil",
                                                    style: theme.textTheme
                                                        .labelMedium)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h, right: 15.h),
                                                child: Selector<SginUpProvider,
                                                    SginUpModel?>(
                                                    selector: (context,
                                                        provider) =>
                                                    provider.sginUpModelObj,
                                                    builder: (context,
                                                        sginUpModelObj, child) {
                                                      return CustomDropDown(
                                                          hintText: "Tehsil",
                                                          items: sginUpModelObj
                                                              ?.tehsilDropdownItemList ??
                                                              [],
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Please select a value";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) {
                                                            context.read<SginUpProvider>().selectedTehsil= value.title;
                                                          });
                                                    })),

                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h),
                                                child: Text("Union Council",
                                                    style: theme.textTheme
                                                        .labelMedium)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h, right: 15.h),
                                                child: Selector<SginUpProvider,
                                                    SginUpModel?>(
                                                    selector: (context,
                                                        provider) =>
                                                    provider.sginUpModelObj,
                                                    builder: (context,
                                                        sginUpModelObj, child) {
                                                      return CustomDropDown(
                                                          hintText: "Union Council",
                                                          items: sginUpModelObj?.tehsilDropdownItemList ?? [],
                                                          validator: (value) {
                                                            if (value == null) {
                                                              return "Please select a value";
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) {
                                                            context.read<SginUpProvider>().selectedUc = value.title;
                                                          });
                                                    })),

                                            SizedBox(height: 17.v),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16.h),
                                                    child: Text("Gender",
                                                        style: theme.textTheme
                                                            .labelMedium))),
                                            SizedBox(height: 4.v),
                                            Padding(
                                              padding: EdgeInsets.only(left: 16.h),
                                              child: Row(
                                                children: [
                                                  Radio(
                                                    value: 'Male',
                                                    groupValue: _gender,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _gender = value as String;
                                                      });
                                                    },
                                                  ),
                                                  Text('Male'),
                                                  Radio(
                                                    value: 'Female',
                                                    groupValue: _gender,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _gender = value as String;
                                                      });
                                                    },
                                                  ),
                                                  Text('Female'),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 18.v),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.h, right: 15.h),
                                                child: Consumer<SginUpProvider>(
                                                    builder: (context, provider, child) {
                                                      return CustomTextFormField(
                                                          controller: provider.passwordController,
                                                          hintText: "Password",
                                                          textInputAction:
                                                          TextInputAction.done,
                                                          textInputType: TextInputType.visiblePassword,
                                                          suffix: InkWell(
                                                              onTap: () {
                                                                provider.changePasswordVisibility();
                                                              },
                                                              child: provider.isShowPassword? Icon(Icons.visibility):Icon(Icons.visibility_off)),
                                                          suffixConstraints:
                                                          BoxConstraints(
                                                              maxHeight: 23.v),
                                                          validator: (value) {
                                                            if (value == null ||
                                                                (!isValidPassword(
                                                                    value,
                                                                    isRequired:
                                                                    true))) {
                                                              return "Please enter valid password";
                                                            }
                                                            return null;
                                                          },
                                                          obscureText: provider
                                                              .isShowPassword);
                                                    })),
                                            SizedBox(height: 18.v),
                                            SizedBox(height: 27.v),
                                            CustomElevatedButton(
                                                height: 47.v,
                                                text: "Sign Up",
                                                buttonStyle: CustomButtonStyles
                                                    .outlineBlackTL23,
                                                buttonTextStyle:
                                                CustomTextStyles
                                                    .titleMediumLato,
                                                onPressed: () async {
                                                  if (_formKey.currentState!.validate()) {
                                                    BaseService.showLoading("Signing Up...", context);
                                                    if(await Provider.of<SginUpProvider>(context, listen: false).signUp()){
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          content: Text('Sign Up Successfully!'),
                                                        ),
                                                      );
                                                      onTapSIGNUP(context);
                                                    }else{
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          content: Text('Failed to Sign Up!!!'),
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }),
                                            SizedBox(height: 52.v)
                                          ])),
                                  SizedBox(height: 5.v)
                                ])
                        )
                    )
                )
            )
        )
    );
  }
  onTapSIGNUP(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
