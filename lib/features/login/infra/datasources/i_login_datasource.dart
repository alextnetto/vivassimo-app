import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

abstract class ILoginDatasource {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel);
}
