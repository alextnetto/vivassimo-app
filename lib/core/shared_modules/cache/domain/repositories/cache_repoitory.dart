import 'package:dartz/dartz.dart';
import 'package:my_app/core/shared_modules/cache/domain/errors/errors.dart';

abstract class ICacheRepository {
  Future<Either<CacheError, bool>> setCache(String chave, dynamic valor);
  Future<Either<CacheError, dynamic>> getCache(String chave);
  Future<Either<CacheError, dynamic>> cleanCache(String chave);
}
