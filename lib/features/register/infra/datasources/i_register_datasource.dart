import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';

abstract class IRegisterDatasource {
  Future<CheckExistingUserResponseModel> userExists(
      CheckExistingUserRequestModel existingUserRequestModel);

  sendOtp();
  verifyOtp();
  register();
}
