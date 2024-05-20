import 'package:flutter/material.dart';
import '../models/following_model.dart';

/// A provider class for the FollowingScreen.
///
/// This provider manages the state of the FollowingScreen, including the
/// current followingModelObj

// ignore_for_file: must_be_immutable
class FollowingProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  FollowingModel followingModelObj = FollowingModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
