import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/shared_modules/otp/domain/errors/otp_error.dart';
import 'package:my_app/core/shared_modules/otp/infra/datasourcers/i_otp_datasource.dart';
import 'package:my_app/core/shared_modules/otp/infra/repositories/otp_repository.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';

class OtpDatasourceMock extends Mock implements IOtpDatasource {}

void main() {
  var datasource = OtpDatasourceMock();
  var repository = OtpRepository(datasource);

  group('Send OTP - ', () {
    test('Should return success if otp code is sent to user', () async {
      SendOtpRequestModel requestModel = SendOtpRequestModel(phoneNumber: '11988888888');

      when(() => datasource.sendOtp(requestModel)).thenAnswer((_) async => SendOtpResponseModel(success: true));

      var result = await repository.sendOtp(requestModel);

      expect(result.fold(id, id), SendOtpResponseModel(success: true));
    });

    test('Should return success if user doesn\'t receive the otp code', () async {
      SendOtpRequestModel requestModel = SendOtpRequestModel(phoneNumber: '11988888888');

      when(() => datasource.sendOtp(requestModel)).thenThrow(OtpError(message: 'fff'));

      var result = await repository.sendOtp(requestModel);

      expect(result.fold(id, id), isA<OtpError>());
    });
  });

  group('Validate OTP - ', () {
    test('Should return success if otp code is validated', () async {
      VerifyOtpRequestModel requestModel = VerifyOtpRequestModel(phoneNumber: '11988888888', token: '777777');

      when(() => datasource.verifyOtp(requestModel)).thenAnswer((_) async => VerifyOtpResponseModel(success: true));

      var result = await repository.verifyOtp(requestModel);

      expect(result.fold(id, id), VerifyOtpResponseModel(success: true));
    });

    test('Should return success otp code is wrong', () async {
      VerifyOtpRequestModel requestModel = VerifyOtpRequestModel(phoneNumber: '11988888888', token: '666666');

      when(() => datasource.verifyOtp(requestModel)).thenThrow(OtpError(message: 'fff'));

      var result = await repository.verifyOtp(requestModel);

      expect(result.fold(id, id), isA<OtpError>());
    });
  });
}
