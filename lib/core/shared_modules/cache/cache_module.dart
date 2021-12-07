import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/datasource_services/local_datasource_service/shared_preferences_service.dart';
import 'domain/usecases/cache_usecase.dart';
import 'external/datasources/sharedpreferences_datasource.dart';
import 'infra/repositories/cache_repository_impl.dart';

class AppCache extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SharedPreferencesService()),
        Bind((i) => CacheDatasource(i())),
        Bind((i) => CacheRepository(i())),
        Bind((i) => CacheUsecase(i())),
      ];
}
