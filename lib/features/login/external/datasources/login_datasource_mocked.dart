import 'package:my_app/features/login/infra/datasources/i_login_datasource.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

class LoginDatasourceMocked implements ILoginDatasource {
  // final IRequestService httpClient;

  // LoginDatasourceMocked(this.httpClient);

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    return LoginResponseModel.fromJson(loginReponseModelMock);
  }
}

const String loginReponseModelMock = """
  {
    "token": "fjdiosaifasd"
  }
""";
