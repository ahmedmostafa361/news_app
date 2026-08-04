// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manager.dart' as _i1047;
import '../data/repository/news/data_sources/remote/remote_news_data_sources_repository.dart'
    as _i979;
import '../data/repository/news/data_sources/remote/remote_news_data_sources_repository_impl.dart'
    as _i443;
import '../data/repository/news/repository/news_repository.dart' as _i912;
import '../data/repository/news/repository/news_repository_impl.dart' as _i905;
import '../data/repository/sources/data_sources/local/source_local_data_source.dart'
    as _i316;
import '../data/repository/sources/data_sources/local/source_local_data_source_impl.dart'
    as _i821;
import '../data/repository/sources/data_sources/remote/source_remote_data_sources.dart'
    as _i291;
import '../data/repository/sources/data_sources/remote/source_remote_data_sources_impl.dart'
    as _i748;
import '../data/repository/sources/repository/source_repository.dart' as _i522;
import '../data/repository/sources/repository/source_repository_impl.dart'
    as _i568;
import '../ui/category_details/cubit/category_view_model.dart' as _i799;
import '../ui/news/cubit/news_view_model.dart' as _i936;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i316.SourceLocalDataSource>(
      () => _i821.SourceLocalDataSourceImpl(),
    );
    gh.factory<_i291.SourceRemoteDataSources>(
      () => _i748.SourceRemoteDataSourcesImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i979.RemoteDataSourcesRepository>(
      () => _i443.RemoteDataSourcesRepositoryImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i912.NewsRepository>(
      () => _i905.NewsRepositoryImpl(
        remoteDataSourcesRepository: gh<_i979.RemoteDataSourcesRepository>(),
      ),
    );
    gh.factory<_i522.SourceRepository>(
      () => _i568.SourceRepositoryImpl(
        sourceRemoteDataSources: gh<_i291.SourceRemoteDataSources>(),
        sourceLocalDataSource: gh<_i316.SourceLocalDataSource>(),
      ),
    );
    gh.factory<_i936.NewsViewModel>(
      () => _i936.NewsViewModel(newsRepository: gh<_i912.NewsRepository>()),
    );
    gh.factory<_i799.CategoryViewModel>(
      () => _i799.CategoryViewModel(
        sourceRepository: gh<_i522.SourceRepository>(),
      ),
    );
    return this;
  }
}
