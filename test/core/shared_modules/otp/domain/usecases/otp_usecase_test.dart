import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/shared_modules/otp/domain/errors/otp_error.dart';
import 'package:my_app/core/shared_modules/otp/domain/repositories/i_otp_repository.dart';
import 'package:my_app/core/shared_modules/otp/domain/usecases/otp_usecase.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';

class OtpRepositoryMock extends Mock implements IOtpRepository {}

void main() {
  var repository = OtpRepositoryMock();
  var usecase = OtpUsecase(repository);

  group('Send OTP -', () {
    test('Should return success equals true when backend sends opt succesfully', () async {
      SendOtpRequestModel requestModel = SendOtpRequestModel(phoneNumber: '11999999999');

      var response = SendOtpResponseModel(success: true);

      when(() => repository.sendOtp(requestModel)).thenAnswer((_) async => Right(SendOtpResponseModel(success: true)));

      final result = await usecase.sendOtp(requestModel);

      expect(result, response);
      expect(result.success, true);
    });

    test('Should return success equals false when backend can\'t send otp', () async {
      SendOtpRequestModel requestModel = SendOtpRequestModel(phoneNumber: '11999999999');

      var response = SendOtpResponseModel(success: false, message: 'fff');

      when(() => repository.sendOtp(requestModel)).thenAnswer((_) async => Left(OtpError(message: 'fff')));

      final result = await usecase.sendOtp(requestModel);

      expect(result, response);
      expect(result.success, false);
      expect(result.message.isNotEmpty, true);
    });
  });

  group('Verify OTP -', () {
    test('Should return success equals true when backend validate opt succesfully', () async {
      VerifyOtpRequestModel requestModel = VerifyOtpRequestModel(token: '555666', phoneNumber: '11999999999');

      var response = VerifyOtpResponseModel(success: true);

      when(() => repository.verifyOtp(requestModel))
          .thenAnswer((_) async => Right(VerifyOtpResponseModel(success: true)));

      final result = await usecase.verifyOtp(requestModel);

      expect(result, response);
      expect(result.success, true);
    });

    test('Should return success equals false when backend can\'t validate otp', () async {
      VerifyOtpRequestModel requestModel = VerifyOtpRequestModel(token: '555666', phoneNumber: '11999999999');

      var response = VerifyOtpResponseModel(success: false, message: 'fff');

      when(() => repository.verifyOtp(requestModel)).thenAnswer((_) async => Left(OtpError(message: 'fff')));

      final result = await usecase.verifyOtp(requestModel);

      expect(result, response);
      expect(result.success, false);
      expect(result.message.isNotEmpty, true);
    });
  });
}
