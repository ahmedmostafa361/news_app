import 'package:injectable/injectable.dart';
import 'package:news_app_flutter/api/api_manager.dart';
import 'package:news_app_flutter/data/repository/news/data_sources/remote/remote_news_data_sources_repository.dart';
import 'package:news_app_flutter/model/newsResponse.dart';

@Injectable(as: RemoteDataSourcesRepository)
class RemoteDataSourcesRepositoryImpl implements RemoteDataSourcesRepository {
  ApiManager apiManager;

  RemoteDataSourcesRepositoryImpl({required this.apiManager});

  @override
  Future<NewsResponse> getNews(String sourceId, String query) {
    return apiManager.getNews(sourceId, query);
  }
}
