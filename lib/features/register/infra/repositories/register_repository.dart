import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/register/domain/repositories/i_register_repository.dart';
import 'package:my_app/features/register/infra/datasources/i_register_datasource.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';

class RegisterRepository implements IRegisterRepository {
  final IRegisterDatasource registerDatasource;

  RegisterRepository(this.registerDatasource);

  @override
  Future<Either<RegisterError, CheckExistingUserResponseModel>> userExists(
      CheckExistingUserRequestModel userExistsRequestModel) async {
    try {
      var resultDatasource =
          await registerDatasource.userExists(userExistsRequestModel);

      return Right(resultDatasource);
    } catch (e) {
      return Left(RegisterDatasourceError(message: e.toString()));
    }
  }

  @override
  Future<Either<RegisterError, SendOtpResponseModel>> sendOtp(
      SendOtpRequestModel sendOtpRequestModel) async {
    try {
      var resultDatasource =
          await registerDatasource.sendOtp(sendOtpRequestModel);

      return Right(resultDatasource);
    } catch (e) {
      return Left(RegisterDatasourceError(message: e.toString()));
    }
  }

  @override
  Future<Either<RegisterError, VerifyOtpResponseModel>> verifyOtp(
      VerifyOtpRequestModel verifyOtpRequestModel) async {
    try {
      var resultDatasource =
          await registerDatasource.verifyOtp(verifyOtpRequestModel);

      return Right(resultDatasource);
    } catch (e) {
      return Left(RegisterDatasourceError(message: e.toString()));
    }
  }

  @override
  Future<Either<RegisterError, RegisterUserResponseModel>> register(
      RegisterUserRequestModel registerUserRequestModel) async {
    try {
      var resultDatasource =
          await registerDatasource.register(registerUserRequestModel);

      return Right(resultDatasource);
    } catch (e) {
      return Left(RegisterDatasourceError(message: e.toString()));
    }
  }
}
