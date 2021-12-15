import 'package:my_app/core/contracts/i_request_service.dart';
import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:my_app/features/register/infra/datasources/i_register_datasource.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';

class RegisterDatasource implements IRegisterDatasource {
  final IRequestService httpClient;

  RegisterDatasource(this.httpClient);

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<CheckExistingUserResponseModel> userExists(
      CheckExistingUserRequestModel existingUserRequestModel) async {
    var response = await httpClient.getData(
        endpoint: '/userExists', queryParams: existingUserRequestModel.toMap());

    if (response.statusCode == 200) {
      var resultModel = CheckExistingUserResponseModel.fromJson(response.body);
      return resultModel;
    } else {
      throw RegisterDatasourceError(message: response.body);
    }
  }

  @override
  verifyOtp() {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  @override
  Future<SendOtpResponseModel> sendOtp(
      SendOtpRequestModel sendOtpRequestModel) async {
    var response = await httpClient.post(
        endpoint: '/sendOtp', body: sendOtpRequestModel.toJson());

    if (response.statusCode == 200) {
      var resultModel = SendOtpResponseModel.fromJson(response.body);
      return resultModel;
    } else {
      throw RegisterDatasourceError(message: response.body);
    }
  }
}
