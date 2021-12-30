import 'dart:convert';
import 'package:my_app/features/register/infra/datasources/i_register_datasource.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';

class RegisterDatasourceMocked implements IRegisterDatasource {
  @override
  Future<CheckExistingUserResponseModel> userExists(CheckExistingUserRequestModel existingUserRequestModel) async {
    // var resultModel = CheckExistingUserResponseModel.fromJson(response.body);
    var x = CheckExistingUserResponseModel.fromJson(userExistsReponseModelMock);
    return CheckExistingUserResponseModel.fromJson(userExistsReponseModelMock);
  }

  @override
  Future<RegisterUserResponseModel> register(RegisterUserRequestModel registerUserRequestModel) async {
    var x = RegisterUserResponseModel.fromJson(registerReponseModelMock);
    return x;
  }
}

const String userExistsReponseModelMock = """
  {
    "userExists": false,
    "success": true
  }
""";

const String registerReponseModelMock = """
  {
    "success": true
  }
""";
