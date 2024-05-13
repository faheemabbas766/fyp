import 'package:fyp/core/global/global.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'provider/editprofile_provider.dart';

class EditprofileScreen extends StatefulWidget {
  const EditprofileScreen({Key? key}) : super(key: key);

  @override
  EditprofileScreenState createState() => EditprofileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditprofileProvider(),
      child: EditprofileScreen(),
    );
  }
}

class EditprofileScreenState extends State<EditprofileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit Profile",
                    style: CustomTextStyles.bodyLargeOpenSansOnPrimary,
                  ),
                  Text(
                    "Done",
                    style: CustomTextStyles.titleMediumGreen900_1,
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              CustomImageView(
                imagePath: ImageConstant.imgEllipse35,
                height: 110.adaptSize,
                width: 110.adaptSize,
                radius: BorderRadius.circular(55.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "Edit Picture",
                style: CustomTextStyles.titleMediumGreen900,
              ),
              SizedBox(height: 20.0),
              _buildInfoRow("CNIC", GlobalData.prefs.getString('cnic') ?? ''),
              _buildInfoRow("Name", GlobalData.prefs.getString('full_name') ?? ''),
              _buildInfoRow("Province", GlobalData.prefs.getString('user_province') ?? ''),
              _buildInfoRow("Tehsil", GlobalData.prefs.getString('user_tehsil') ?? ''),
              _buildInfoRow("District", GlobalData.prefs.getString('user_distinct') ?? ''),
              _buildInfoRow("UC", GlobalData.prefs.getString('user_uc') ?? ''),
              _buildInfoRow("Phone", GlobalData.prefs.getString('user_phone') ?? ''),
              _buildInfoRow("Gender", GlobalData.prefs.getString('user_gender') ?? ''),
              CustomElevatedButton(
                height: 42.0,
                text: "Upgrade Your Account",
                buttonTextStyle: CustomTextStyles.titleMediumGray50,
                onPressed: () {
                  onTapUpgradeYourAccount(context);
                },
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: CustomTextStyles.titleLargeBlack90005,
          ),
          SizedBox(width: 20.0),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  onTapUpgradeYourAccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.switchaccountScreen,
    );
  }
}
