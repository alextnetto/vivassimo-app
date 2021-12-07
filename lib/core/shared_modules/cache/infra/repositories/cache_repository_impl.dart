import 'package:dartz/dartz.dart';
import 'package:my_app/core/shared_modules/cache/domain/errors/errors.dart';
import 'package:my_app/core/shared_modules/cache/domain/repositories/cache_repoitory.dart';
import 'package:my_app/core/shared_modules/cache/infra/datasources/cache_datasource.dart';

class CacheRepository implements ICacheRepository {
  final ICacheDataSource datasource;

  CacheRepository(this.datasource);
  @override
  Future<Either<CacheError, bool>> setCache(String chave, valor) async {
    try {
      bool result = await datasource.setCache(chave, valor);
      return Right(result);
    } catch (e) {
      return Left((DataSourceError()));
    }
  }

  @override
  Future<Either<CacheError, dynamic>> getCache(String chave) async {
    try {
      dynamic result = await datasource.getCache(chave);
      return Right(result);
    } catch (e) {
      return Left((DataSourceError()));
    }
  }

  @override
  Future<Either<CacheError, dynamic>> cleanCache(String chave) async {
    try {
      bool result = await datasource.cleanCache(chave);
      return Right(result);
    } catch (e) {
      return Left((DataSourceError()));
    }
  }
}
