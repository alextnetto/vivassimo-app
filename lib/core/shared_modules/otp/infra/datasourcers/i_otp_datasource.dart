import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';

abstract class IOtpDatasource {
  Future<SendOtpResponseModel> sendOtp(SendOtpRequestModel sendOtpRequestModel);

  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel verifyOtpRequestModel);
}
