import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/api/api_manager.dart';
import 'package:news_app_flutter/ui/category_details/cubit/news_category_states.dart';

class CategoryViewModel extends Cubit<NewsStates> {
  CategoryViewModel() : super(NewsLoadingStates());

  /// todo: hold logic _ fetch data

  void getSources(String categoryId) async {
    var response = await ApiManager.getSources(categoryId: categoryId);
    try {
      if (response.status == 'error') {
        emit(NewsErrorStates(errorMessage: response.message));
        return;
      }
      if (response.status == 'ok') {
        emit(NewsSuccessStates(sourcesList: response.sources!));
        return;
      }
    } catch (e) {
      emit(NewsErrorStates(errorMessage: response.message));
    }
  }
}
