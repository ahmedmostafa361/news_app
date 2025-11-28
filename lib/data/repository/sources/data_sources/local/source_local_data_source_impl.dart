import 'package:hive_flutter/adapters.dart';
import 'package:news_app_flutter/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news_app_flutter/model/sourceResponse.dart';

class SourceLocalDataSourceImpl implements SourceLocalDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId) async {
    // TODO: implement getSources
    var box = await Hive.openBox('sources');
    var data = box.get(categoryId);
    return SourceResponse.fromJson(data);
  }

  @override
  void saveSources(SourceResponse sourceResponse, String categoryId) async {
    var box = await Hive.openBox('sources');
    box.put(categoryId, sourceResponse.toJson());
    box.close();
  }
}
