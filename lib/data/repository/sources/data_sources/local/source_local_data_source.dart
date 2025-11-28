import 'package:news_app_flutter/model/sourceResponse.dart';

abstract class SourceLocalDataSource {
  // todo: get sources from internet
  Future<SourceResponse> getSources(String categoryId);

  // todo: get sources without internet
  void saveSources(SourceResponse sourceResponse, String categoryId);
}
