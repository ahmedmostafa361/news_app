import 'package:news_app_flutter/data/repository/news/data_sources/remote/remote_news_data_sources_repository.dart';
import 'package:news_app_flutter/data/repository/news/repository/news_repository.dart';
import 'package:news_app_flutter/model/newsResponse.dart';

class NewsRepositoryImpl implements NewsRepository {
  RemoteDataSourcesRepository remoteDataSourcesRepository;

  NewsRepositoryImpl({required this.remoteDataSourcesRepository});

  @override
  Future<NewsResponse> getNews(String sourceId, String query) {
    return remoteDataSourcesRepository.getNews(sourceId, query);
  }
}
