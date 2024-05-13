import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalData{
  static dynamic allPoliticianList;
  static late SharedPreferences prefs;
  static String profileCnic = '';
  static String postId = '3';
  static void showSnackBar(String text,BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Center(child: Text(text)),
      ),
    );
  }
}