import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'provider/adminreportsscreen_provider.dart';

class AdminreportsScreen extends StatefulWidget {
  const AdminreportsScreen({Key? key}) : super(key: key);

  @override
  AdminreportsScreenState createState() => AdminreportsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminreportsscreenProvider(),
      child: const AdminreportsScreen(),
    );
  }
}

class AdminreportsScreenState extends State<AdminreportsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              NavigatorService.goBack();
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reports",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black),
              ),
              Text(
                "201",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildReportCard(
                context,
                userName: "asad",
                daysAgo: "2d",
                violationType: "Abused Content",
                message: "Imran Khan's leadership",
                imagePath: ImageConstant.imgFile2023050920Ei9y1b,
              ),
              const SizedBox(height: 20),
              _buildReportCard(
                context,
                userName: "umair",
                daysAgo: "3d",
                violationType: "Abused Content",
                message: "Imran Khan's leadership",
              ),
              const SizedBox(height: 20),
              _buildReportCard(
                context,
                userName: "hassan",
                daysAgo: "4d",
                violationType: "Spam",
                message: "Imran Khan's sincerity",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard(
      BuildContext context, {
        required String userName,
        required String daysAgo,
        required String violationType,
        required String message,
        String? imagePath,
      }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.grey[300],
                  child: Text(
                    userName[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      daysAgo,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              violationType,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (imagePath != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: "Approve",
                    buttonStyle: CustomButtonStyles.fillPrimaryTL13,
                    buttonTextStyle: Theme.of(context).textTheme.labelLarge!,
                    onPressed: () {
                      NavigatorService.pushNamed(AppRoutes.admindashboardScreen);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomElevatedButton(
                    text: "Decline",
                    buttonStyle: CustomButtonStyles.fillGray,
                    buttonTextStyle: Theme.of(context).textTheme.labelLarge!,
                    onPressed: () {
                      NavigatorService.pushNamed(AppRoutes.admindashboardScreen);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
