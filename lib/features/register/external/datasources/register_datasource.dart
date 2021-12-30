import 'dart:convert';
import 'package:my_app/core/contracts/i_request_service.dart';
import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:my_app/features/register/infra/datasources/i_register_datasource.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';

class RegisterDatasource implements IRegisterDatasource {
  final IRequestService httpClient;

  RegisterDatasource(this.httpClient);

  @override
  Future<CheckExistingUserResponseModel> userExists(CheckExistingUserRequestModel existingUserRequestModel) async {
    var response = await httpClient.get(endpoint: '/userExists', queryParams: existingUserRequestModel.toMap());

    if (response.statusCode == 200) {
      // var resultModel = CheckExistingUserResponseModel.fromJson(response.body);
      var resultModel = CheckExistingUserResponseModel(userExists: response.body == 'true');
      return resultModel;
    } else {
      var message = json.decode(response.body)['message'];

      throw RegisterDatasourceError(message: message);
    }
  }


  @override
  Future<RegisterUserResponseModel> register(RegisterUserRequestModel registerUserRequestModel) async {
    var response = await httpClient.post(endpoint: '/users', body: registerUserRequestModel.toJson());

    if (response.statusCode == 201) {
      var resultModel = RegisterUserResponseModel.fromJson(response.body);
      return resultModel;
    } else if (response.statusCode == 401) {
      var message = json.decode(response.body)['message'];

      throw RegisterDatasourceError(message: message);
    } else {
      var message = json.decode(response.body)['message'];
      throw RegisterDatasourceError(message: message);
    }
  }
}
