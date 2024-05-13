import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/addpost_model.dart';
class AddpostProvider extends ChangeNotifier {
  AddpostModel addpostModelObj = AddpostModel();

  @override
  void dispose() {
    super.dispose();
  }
}
