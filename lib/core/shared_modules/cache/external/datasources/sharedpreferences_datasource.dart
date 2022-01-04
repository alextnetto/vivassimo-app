import 'package:my_app/core/contracts/i_local_storage_service.dart';
import 'package:my_app/core/shared_modules/cache/infra/datasources/cache_datasource.dart';

class CacheDatasource implements ICacheDataSource {
  final ILocalStorageService localStorage;

  CacheDatasource(this.localStorage);

  @override
  Future<bool> setCache(String key, value) async {
    localStorage.setCache(key, value);

    return true;
  }

  @override
  Future<dynamic> getCache(String key) async {
    var x = localStorage.getCache(key);
    return x;
  }

  @override
  Future cleanCache(String chave) async {
    localStorage.cleanCache(chave);
  }
}
