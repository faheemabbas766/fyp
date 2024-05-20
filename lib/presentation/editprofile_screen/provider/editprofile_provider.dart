import 'package:flutter/material.dart';
import '../models/editprofile_model.dart';

/// A provider class for the EditprofileScreen.
///
/// This provider manages the state of the EditprofileScreen, including the
/// current editprofileModelObj

// ignore_for_file: must_be_immutable
class EditprofileProvider extends ChangeNotifier {
  EditprofileModel editprofileModelObj = EditprofileModel();

  @override
  void dispose() {
    super.dispose();
  }
}
