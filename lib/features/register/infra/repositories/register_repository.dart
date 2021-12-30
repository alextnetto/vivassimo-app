import 'package:my_app/core/errors/request_timeout.dart';
import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/register/domain/repositories/i_register_repository.dart';
import 'package:my_app/features/register/infra/datasources/i_register_datasource.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';

class RegisterRepository implements IRegisterRepository {
  final IRegisterDatasource registerDatasource;

  RegisterRepository(this.registerDatasource);

  @override
  Future<Either<RegisterError, CheckExistingUserResponseModel>> userExists(
      CheckExistingUserRequestModel userExistsRequestModel) async {
    try {
      var resultDatasource = await registerDatasource.userExists(userExistsRequestModel);

      return Right(resultDatasource);
    } on RegisterDatasourceError catch (e) {
      return Left(RegisterDatasourceError(message: e.message.toString()));
    } on RequestTimeoutError catch (e) {
      return Left(RegisterDatasourceError(message: e.message.toString()));
    } catch (e) {
      return Left(RegisterDatasourceError(message: e.toString()));
    }
  }

  @override
  Future<Either<RegisterError, RegisterUserResponseModel>> register(
      RegisterUserRequestModel registerUserRequestModel) async {
    try {
      var resultDatasource = await registerDatasource.register(registerUserRequestModel);

      return Right(resultDatasource);
    } on RegisterDatasourceError catch (e) {
      return Left(RegisterDatasourceError(message: e.message.toString()));
    } on RequestTimeoutError catch (e) {
      return Left(RegisterDatasourceError(message: e.message.toString()));
    } catch (e) {
      return Left(RegisterDatasourceError(message: e.toString()));
    }
  }
}
