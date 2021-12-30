import 'package:dartz/dartz.dart';
import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';

abstract class IRegisterRepository {
  Future<Either<RegisterError, CheckExistingUserResponseModel>> userExists(
      CheckExistingUserRequestModel userExistsRequestModel);

  Future<Either<RegisterError, RegisterUserResponseModel>> register(
      RegisterUserRequestModel registerUserRequestModel);
}
