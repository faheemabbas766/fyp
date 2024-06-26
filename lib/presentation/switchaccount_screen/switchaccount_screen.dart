import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/global/global.dart';
import '../../core/services/base_service.dart';
import '../../widgets/custom_elevated_button.dart';
import 'models/switchaccount_model.dart';
import 'provider/switchaccount_provider.dart';

class SwitchAccountScreen extends StatefulWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  SwitchAccountScreenState createState() => SwitchAccountScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SwitchAccountProvider(),
      child: SwitchAccountScreen(),
    );
  }
}

class SwitchAccountScreenState extends State<SwitchAccountScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  String? imagePath;
  File? _selectedImage;

  Future<void> pickImage(BuildContext context) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
        setState(() {
          imagePath = _selectedImage!.path;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  bool validateFields(SwitchAccountProvider provider) {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Center(child: Text("Please upload a document."))),
      );
      return false;
    }

    if (provider.radioGroup == null || provider.radioGroup!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Center(child: Text("Please choose a role."))),
      );
      return false;
    }

    if (provider.radioGroup == 'Politician') {
      if (provider.selectedParty == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text("Please select a party."))),
        );
        return false;
      }
      if (provider.position == null || provider.position!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text("Please enter your position."))),
        );
        return false;
      }
    }

    if (provider.radioGroup == 'Journalist' || provider.radioGroup == 'Admin') {
      if (provider.platform == null || provider.platform!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text("Please enter your platform."))),
        );
        return false;
      }
      if (provider.position == null || provider.position!.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text("Please enter your position."))),
        );
        return false;
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Upgrade Account Request",
            style: CustomTextStyles.titleMediumBlack90005Bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 18.h,
              vertical: 34.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: BaseService.mediaUrl + "Profile/" + (GlobalData.prefs.getString('user_pic') ?? ''),
                  height: 110.adaptSize,
                  fit: BoxFit.cover,
                  width: 110.adaptSize,
                  radius: BorderRadius.circular(55.0),
                ),
                SizedBox(height: 31.v),
                Text(
                  "Switch Account",
                  style: CustomTextStyles.titleMediumGreen900,
                ),
                SizedBox(height: 16.v),
                Text(
                  "Choose your Role",
                  style: CustomTextStyles.titleMediumBlack90005Bold,
                ),
                SizedBox(height: 25.v),
                _buildRoleDropdown(context),
                SizedBox(height: 24.v),
                Consumer<SwitchAccountProvider>(
                  builder: (context, provider, child) {
                    switch (provider.radioGroup) {
                      case 'Politician':
                        return _buildPolitician(provider);
                      case 'Journalist':
                        return _buildJournalistFields(provider);
                      case 'Admin':
                        return _buildAdminFields(provider);
                      default:
                        return SizedBox.shrink();
                    }
                  },
                ),
                SizedBox(height: 31.v),
                imagePath != null
                    ? Container(
                  height: 100,
                  width: 100,
                  child: InkWell(
                    onTap: () async {
                      await pickImage(context);
                      setState(() {});
                    },
                    child: Image.file(
                      File(imagePath ?? ''),
                      fit: BoxFit.cover,
                      height: 293.v,
                      width: 409.h,
                    ),
                  ),
                )
                    : InkWell(
                  onTap: () {
                    pickImage(context);
                  },
                  child: DottedBorder(
                    color: appTheme.black90003,
                    padding: EdgeInsets.all(10.h),
                    strokeWidth: 1.h,
                    dashPattern: [4, 4],
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
                ),
                SizedBox(height: 10.h),
                CustomElevatedButton(
                  height: 42.0,
                  text: "Send Request",
                  buttonTextStyle: CustomTextStyles.titleMediumGray50,
                  onPressed: () async {
                    final provider = Provider.of<SwitchAccountProvider>(context, listen: false);
                    if (validateFields(provider)) {
                      try {
                        BaseService.showLoading("Uploading Request...", context);
                        Map<String, String> body = {
                          'User_cnic': GlobalData.prefs.getString('cnic')!,
                          'request_type': provider.radioGroup!,
                          'platform': provider.platform!,
                          'position': provider.position!,
                        };
                        Map<String, dynamic> fileFields = {
                          'request_document': _selectedImage,
                        };
                        await BaseService.postRequest('Main/UpgradeAccountRequest', body, fileFields: fileFields);
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(child: Text('Request Successful!')),
                          ),
                        );
                        _selectedImage = null;
                        setState(() {
                          imagePath = null;
                        });
                      } catch (e) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(child: Text(e.toString())),
                          ),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleDropdown(BuildContext context) {
    return Consumer<SwitchAccountProvider>(
      builder: (context, provider, child) {
        return DropdownButton<String>(
          value: provider.radioGroup,
          onChanged: (String? newValue) {
            imagePath = null;
            _selectedImage = null;
            setState(() {});
            provider.changeRadioButton(newValue);
          },
          items: <String>['Politician', 'Journalist', 'Admin']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildPolitician(SwitchAccountProvider provider) {
    return Column(
      children: [
        _buildPartyDropdown(provider),
        TextField(
          decoration: InputDecoration(labelText: 'Position'),
          onChanged: (value) {
            provider.updatePosition(value);
          },
        ),
      ],
    );
  }

  Widget _buildJournalistFields(SwitchAccountProvider provider) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Channel'),
          onChanged: (value) {
            provider.updatePlatform(value);
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Position'),
          onChanged: (value) {
            provider.updatePosition(value);
          },
        ),
      ],
    );
  }

  Widget _buildAdminFields(SwitchAccountProvider provider) {
    return Column(
      children: [
        Text("Admin Level"),
        RadioListTile<String>(
          title: const Text('Senior'),
          value: 'Senior',
          groupValue: provider.position,
          onChanged: (String? value) {
            provider.updatePosition(value!);
            provider.updatePlatform('Admin');
          },
        ),
        RadioListTile<String>(
          title: const Text('Junior'),
          value: 'Junior',
          groupValue: provider.position,
          onChanged: (String? value) {
            provider.updatePosition(value!);
            provider.updatePlatform('Admin');
          },
        ),
      ],
    );
  }

  Widget _buildPartyDropdown(SwitchAccountProvider provider) {
    return DropdownButton<Party>(
      value: provider.selectedParty,
      onChanged: (Party? newValue) {
        provider.updateSelectedParty(newValue!);
      },
      items: GlobalData.parties.map<DropdownMenuItem<Party>>((Party party) {
        return DropdownMenuItem<Party>(
          value: party,
          child: PartyDropdownItem(party: party),
        );
      }).toList(),
    );
  }
}

class PartyDropdownItem extends StatelessWidget {
  final Party party;

  const PartyDropdownItem({required this.party});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(imagePath: BaseService.mediaUrl + party.partyFlag, width: 24, height: 24),
        SizedBox(width: 10),
        CustomImageView(imagePath: BaseService.mediaUrl + party.partySymbol, width: 24, height: 24),
        SizedBox(width: 10),
        Text(
          party.partyName,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
