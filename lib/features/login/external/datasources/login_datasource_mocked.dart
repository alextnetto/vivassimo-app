import 'package:my_app/core/contracts/i_request_service.dart';

import 'package:my_app/features/login/infra/datasources/i_login_datasource.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

class LoginDatasourceMocked implements ILoginDatasource {
  final IRequestService httpClient;

  LoginDatasourceMocked(this.httpClient);

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    return LoginResponseModel.fromJson(loginReponseModelMock);
    // String body = loginRequestModel.toJson();

    // final response = await httpClient.post(endpoint: '/login', body: body);

    // print(response.body);

    // if (response.statusCode == 200) {
    //   var resultModel = LoginResponseModel.fromJson(response.body);
    //   return resultModel;
    // } else if (response.statusCode == 404) {
    //   throw LoginNotFoundError(message: response.body);
    // } else if (response.statusCode == 401) {
    //   throw LoginNotAuthorizedError(message: response.body);
    // } else {
    //   throw LoginDatasourceError(message: response.body);
    // }
  }
}

const String loginReponseModelMock = """
  {
    "token": "fjdiosaifasd"
  }
""";
