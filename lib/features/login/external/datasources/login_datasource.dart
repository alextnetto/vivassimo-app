import 'package:my_app/core/request_service/interface/i_request_service.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';

import 'package:my_app/features/login/infra/datasources/i_login_datasource.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

class LoginDatasource implements ILoginDatasource {
  final IRequestService httpClient;

  LoginDatasource(this.httpClient);

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    String body = loginRequestModel.toJson();

    print(body);

    final response = await httpClient.post(endpoint: '/login', body: body);

    if (response.statusCode == 200) {
      var resultModel = LoginResponseModel.fromJson(response.body);
      return resultModel;
    } else if (response.statusCode == 404) {
      throw LoginNotFoundError(message: response.body);
    } else if (response.statusCode == 401) {
      throw LoginNotAuthorizedError();
    } else {
      throw LoginDatasourceError();
    }
  }
}
