import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_flutter/data/repository/news/repository/news_repository.dart';
import 'package:news_app_flutter/ui/news/cubit/news_states.dart';

@injectable
class NewsViewModel extends Cubit<ArticlesStates> {
  // Good: Properly initializes state to Loading
  NewsViewModel({required this.newsRepository})
      : super(ArticlesLoadingStates());

  // Recommended: Use 'final' for injected dependencies
  final NewsRepository newsRepository;

  void getNews(String sourceId, String query) async {
    // Crucial Fix: Re-emits Loading when retrying from an Error state
    if (state is! ArticlesLoadingStates) {
      emit(ArticlesLoadingStates());
    }

    try {
      var response = await newsRepository.getNews(sourceId, query);

      // Success check is now first and cleanest
      if (response.status == 'ok') {
        emit(ArticlesSuccessStates(newsList: response.articles));
        return;
      }

      // API Error handling
      if (response.status == 'error') {
        // Safe check for message
        final errorMessage = response.message ??
            'An unknown API error occurred.';
        emit(ArticlesErrorStates(errorMessage: errorMessage));
        return;
      }

      // Fallback for unexpected status
      emit(ArticlesErrorStates(
          errorMessage: 'Received unexpected API status: ${response.status}'));

    } catch (e) {
      // Network/Exception Error Handling (e.g., no Wi-Fi)
      String friendlyError = 'Could not connect to the internet or API. Please check your connection and try again.';
      if (e.toString().contains('SocketException') ||
          e.toString().contains('TimeoutException')) {
        emit(ArticlesErrorStates(errorMessage: friendlyError));
      } else {
        emit(ArticlesErrorStates(errorMessage: e.toString()));
      }
    }
  }
}