import 'package:mobx/mobx.dart';
import 'package:my_app/core/shared_modules/otp/domain/usecases/otp_usecase.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';
part '../../../../../features/register/presentation/stores/otp_store.g.dart';

class OtpStore = _OtpStoreBase with _$OtpStore;

abstract class _OtpStoreBase with Store {
  final IOtpUsecase otpUsecase;

  _OtpStoreBase(this.otpUsecase);

  @observable
  String? phoneNumber = '';

  @observable
  String? otp = '';

  @action
  setPhoneNumber(String value) {
    return phoneNumber = value;
  }

  @action
  setOtp(String value) {
    print(value);
    return otp = value;
  }

  @computed
  bool get isValidOtp => otp?.length == 6;

  Future<SendOtpResponseModel> sendOtp() async {
    SendOtpRequestModel sendOtpRequestModel = SendOtpRequestModel(
      phoneNumber: phoneNumber!,
    );

    return await otpUsecase.sendOtp(sendOtpRequestModel);
  }

  Future<VerifyOtpResponseModel> verifyOtp() async {
    VerifyOtpRequestModel verifyOtpRequestModel = VerifyOtpRequestModel(
      phoneNumber: phoneNumber!,
      token: otp!,
    );

    return await otpUsecase.verifyOtp(verifyOtpRequestModel);
  }
}
