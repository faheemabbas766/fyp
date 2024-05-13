import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/followed_model.dart';

/// A provider class for the FollowedScreen.
///
/// This provider manages the state of the FollowedScreen, including the
/// current followedModelObj

// ignore_for_file: must_be_immutable
class FollowedProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  FollowedModel followedModelObj = FollowedModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
