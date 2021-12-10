import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/shared_modules/cache/domain/usecases/cache_usecase.dart';
import 'package:my_app/core/utils/enums/app_enums.dart';
import 'package:package_info/package_info.dart';

class PageUtils {
  static bool internetIsActive = true;
  static EnvironmentType? currentEnviroment;

  static Future<void> setInstanceEnvironment() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      if (packageInfo.appName.toLowerCase().contains("dev")) {
        currentEnviroment = EnvironmentType.dev;
      } else {
        currentEnviroment = EnvironmentType.prod;
      }
    });
  }

  static cleanCache() async {
    var cacheUsecase = Modular.get<CacheUsecase>();

    await cacheUsecase.cleanCache('UserInfo');
  }
}
