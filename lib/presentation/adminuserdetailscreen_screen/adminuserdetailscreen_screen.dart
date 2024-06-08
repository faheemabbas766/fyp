import 'package:fyp/core/global/global.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import '../../core/services/base_service.dart';
import 'provider/adminuserdetailscreen_provider.dart';

class AdminuserdetailScreen extends StatefulWidget {
  const AdminuserdetailScreen({Key? key}) : super(key: key);

  @override
  AdminuserdetailScreenState createState() => AdminuserdetailScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminuserdetailscreenProvider(),
      child: AdminuserdetailScreen(),
    );
  }
}

class AdminuserdetailScreenState extends State<AdminuserdetailScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminuserdetailscreenProvider>(context,listen: false).loadData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Upgrade Request Details'),),
        body: Consumer<AdminuserdetailscreenProvider>(
            builder: (context, provider, child) =>
            provider.isLoading? Center(child: CircularProgressIndicator(),):
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  CustomImageView(
                    imagePath: BaseService.mediaUrl+"Profile/"+provider.requestProfile.picture,
                    height: 110.adaptSize,
                    fit: BoxFit.cover,
                    width: 110.adaptSize,
                    radius: BorderRadius.circular(55.0),
                  ),
                  SizedBox(height: 20.0),
                  _buildInfoRow("CNIC", provider.requestProfile.cnic),
                  _buildInfoRow("Name", provider.requestProfile.name),
                  _buildInfoRow("Province", provider.requestProfile.province),
                  _buildInfoRow("Tehsil", provider.requestProfile.tehsil),
                  _buildInfoRow("District", provider.requestProfile.district),
                  _buildInfoRow("UC", provider.requestProfile.uc),
                  _buildInfoRow("Phone", provider.requestProfile.phone),
                  _buildInfoRow("Gender", provider.requestProfile.gender),
                  _buildInfoRow("Type", provider.requestProfile.userType),
                  _buildInfoRow("Position", provider.requestProfile.position),
                  Divider(color: Colors.black,),
                  Text("Request for Upgrade"),
                  _buildInfoRow("Request Type", GlobalData.temp.requestType),
                  CustomElevatedButton(
                    height: 35,
                    text: "View Document",
                    buttonTextStyle: CustomTextStyles.titleMediumGray50,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDocument(),));
                    },
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      CustomElevatedButton(
                        text: "Decline",
                        buttonTextStyle: CustomTextStyles.titleMediumGray50,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDocument(),));
                        },
                      ),
                      CustomElevatedButton(
                        text: "Accept",
                        buttonTextStyle: CustomTextStyles.titleMediumGray50,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDocument(),));
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
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

  Widget buildActionButton(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      ),
      onPressed: () {

      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ViewDocument extends StatefulWidget {
  const ViewDocument();

  @override
  State<ViewDocument> createState() => _ViewDocumentState();
}

class _ViewDocumentState extends State<ViewDocument> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('View Document'),
          ),
          body: CustomImageView(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
            imagePath: BaseService.mediaUrl+'UpgradeAccountRequest/'+GlobalData.temp.requestDocument,
          ),
        ));
  }
}
