import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';

abstract class IRegisterDatasource {
  Future<CheckExistingUserResponseModel> userExists(CheckExistingUserRequestModel existingUserRequestModel);

  Future<RegisterUserResponseModel> register(RegisterUserRequestModel registerUserRequestModel);
}
