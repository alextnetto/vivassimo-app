import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/io_client.dart';
import 'package:my_app/core/request_service/http_service.dart';
import 'package:my_app/features/login/domain/usecases/login_usecase.dart';
import 'package:my_app/features/login/external/datasources/login_datasource.dart';
import 'package:my_app/features/login/infra/repositories/login_repository.dart';
import 'package:my_app/features/login/presentation/stores/login_store.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds {
    // var http = HttpService();
    return [
      Bind.factory((i) => HttpService()),
      Bind.factory((i) => LoginDatasource(i())),
      Bind.factory((i) => LoginRepository(i())),
      Bind.factory((i) => LoginUsecase(i())),
      Bind.factory((i) => LoginStore(i())),
    ];
  }

  // @override
  // List<Router> get routers => [
  //       Router(Modular.initialRoute, child: (_, args) => LoginPage()),
  //     ];

  // static Inject get to => Inject<LoginModule>.of();
}
