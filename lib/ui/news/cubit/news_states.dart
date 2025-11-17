import '../../../model/newsResponse.dart';

abstract class ArticlesStates {}

class ArticlesLoadingStates extends ArticlesStates {}

class ArticlesErrorStates extends ArticlesStates {
  String errorMessage;

  ArticlesErrorStates({required this.errorMessage});
}

class ArticlesSuccessStates extends ArticlesStates {
  List<Articles>? newsList;

  ArticlesSuccessStates({required this.newsList});
}
