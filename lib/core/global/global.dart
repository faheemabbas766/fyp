import 'package:flutter/material.dart';
import 'package:fyp/data/models/politician_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalData{
  static late List<Politician> allPoliticianList;
  static late SharedPreferences prefs;
  static String profileCnic = '';
  static String postId = '3';
  static String commentId = '1';
  static String getPoliticianById(String cnic) {
    try {
      cnic = cnic.replaceAll(RegExp(r'\s+'), '');
      return allPoliticianList.firstWhere(
              (politician) => politician.politicianCNIC == cnic
      ).userFullName;
    } catch (e) {
      return "Not Found";
    }
  }
  static String timeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);

    if (diff.inSeconds < 60) {
      return 'just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
    } else {
      final int weeks = (diff.inDays / 7).floor();
      if (weeks < 4) {
        return '${weeks} week${weeks == 1 ? '' : 's'} ago';
      } else {
        final int months = (diff.inDays / 30).floor();
        if (months < 12) {
          return '${months} month${months == 1 ? '' : 's'} ago';
        } else {
          final int years = (diff.inDays / 365).floor();
          return '${years} year${years == 1 ? '' : 's'} ago';
        }
      }
    }
  }
  static String getOrdinal(int number) {
    if (number <= 0) {
      throw ArgumentError('Number must be greater than zero');
    }
    String suffix;
    int lastDigit = number % 10;
    int lastTwoDigits = number % 100;

    if (lastTwoDigits >= 11 && lastTwoDigits <= 13) {
      suffix = 'th';
    } else {
      switch (lastDigit) {
        case 1:
          suffix = 'st';
          break;
        case 2:
          suffix = 'nd';
          break;
        case 3:
          suffix = 'rd';
          break;
        default:
          suffix = 'th';
      }
    }

    return '$number$suffix';
  }

  static void showSnackBar(String text,BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Center(child: Text(text)),
      ),
    );
  }
}