import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_flutter/api/api_constants.dart';
import 'package:news_app_flutter/model/sourceResponse.dart';

class ApiManager {
  ///https://newsapi.org/v2/top-headlines/sources?apiKey=8ba0843ad1af49ae93ea0845d5e5da7c
  static Future<SourceResponse> getSources() async {
    ///Uri => uniform resource identifier
    Uri url = Uri.http(ApiConstants.serverName, ApiConstants.apiName, {
      'apiKey': ApiConstants.apiKey,
    });
    try {
      /// we use try and catch bec. if there is error he show it but app don't stop
      var response = await http.get(url);
      var responseBody = response.body;

      ///  convert it from string into => json => object
      var json = jsonDecode(responseBody);

      /// === json
      return SourceResponse.fromJson(json);

      /// === object of sourceResponse
    } catch (e) {
      rethrow;
    }
  }
}
