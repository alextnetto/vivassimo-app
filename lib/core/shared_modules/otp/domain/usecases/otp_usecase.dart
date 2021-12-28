import 'package:my_app/core/shared_modules/otp/domain/repositories/i_otp_repository.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';

abstract class IOtpUsecase {
  Future<SendOtpResponseModel> sendOtp(SendOtpRequestModel sendOtpRequestModel);

  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel verifyOtpRequestModel);
}

class OtpUsecase implements IOtpUsecase {
  IOtpRepository otpRepository;

  OtpUsecase(this.otpRepository);

  @override
  Future<SendOtpResponseModel> sendOtp(SendOtpRequestModel sendOtpRequestModel) async {
    var resultModel = await otpRepository.sendOtp(sendOtpRequestModel);

    return resultModel.fold((left) {
      return SendOtpResponseModel(success: false, message: left.message);
    }, (right) {
      return SendOtpResponseModel(success: true, message: right.message);
    });
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel verifyOtpRequestModel) async {
    var resultModel = await otpRepository.verifyOtp(verifyOtpRequestModel);

    return resultModel.fold((left) {
      return VerifyOtpResponseModel(success: false, message: left.message);
    }, (right) {
      return VerifyOtpResponseModel(success: true, message: right.message);
    });
  }
}
