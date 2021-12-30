import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/datasource_services/remote_datasource_service/request_service/http_service.dart';
import 'package:my_app/core/shared_modules/otp/domain/errors/otp_error.dart';
import 'package:my_app/core/shared_modules/otp/external/datasources/otp_datasource.dart';
import 'package:my_app/features/register/infra/models/request/send_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/request/verify_otp_request_model.dart';
import 'package:my_app/features/register/infra/models/response/send_otp_response_model.dart';
import 'package:my_app/features/register/infra/models/response/verify_otp_response_model.dart';

class RequestServiceMock extends Mock implements HttpService {}

void main() {
  var requestService = RequestServiceMock();
  var datasource = OtpDatasource(requestService);
  group('Send OTP - ', () {
    test('Should return status code 200 if OTP code was sent to the user', () async {
      var loginRequestModel = SendOtpRequestModel(phoneNumber: '11999999999');

      when(() => requestService.post(endpoint: '/sendOtp', body: loginRequestModel.toJson()))
          .thenAnswer((_) async => Response('{"success": true}', 200));

      var response = await datasource.sendOtp(loginRequestModel);

      expect(response, SendOtpResponseModel(success: true));
    });

    test('Should return an error if user doesn\'t receive the OTP code', () async {
      var loginRequestModel = SendOtpRequestModel(phoneNumber: '11999999999');

      when(() => requestService.post(endpoint: '/sendOtp', body: loginRequestModel.toJson()))
          .thenAnswer((_) async => Response('{"message": "aaa"}', 401));

      var response = datasource.sendOtp(loginRequestModel);

      expect(response, throwsA(isA<OtpError>()));
    });
  });

  group('Validate OTP - ', () {
    var loginRequestModel = VerifyOtpRequestModel(token: '777777', phoneNumber: '11999999999');
    test('Should return status code 200 if OTP is validated successfully', () async {
      when(() => requestService.get(endpoint: '/verifyOtp', queryParams: loginRequestModel.toMap()))
          .thenAnswer((_) async => Response('{"success": true}', 200));

      var response = await datasource.verifyOtp(loginRequestModel);

      expect(response, VerifyOtpResponseModel(success: true));
    });

    test('Should return an error if sent OTP is wrong', () async {
      when(() => requestService.get(endpoint: '/verifyOtp', queryParams: loginRequestModel.toMap()))
          .thenAnswer((_) async => Response('{"message": "aaa"}', 401));

      var response = datasource.verifyOtp(loginRequestModel);

      expect(response, throwsA(isA<OtpError>()));
    });
  });
}
