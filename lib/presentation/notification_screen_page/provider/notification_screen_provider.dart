import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/notification_screen_model.dart';
import '../models/notificationscreen_item_model.dart';

/// A provider class for the NotificationScreenPage.
///
/// This provider manages the state of the NotificationScreenPage, including the
/// current notificationScreenModelObj
class NotificationScreenProvider extends ChangeNotifier {
  NotificationScreenModel notificationScreenModelObj =
      NotificationScreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
