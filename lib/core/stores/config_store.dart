import 'package:mobx/mobx.dart';
import 'package:my_app/core/services/routes_endpoints_config.dart';
part 'config_store.g.dart';

class ConfigStore = _ConfigStoreBase with _$ConfigStore;

abstract class _ConfigStoreBase with Store {
  RoutesEndpointsConfig? routesEndpointsConfig;
}
