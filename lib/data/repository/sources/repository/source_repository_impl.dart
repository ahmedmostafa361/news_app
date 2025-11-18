import 'package:news_app_flutter/data/repository/sources/data_sources/remote/source_remote_data_sources.dart';
import 'package:news_app_flutter/data/repository/sources/repository/source_repository.dart';
import 'package:news_app_flutter/model/sourceResponse.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSources sourceRemoteDataSources;

  SourceRepositoryImpl({required this.sourceRemoteDataSources});

  @override
  Future<SourceResponse> getSources(String categoryId) {
    return sourceRemoteDataSources.getSources(categoryId);
  }
}
