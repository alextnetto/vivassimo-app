import 'dart:convert';

import 'package:my_app/core/contracts/i_request_service.dart';
import 'package:my_app/core/shared_modules/otp/domain/errors/otp_error.dart';
import 'package:my_app/core/shared_modules/otp/infra/datasourcers/i_otp_datasource.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';

class OtpDatasouce implements IOtpDatasource {
  final IRequestService httpClient;

  OtpDatasouce(this.httpClient);
  @override
  Future<SendOtpResponseModel> sendOtp(SendOtpRequestModel sendOtpRequestModel) async {
    var response = await httpClient.post(endpoint: '/sendOtp', body: sendOtpRequestModel.toJson());

    if (response.statusCode == 200) {
      var resultModel = SendOtpResponseModel.fromJson(response.body);
      return resultModel;
    } else {
      var message = json.decode(response.body)['message'];

      throw OtpError(message: message);
    }
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel verifyOtpRequestModel) async {
    var response = await httpClient.get(endpoint: '/verifyOtp', queryParams: verifyOtpRequestModel.toMap());

    if (response.statusCode == 200) {
      var resultModel = VerifyOtpResponseModel.fromJson(response.body);
      return resultModel;
    } else {
      var message = json.decode(response.body)['message'];

      throw OtpError(message: message);
    }
  }
}
