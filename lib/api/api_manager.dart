import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:news_app_flutter/api/api_constants.dart';
import 'package:news_app_flutter/model/newsResponse.dart';
import 'package:news_app_flutter/model/sourceResponse.dart';

@singleton
class ApiManager {
  ///https://newsapi.org/v2/top-headlines/sources?apiKey=8ba0843ad1af49ae93ea0845d5e5da7c
  Future<SourceResponse> getSources({required String categoryId}) async {
    ///Uri => uniform resource identifier
    Uri url = Uri.https(ApiConstants.serverName, ApiConstants.apiName, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
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

  /// https://newsapi.org/v2/everything?q=bitcoin&apiKey=8ba0843ad1af49ae93ea0845d5e5da7c
  Future<NewsResponse> getNews(String sourceId, String query) async {
    Uri url = Uri.https(
        ApiConstants.serverName,
        ApiConstants.newsApiName,
        {
          'apiKey': ApiConstants.apiKey,
          'sources': sourceId,
          if (query.isNotEmpty) 'q': query, // keyword to search for
          if (query.isNotEmpty) 'searchIn': 'title,description,content'
        }
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
