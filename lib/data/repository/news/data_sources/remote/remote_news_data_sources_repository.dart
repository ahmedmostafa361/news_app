import '../../../../../model/newsResponse.dart';

abstract class RemoteDataSourcesRepository {
  Future<NewsResponse> getNews(String sourceId, String query);
}
