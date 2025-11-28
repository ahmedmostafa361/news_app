import 'package:news_app_flutter/api/api_manager.dart';
import 'package:news_app_flutter/data/repository/news/data_sources/remote/remote_news_data_sources_repository.dart';
import 'package:news_app_flutter/data/repository/news/data_sources/remote/remote_news_data_sources_repository_impl.dart';
import 'package:news_app_flutter/data/repository/news/repository/news_repository.dart';
import 'package:news_app_flutter/data/repository/news/repository/news_repository_impl.dart';
import 'package:news_app_flutter/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news_app_flutter/data/repository/sources/data_sources/local/source_local_data_source_impl.dart';
import 'package:news_app_flutter/data/repository/sources/data_sources/remote/source_remote_data_sources.dart';
import 'package:news_app_flutter/data/repository/sources/data_sources/remote/source_remote_data_sources_impl.dart';
import 'package:news_app_flutter/data/repository/sources/repository/source_repository.dart';
import 'package:news_app_flutter/data/repository/sources/repository/source_repository_impl.dart';

/// sourceViewModel   =>  object sourceRepository
/// sourceRepository  =>  object sourceRemoteDSRepository
/// sourceRemoteDSRepository  => object ApiManager

SourceRepository injectSourceRepository() {
  return SourceRepositoryImpl(
      sourceRemoteDataSources: injectSourceRemoteDS(),
      sourceLocalDataSource: injectSourceLocalDS()
  );
}

SourceRemoteDataSources injectSourceRemoteDS() {
  return SourceRemoteDataSourcesImpl(apiManager: injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();
}

/// newsViewModel   =>  object newsRepository
/// newsRepository  =>  object newsRemoteDSRepository
/// newsRemoteDSRepository  => object ApiManager
SourceLocalDataSource injectSourceLocalDS() {
  return SourceLocalDataSourceImpl();
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryImpl(remoteDataSourcesRepository: injectNewsRemoteDS());
}

RemoteDataSourcesRepository injectNewsRemoteDS() {
  return RemoteDataSourcesRepositoryImpl(apiManager: injectNewsApiManager());
}

ApiManager injectNewsApiManager() {
  return ApiManager();
}
