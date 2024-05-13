import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/commentreport_model.dart';

/// A provider class for the CommentreportScreen.
///
/// This provider manages the state of the CommentreportScreen, including the
/// current commentreportModelObj
class CommentreportProvider extends ChangeNotifier {
  CommentreportModel commentreportModelObj = CommentreportModel();

  @override
  void dispose() {
    super.dispose();
  }
}
