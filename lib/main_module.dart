import 'package:flutter_modular/flutter_modular.dart';

import 'core/stores/config_store.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => ConfigStore()),
    ];
  }

  // List<Router> get routers => throw UnimplementedError();
}
