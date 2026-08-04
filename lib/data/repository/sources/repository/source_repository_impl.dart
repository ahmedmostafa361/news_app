import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app_flutter/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news_app_flutter/data/repository/sources/data_sources/remote/source_remote_data_sources.dart';
import 'package:news_app_flutter/data/repository/sources/repository/source_repository.dart';
import 'package:news_app_flutter/model/sourceResponse.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSources sourceRemoteDataSources;
  SourceLocalDataSource sourceLocalDataSource;

  SourceRepositoryImpl(
      {required this.sourceRemoteDataSources, required this.sourceLocalDataSource});

  @override
  Future<SourceResponse> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var sourceResponse = await sourceRemoteDataSources.getSources(categoryId);
      sourceLocalDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    } else {
      var sourceResponse = await sourceLocalDataSource.getSources(categoryId);
      return sourceResponse;
    }
  }
}
