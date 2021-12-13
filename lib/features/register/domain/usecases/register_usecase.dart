import 'package:dartz/dartz.dart';
import 'package:my_app/features/register/domain/repositories/i_register_repository.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';

abstract class IRegisterUsecase {
  Future<CheckExistingUserResponseModel> userExists(
      CheckExistingUserRequestModel userExistsRequestModel);
  sendOtp();
  verifyOtp();
  register();
}

class RegisterUsecase implements IRegisterUsecase {
  final IRegisterRepository registerRepository;

  RegisterUsecase(this.registerRepository);

  @override
  Future<CheckExistingUserResponseModel> userExists(
      CheckExistingUserRequestModel userExistsRequestModel) async {
    var resultModel =
        await registerRepository.userExists(userExistsRequestModel);

    return resultModel.fold((left) {
      return CheckExistingUserResponseModel(
          success: false, message: left.message);
    }, (right) {
      return CheckExistingUserResponseModel(
          success: true, userExists: right.userExists);
    });
  }

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  sendOtp() {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }

  @override
  verifyOtp() {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
