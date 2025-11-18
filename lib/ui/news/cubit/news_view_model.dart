import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/api/api_manager.dart';
import 'package:news_app_flutter/ui/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<ArticlesStates> {
  NewsViewModel() : super(ArticlesLoadingStates());

  void getNews(String sourceId, String query) async {
    var response = await ApiManager.getNews(sourceId, query);

    emit(ArticlesLoadingStates());

    try {
      if (response.status == 'error') {
        emit(ArticlesErrorStates(errorMessage: response.message!));
        return;
      }
      if (response.status == 'ok') {
        emit(ArticlesSuccessStates(newsList: response.articles));
        return;
      }
    } catch (e) {
      emit(ArticlesErrorStates(errorMessage: e.toString()));
    }
  }
}
