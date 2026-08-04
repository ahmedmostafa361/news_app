import 'package:news_app_flutter/model/sourceResponse.dart';

/// interface => remote data sources
abstract class SourceRemoteDataSources {
  Future<SourceResponse> getSources(String categoryId);
}
