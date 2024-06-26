import 'package:flutter/material.dart';
import 'package:fyp/main.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}
class NoInternetException implements Exception {
  late String _message;
  NoInternetException([String message = 'No Internet Exception Occurred']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!
          .showSnackBar(SnackBar(content: Text(message)));
    }
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
