import 'dart:convert';

import 'package:college_gatekeeper/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static String baseUrl = 'http://10.0.2.2:5000';

  static Map<String, String> header = {
    "Content-Type": "application/json",
  };

  static Future<dynamic> getRollNumber(
      String endpoint, String base64EncodedImage, BuildContext context) async {
    try {
      Map<String, String> requestBody = {
        'image': base64EncodedImage,
      };

      var body = jsonEncode(requestBody);

      var url = Uri.parse('$baseUrl$endpoint');

      print(url);

      var response = await http.post(
        url,
        headers: header,
        body: body,
      );

      print(response.body);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return responseData;
      } else {
        showSnackBar(context, response.toString());
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  static Future<dynamic> confirmRollNumber(
      String endpoint, String rollNumber, BuildContext context) async {
    try {
      Map<String, dynamic> requestBody = {
        'confirm': true,
        'roll_number': rollNumber,
      };

      var body = jsonEncode(requestBody);

      var url = Uri.parse('$baseUrl$endpoint');

      var response = await http.post(
        url,
        headers: header,
        body: body,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return responseData;
      } else {
        showSnackBar(context, response.toString());
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }
}
