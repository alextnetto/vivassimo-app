import 'package:dartz/dartz.dart';
import 'package:my_app/core/shared_modules/cache/domain/errors/errors.dart';
import 'package:my_app/core/shared_modules/cache/domain/repositories/cache_repoitory.dart';

abstract class ICacheUsecase {
  Future<Either<CacheError, bool>> setCache(String chave, dynamic valor);
  Future<Either<CacheError, dynamic>> getCache(String chave);
  Future<Either<CacheError, dynamic>> cleanCache(String chave);
}

class CacheUsecase implements ICacheUsecase {
  final ICacheRepository repo;

  CacheUsecase(this.repo);
  @override
  Future<Either<CacheError, bool>> setCache(String? key, dynamic value) async {
    if (key == null || key.isEmpty) {
      return Left(KeyIsMandatoryError());
    }
    if (value == null) {
      return Left(ValueIsMandatoryError());
    }
    return repo.setCache(key, value);
  }

  @override
  Future<Either<CacheError, dynamic>> getCache(String? key) async {
    if (key == null || key.isEmpty) {
      return Left(KeyIsMandatoryError());
    }
    return repo.getCache(key);
  }

  @override
  Future<Either<CacheError, dynamic>> cleanCache(String? key) async {
    if (key == null || key.isEmpty) {
      return Left(KeyIsMandatoryError());
    }
    return repo.cleanCache(key);
  }
}
