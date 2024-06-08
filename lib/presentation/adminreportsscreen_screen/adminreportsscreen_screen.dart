import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/widgets/custom_elevated_button.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import 'models/adminreportsscreen_model.dart';
import 'provider/adminreportsscreen_provider.dart';

class AdminReportsScreen extends StatefulWidget {
  const AdminReportsScreen({Key? key}) : super(key: key);

  @override
  AdminReportsScreenState createState() => AdminReportsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminReportsProvider()..loadData(),
      child: const AdminReportsScreen(),
    );
  }
}

class AdminReportsScreenState extends State<AdminReportsScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AdminReportsProvider>(context, listen: false);
    provider.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Reports', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AdminReportsProvider>(
            builder: (context, provider, child) {
              if (provider.isShowLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (provider.allReports.isEmpty) {
                return const Center(child: Text("No reports available"));
              } else {
                return ListView.builder(
                  itemCount: provider.allReports.length,
                  itemBuilder: (context, index) {
                    final report = provider.allReports[index];
                    return Column(
                      children: [
                        _buildReportCard(
                          context,
                          report: report,
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard(BuildContext context, {required AdminReportModel report}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(BaseService.mediaUrl + "/profile/" + report.reporterPicture),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      report.reporterName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      GlobalData.timeAgo(report.reportDate),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                    ),
                    Text(
                      report.reporterRole,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Reported Item Content:",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              report.reportedItemContent,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            if (report.postImage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: InkWell(
                  child: Container(
                    width: double.maxFinite,
                    child: CustomImageView(
                      height: 300,
                      fit: BoxFit.cover,
                      imagePath: BaseService.mediaUrl + report.postImage,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            Text(
              "Reason for Report:",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 4),
            Text(
              report.reportReason,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
              "Report Type: ${report.reportType}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: "Approve",
                    buttonStyle: CustomButtonStyles.fillPrimaryTL13,
                    buttonTextStyle: Theme.of(context).textTheme.labelLarge!,
                    onPressed: () async {
                      Map<String, String> requestedBody = {
                        "reportId":'${report.reportId}',
                        "status":"Approved",
                        'type':'${report.reportType}',
                        'ReportedItemId': '${report.reportedItemId}'
                      };
                      try{
                        await BaseService.postRequest("Admin/UpdateReport", requestedBody);
                        GlobalData.showSnackBar("Successfully Approved", context);
                        Provider.of<AdminReportsProvider>(context, listen: false).loadData();
                      }catch(e){
                        GlobalData.showSnackBar("Failure", context);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomElevatedButton(
                    text: "Decline",
                    buttonStyle: CustomButtonStyles.fillGray,
                    buttonTextStyle: Theme.of(context).textTheme.labelLarge!,
                    onPressed: () async {
                      Map<String, String> requestedBody = {
                        "reportId":'${report.reportId}',
                        "status":"Rejected",
                        'type':'${report.reportType}',
                        'ReportedItemId': '${report.reportedItemId}'
                      };
                      try{
                        await BaseService.postRequest("Admin/UpdateReport", requestedBody);
                        GlobalData.showSnackBar("Successfully Decline", context);
                        Provider.of<AdminReportsProvider>(context, listen: false).loadData();
                      }catch(e){
                        GlobalData.showSnackBar("Failure", context);
                      }
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
