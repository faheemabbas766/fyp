import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/postreport_model.dart';

/// A provider class for the PostreportScreen.
///
/// This provider manages the state of the PostreportScreen, including the
/// current postreportModelObj
class PostreportProvider extends ChangeNotifier {
  PostreportModel postreportModelObj = PostreportModel();

  @override
  void dispose() {
    super.dispose();
  }
}
