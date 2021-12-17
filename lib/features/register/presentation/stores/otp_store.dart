import 'package:mobx/mobx.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
part 'otp_store.g.dart';

class OtpStore = _OtpStoreBase with _$OtpStore;

abstract class _OtpStoreBase with Store {
  final IRegisterUsecase registerUsecase;

  _OtpStoreBase(this.registerUsecase);

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
    return otp = value;
  }

  Future<SendOtpResponseModel> sendOtp() async {
    SendOtpRequestModel sendOtpRequestModel = SendOtpRequestModel(
      phoneNumber: phoneNumber!,
    );

    return await registerUsecase.sendOtp(sendOtpRequestModel);
  }
}
