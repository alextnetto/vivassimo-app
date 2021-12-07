abstract class ICacheDataSource {
  Future<bool> setCache(String chave, dynamic valor);
  Future<dynamic> getCache(String chave);
  Future<dynamic> cleanCache(String chave);
}
