import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp/core/app_export.dart';
import 'package:http/http.dart' as http;
import '../apis/app_exception.dart';

abstract class BaseService {
  // static String ip = '192.168.43.57'; //my phone ip
  static String ip = '192.168.0.102';
  static String baseUrl = "http://$ip/FypApi/";
  static String mediaUrl = "http://$ip/FypApi/Uploads/";
  static showLoading(String text, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 3,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: const CircularProgressIndicator(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    text,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  static Future<dynamic> postRequest(String url, dynamic body,
      {Map<String, dynamic>? fileFields}) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
      request.headers['Content-Type'] = 'application/json; charset=UTF-8';
      if (body != null) {
        request.fields.addAll(body);
      }
      if (fileFields != null && fileFields.isNotEmpty) {
        for (var entry in fileFields.entries) {
          if (entry.value is File) {
            request.files.add(
                await http.MultipartFile.fromPath(entry.key, entry.value.path));
          }
        }
      }

      final streamedResponse =
      await request.send().timeout(Duration(seconds: 30));
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
      } else if (response.statusCode == 409) {
        throw BadRequestException(response.body);
      } else if (response.statusCode == 400 || response.statusCode == 404) {
        throw NoInternetException();
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Request timed out');
    }
    return responseJson;
  }

  static Future<dynamic> getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  static dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 407:
        throw BadRequestException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
