import 'package:dartz/dartz.dart';
import 'package:my_app/core/errors/request_timeout.dart';
import 'package:my_app/core/shared_modules/otp/domain/errors/otp_error.dart';
import 'package:my_app/core/shared_modules/otp/domain/repositories/i_otp_repository.dart';
import 'package:my_app/core/shared_modules/otp/infra/datasourcers/i_otp_datasource.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';

class OtpRepository implements IOtpRepository {
  IOtpDatasource otpDatasource;
  OtpRepository(this.otpDatasource);

  @override
  Future<Either<IOtpError, SendOtpResponseModel>> sendOtp(SendOtpRequestModel sendOtpRequestModel) async {
    try {
      var resultDatasource = await otpDatasource.sendOtp(sendOtpRequestModel);

      return Right(resultDatasource);
    } on RequestTimeoutError {
      return Left(
          OtpError(message: 'Não foi possível enviar o código. Verifique a conexão com a internet e tente novamente'));
    } catch (e) {
      return Left(OtpError(message: e.toString()));
    }
  }

  @override
  Future<Either<IOtpError, VerifyOtpResponseModel>> verifyOtp(VerifyOtpRequestModel verifyOtpRequestModel) async {
    try {
      var resultDatasource = await otpDatasource.verifyOtp(verifyOtpRequestModel);

      return Right(resultDatasource);
    } on RequestTimeoutError {
      return Left(
          OtpError(message: 'Não foi possível validar o código. Verifique a conexão com a internet e tente novamente'));
    } catch (e) {
      return Left(OtpError(message: e.toString()));
    }
  }
}
