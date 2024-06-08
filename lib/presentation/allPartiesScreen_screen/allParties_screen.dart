import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fyp/core/app_export.dart';
import 'package:fyp/core/global/global.dart';
import 'package:fyp/presentation/allPartiesScreen_screen/provider/allPartiesScreen_provider.dart';
import '../../core/services/base_service.dart';
import '../../widgets/custom_elevated_button.dart';
import '../switchaccount_screen/models/switchaccount_model.dart';

class AllPartiesScreen extends StatefulWidget {
  const AllPartiesScreen({Key? key}) : super(key: key);

  @override
  AllPartiesScreenState createState() => AllPartiesScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllPartiesScreenProvider(),
      child: const AllPartiesScreen(),
    );
  }
}

class AllPartiesScreenState extends State<AllPartiesScreen> {
  final TextEditingController _partyName = TextEditingController();
  XFile? _partySymbol;
  XFile? _partyFlag;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickImage(ImageSource source, Function(XFile) onSelected) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      onSelected(image);
    }
  }

  Future<void> _showAddPartyDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text(
              'Add Party',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      controller: _partyName,
                      decoration: InputDecoration(
                        labelText: 'Party Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the party name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                      onPressed: () => _pickImage(
                        ImageSource.gallery,
                            (image) => setState(() => _partySymbol = image),
                      ),
                      text: 'Select Party Symbol',
                    ),
                    const SizedBox(height: 10),
                    if (_partySymbol != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(_partySymbol!.path),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (_partySymbol == null)
                      const Text(
                        'Please select a party symbol',
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                      onPressed: () => _pickImage(
                        ImageSource.gallery,
                            (image) => setState(() => _partyFlag = image),
                      ),
                      text: 'Select Party Flag',
                    ),
                    const SizedBox(height: 10),
                    if (_partyFlag != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(_partyFlag!.path),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (_partyFlag == null)
                      const Text(
                        'Please select a party flag',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.redAccent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Add'),
                onPressed: () async {
                  if (_formKey.currentState!.validate() && _partySymbol != null && _partyFlag != null) {
                    Map<String, String> requestedBody = {
                      'party_name': _partyName.text,
                    };

                    Map<String, dynamic> fileFields = {
                      'party_symbol': File(_partySymbol!.path),
                      'party_flag': File(_partyFlag!.path),
                    };

                    try {
                      await BaseService.postRequest("Admin/AddParty", requestedBody, fileFields: fileFields);
                      GlobalData.showSnackBar("Successfully Added", context);
                      GlobalData.parties = (await BaseService.postRequest('Main/AllParties', null)).map<Party>((json) => Party.fromJson(json)).toList();
                    } catch (e) {
                      GlobalData.showSnackBar("Failure", context);
                    }
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'All Parties',
          ),
          centerTitle: true,
          elevation: 4,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: GlobalData.parties.length,
            itemBuilder: (context, index) {
              var i = GlobalData.parties[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CustomImageView(
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                      imagePath: BaseService.mediaUrl + i.partySymbol,
                    ),
                  ),
                  title: Text(
                    i.partyName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  trailing: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CustomImageView(
                      height: 50,
                      width: 70,
                      fit: BoxFit.fill,
                      imagePath: BaseService.mediaUrl + i.partyFlag,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: _showAddPartyDialog,
          child: const Icon(Icons.add, size: 30),
          elevation: 5,
        ),
      ),
    );
  }
}
