import 'package:news_app_flutter/model/sourceResponse.dart';

class NewsStates {}

class NewsLoadingStates extends NewsStates {}

class NewsErrorStates extends NewsStates {
  String? errorMessage;

  NewsErrorStates({required this.errorMessage});
}

class NewsSuccessStates extends NewsStates {
  List<Sources> sourcesList;

  NewsSuccessStates({required this.sourcesList});
}
