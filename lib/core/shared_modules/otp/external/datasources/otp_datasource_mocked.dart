import 'package:my_app/core/shared_modules/otp/infra/datasourcers/i_otp_datasource.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';

class OtpDatasourceMocked implements IOtpDatasource {
  @override
  Future<SendOtpResponseModel> sendOtp(SendOtpRequestModel sendOtpRequestModel) async {
    return SendOtpResponseModel.fromJson(otpReponseModelMock);
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel verifyOtpRequestModel) async {
    return VerifyOtpResponseModel.fromJson(otpReponseModelMock);
  }
}

const String otpReponseModelMock = """
  {
    "success": true
  }
""";
