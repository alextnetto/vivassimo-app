import 'package:dartz/dartz.dart';
import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';

abstract class IRegisterRepository {
  Future<Either<RegisterError, CheckExistingUserResponseModel>> userExists(
      CheckExistingUserRequestModel userExistsRequestModel);

  Future<Either<RegisterError, SendOtpResponseModel>> sendOtp(
      SendOtpRequestModel sendOtpRequestModel);

  verifyOtp();

  register();
}
