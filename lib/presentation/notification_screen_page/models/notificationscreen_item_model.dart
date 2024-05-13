import '../../../core/app_export.dart';

/// This class is used in the [notificationscreen_item_widget] screen.
class NotificationscreenItemModel {
  NotificationscreenItemModel({
    this.asadMehmood,
    this.asadMehmood1,
    this.asadMehmood2,
    this.zahidNawaz,
    this.id,
  }) {
    asadMehmood = asadMehmood ?? ImageConstant.imgOval44x44;
    asadMehmood1 = asadMehmood1 ?? "Asad Mehmood";
    asadMehmood2 = asadMehmood2 ?? ImageConstant.imgOval2;
    zahidNawaz = zahidNawaz ?? "Zahid Nawaz";
    id = id ?? "";
  }

  String? asadMehmood;

  String? asadMehmood1;

  String? asadMehmood2;

  String? zahidNawaz;

  String? id;
}
