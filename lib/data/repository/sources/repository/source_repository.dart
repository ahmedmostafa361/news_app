import 'package:news_app_flutter/model/sourceResponse.dart';

abstract class SourceRepository {
  Future<SourceResponse> getSources(String categoryId);
}