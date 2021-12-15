import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/datasource_services/remote_datasource_service/request_service/http_service.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
import 'package:my_app/features/register/external/datasources/register_datasource.dart';
import 'package:my_app/features/register/infra/repositories/register_repository.dart';
import 'package:my_app/features/register/presentation/stores/otp_store.dart';
import 'package:my_app/features/register/presentation/stores/register_store.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HttpService()),
        Bind.factory((i) => RegisterDatasource(i())),
        Bind.factory((i) => RegisterRepository(i())),
        Bind.factory((i) => RegisterUsecase(i())),
        Bind.factory((i) => RegisterStepOneStore(i())),
        Bind.factory((i) => OtpStore(i())),
      ];

  // @override
  // List<Router> get routers => [
  //       Router(Modular.initialRoute, child: (_, args) => RegisterPage()),
  //     ];

  // static Inject get to => Inject<RegisterModule>.of();
}
