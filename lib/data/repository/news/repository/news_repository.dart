import '../../../../model/newsResponse.dart';

abstract class NewsRepository {
  Future<NewsResponse> getNews(String sourceId, String query);
}
