import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/datasource_services/remote_datasource_service/request_service/http_service.dart';
import 'package:my_app/features/login/domain/usecases/login_usecase.dart';
import 'package:my_app/features/login/infra/repositories/login_repository.dart';
import 'package:my_app/features/login/presentation/stores/login_store.dart';
import 'package:my_app/core/shared_modules/otp/presentation/stores/otp_store.dart';

import 'external/datasources/login_datasource.dart';
import 'external/datasources/login_datasource_mocked.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.factory((i) => HttpService()),
      Bind.factory((i) => LoginDatasource(i())),
      // Bind.factory((i) => LoginDatasourceMocked()),
      Bind.factory((i) => LoginRepository(i())),
      Bind.factory((i) => LoginUsecase(i(), i())),
      Bind.factory((i) => LoginStore(i())),
      Bind.factory((i) => OtpStore(i())),
    ];
  }
}
