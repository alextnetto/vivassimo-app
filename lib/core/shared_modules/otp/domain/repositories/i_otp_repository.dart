import 'package:dartz/dartz.dart';
import 'package:my_app/core/shared_modules/otp/domain/errors/otp_error.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';

abstract class IOtpRepository {
  Future<Either<IOtpError, SendOtpResponseModel>> sendOtp(SendOtpRequestModel sendOtpRequestModel);

  Future<Either<IOtpError, VerifyOtpResponseModel>> verifyOtp(VerifyOtpRequestModel verifyOtpRequestModel);
}
