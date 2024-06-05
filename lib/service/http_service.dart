import 'dart:convert';

import 'package:http/http.dart';
import 'package:university_list/model/university_model.dart';

class Network {
  static String BASE = "Universities-List-API.proxy-production.allthingsdev.co";
  static Map<String, String> headers = {
    'x-apihub-key': 'utluvWb8SBkqJYLO6hDaquIcFzCnUsM7lyuPkIrPcUSee-4nQ6',
    'x-apihub-host': 'Universities-List-API.allthingsdev.co'
  };

  static String API_GET = "/search";

  // HTTP requests
  static Future<String?> GET(
      {required String api, required Map<String, String> params}) async {
    var uri = Uri.https(BASE, api, params);
    try {
      var response = await get(uri, headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print("RESPONSE STATUS CODE: ${response.statusCode}");
        print("RESPONSE DATA: ${response.body}");
        return null;
      }
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }

  // Params
  static Map<String, String> paramsEmpty() {
    return {};
  }

  static List<UniversityModel> parsingResponse({required String response}) {
    var responseMap = jsonDecode(response);
    List<UniversityModel> universityList = List<UniversityModel>.from(
        responseMap.map((mp) => UniversityModel.fromJson(mp)));
    return universityList;
  }
}
