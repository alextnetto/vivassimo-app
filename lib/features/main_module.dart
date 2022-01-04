import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/datasource_services/remote_datasource_service/request_service/http_service.dart';
import 'package:my_app/core/shared_modules/otp/domain/usecases/otp_usecase.dart';
import 'package:my_app/core/shared_modules/otp/external/datasources/otp_datasource.dart';
import 'package:my_app/core/shared_modules/otp/external/datasources/otp_datasource_mocked.dart';
import 'package:my_app/core/shared_modules/otp/infra/repositories/otp_repository.dart';
import 'package:my_app/core/shared_modules/otp/presentation/stores/otp_store.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.factory((i) => HttpService()),
      Bind.factory((i) => OtpDatasource(i())),
      // Bind.factory((i) => OtpDatasourceMocked()),
      Bind.factory((i) => OtpRepository(i())),
      Bind.factory((i) => OtpUsecase(i())),
      Bind.factory((i) => OtpStore(i())),
    ];
  }
}
