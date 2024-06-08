import 'package:flutter/material.dart';
import 'package:fyp/core/services/base_service.dart';
import '../../../core/app_export.dart';
import '../../../core/global/global.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../models/dashboard_model.dart';
class DashboardProvider extends ChangeNotifier {
  PostDashboardModel? dashboardModelObj;
  bool isShowLoading = true;
  String? uc;
  late List<PostDashboardModel> allPosts;

  String? selectedReportType;
  TextEditingController reasonController = TextEditingController();
  final List<String> reportTypes = [
    "Something else",
    "False Information",
    "It's Inappropriate",
    "Spam",
    "Misleading",
    "Scam or Fraud"
  ];
  List<String> items = ['Report'];
  Widget buildAutoLayoutVertical(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('Report')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 2),
            Container(
              padding: EdgeInsets.symmetric(vertical: 28.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Report",
                        style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      CustomElevatedButton(
                          onPressed: () async {
                            try{
                              if(Provider.of<DashboardProvider>(context, listen: false).selectedReportType!=null){

                                BaseService.showLoading("Reporting...", context);
                                Map<String,String> body = {
                                  'reportReason':Provider.of<DashboardProvider>(context, listen: false).reasonController.text,
                                  'cnic':GlobalData.prefs.getString('cnic')!,
                                  'reportType':Provider.of<DashboardProvider>(context, listen: false).selectedReportType!,
                                  'postId':GlobalData.postId,
                                };
                                await BaseService.postRequest('Main/ReportPost', body);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(child: Text('Report Successful!')),
                                  ),
                                );
                                Provider.of<DashboardProvider>(context, listen: false).selectedReportType = null;
                                Provider.of<DashboardProvider>(context, listen: false).reasonController.clear();
                                Navigator.of(context).pop();

                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Center(child: Text("Select Type first"
                                        "")),
                                  ),
                                );
                              }
                            }catch(e){
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Center(child: Text(e.toString())),
                                ),
                              );
                            }
                          },
                          height: 52.v,
                          width: 132.h,
                          text: "Post Report",
                          buttonTextStyle:
                          CustomTextStyles.titleLargeRobotoWhiteA70001),
                    ],
                  ),
                  SizedBox(height: 14.0),
                  Padding(
                    padding: EdgeInsets.only(left: 46.0),
                    child: Text(
                      "Why are you reporting?",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 46.0),
                    child: Material(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        value: Provider.of<DashboardProvider>(context, listen: false).selectedReportType,
                        hint: Text('Select a reason', style: TextStyle(color: Colors.grey)),
                        items: Provider.of<DashboardProvider>(context, listen: false).reportTypes.map((String reason) {
                          return DropdownMenuItem<String>(
                            value: reason,
                            child: Text(reason),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          Provider.of<DashboardProvider>(context, listen: false).selectedReportType = newValue;
                          notifyListeners();
                        },
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        iconSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Material(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 46.0),
                      child: TextField(
                        controller: Provider.of<DashboardProvider>(context, listen: false).reasonController,
                        decoration: InputDecoration(
                          hintText: "Explain your reason",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                        ),
                        maxLines: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<List<PostDashboardModel>> getAllPosts() async {
    Map<String, String> requestBody = {
      'cnic': GlobalData.prefs.getString('cnic')!,
    };
    if (uc != null) {
      requestBody['uc'] = uc!;
    }
    dynamic response = await BaseService.postRequest("Main/AllPost", requestBody);
    final parsed = response.cast<Map<String, dynamic>>();
    return parsed.map<PostDashboardModel>((json) => PostDashboardModel.fromJson(json)).toList();
  }
  void notifier(){
    notifyListeners();
  }
  Future<List<PostDashboardModel>> ratePost(int index) async {
    Map<String, String> requestBody = {
      'postId':allPosts[index].postId.toString(),
      'score':allPosts[index].rate_score.toString(),
      'cnic':GlobalData.prefs.getString('cnic')!,
    };
    dynamic response = await BaseService.postRequest("Main/RatePost", requestBody);
    final parsed = response.cast<Map<String, dynamic>>();
    return parsed.map<PostDashboardModel>((json) => PostDashboardModel.fromJson(json)).toList();
  }
  Future<bool> FollowById(String accountCnic) async {
    Map<String, String> requestBody = {
      'userCnic':GlobalData.prefs.getString('cnic')!,
      'accountCnic':accountCnic,
    };
    dynamic response = await BaseService.postRequest("Main/FollowById", requestBody);
    return true;
  }
  loadData() async {
    allPosts = await getAllPosts();
    isShowLoading = false;
    notifyListeners();
  }
  @override
  void dispose() {
    super.dispose();
  }
}
