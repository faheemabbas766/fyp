import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/presentation/adminmanageusersscreen_screen/provider/adminmanageusersscreen_provider.dart';
import 'package:fyp/presentation/adminuserdetailscreen_screen/adminuserdetailscreen_screen.dart';

import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import '../../widgets/custom_elevated_button.dart';


class AdminManageUsersScreen extends StatefulWidget {
  const AdminManageUsersScreen({Key? key}) : super(key: key);

  @override
  AdminManageUsersScreenState createState() => AdminManageUsersScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminManageUsersScreenProvider(),
      child: const AdminManageUsersScreen(),
    );
  }
}

class AdminManageUsersScreenState extends State<AdminManageUsersScreen> {
  TextEditingController _objectionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AdminManageUsersScreenProvider>(context, listen: false);
    provider.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Manage Users"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Expanded(
                child: Consumer<AdminManageUsersScreenProvider>(
                  builder: (context, provider, child) {
                    if (provider.isShowLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (provider.allRequests.isEmpty) {
                      return const Center(child: Text("No users available"));
                    } else {
                      return ListView.builder(
                        itemCount: provider.allRequests.length,
                        itemBuilder: (context, index) {
                          final user = provider.allRequests[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(BaseService.mediaUrl + "/profile/" + user.userPic),
                                  ),
                                  title: Text(user.fullName, style: TextStyle(fontWeight: FontWeight.bold)),
                                  subtitle: Text("Role: ${user.requestType}\nPosition:${user.position}\nPlatform: "
                                      "${user.platFrom}\nDate: ${GlobalData.timeAgo(user.requestDate)}"),
                                  trailing: TextButton(
                                    child: Text(
                                      "View Details",
                                      style: TextStyle(decoration: TextDecoration.underline),
                                    ),
                                    onPressed: () {
                                      GlobalData.profileCnic = user.userCnic;
                                      GlobalData.temp = user;
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdminuserdetailScreen(),));
                                    },
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomElevatedButton(
                                        text: "Approve",
                                        buttonStyle: CustomButtonStyles.fillPrimaryTL13,
                                        buttonTextStyle: Theme.of(context).textTheme.labelLarge!,
                                        onPressed: () async {
                                          try {
                                            BaseService.showLoading("Request Approving...", context);
                                            Map<String, String> requestBody = {
                                              'status': 'Approved',
                                              'cnic': user.userCnic,
                                              'objection': "All Clear",
                                            };
                                            await BaseService.postRequest('Admin/UpdateRequest', requestBody);
                                            provider.loadData();
                                            Navigator.of(context).pop();
                                            GlobalData.showSnackBar("Request Approved", context);
                                          } catch (e) {
                                            Navigator.of(context).pop();
                                            GlobalData.showSnackBar("Failed", context);
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
                                          bool? result = await showDialog<bool>(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                              content: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Please Describe Your Decline Reason",
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 20.0),
                                                    TextFormField(
                                                      controller: _objectionController,
                                                      maxLines: 4,
                                                      decoration: InputDecoration(
                                                        hintText: "Enter your reason here",
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10.0),
                                                        ),
                                                        contentPadding: EdgeInsets.all(10.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop(false);
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop(true);
                                                  },
                                                  child: Text("Submit",style: TextStyle(color: Colors.white),),
                                                ),
                                              ],
                                            ),
                                          );

                                          if (result == true) {
                                            try {
                                              BaseService.showLoading("Request Decline...", context);
                                              Map<String, String> requestBody = {
                                                'status': 'Rejected',
                                                'cnic': user.userCnic,
                                                'objection': _objectionController.text,
                                              };
                                              await BaseService.postRequest('Admin/UpdateRequest', requestBody);
                                              provider.loadData();
                                              Navigator.of(context).pop();
                                              GlobalData.showSnackBar("Request Rejected", context);
                                            } catch (e) {
                                              Navigator.of(context).pop();
                                              GlobalData.showSnackBar("Failed", context);
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
