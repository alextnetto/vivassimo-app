import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';

abstract class IRegisterDatasource {
  Future<CheckExistingUserResponseModel> userExists(
      CheckExistingUserRequestModel existingUserRequestModel);

  Future<SendOtpResponseModel> sendOtp(SendOtpRequestModel sendOtpRequestModel);

  Future<VerifyOtpResponseModel> verifyOtp(
      VerifyOtpRequestModel verifyOtpRequestModel);

  Future<RegisterUserResponseModel> register(
      RegisterUserRequestModel registerUserRequestModel);
}
