import 'package:news_app_flutter/api/api_manager.dart';
import 'package:news_app_flutter/data/repository/sources/data_sources/remote/source_remote_data_sources.dart';
import 'package:news_app_flutter/model/sourceResponse.dart';

/// todo: here we can use many data sources like hpp , dio , retrofit

/// here we use hpp
class SourceRemoteDataSourcesImpl implements SourceRemoteDataSources {
  ApiManager apiManager;

  SourceRemoteDataSourcesImpl({required this.apiManager});

  @override
  Future<SourceResponse> getSources(String categoryId) {
    return apiManager.getSources(categoryId: categoryId);
  }
}

/// here we can use dio
class SourceRemoteDataSourcesImpl1 implements SourceRemoteDataSources {
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}
