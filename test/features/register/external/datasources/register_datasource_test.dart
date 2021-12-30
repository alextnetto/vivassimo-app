import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/datasource_services/remote_datasource_service/request_service/http_service.dart';
import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:my_app/features/register/external/datasources/register_datasource.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';

class RequestServiceMock extends Mock implements HttpService {}

void main() {
  var requestService = RequestServiceMock();
  var datasource = RegisterDatasource(requestService);

  group('Check User Exists - ', () {
    test('Should return status code 200 if user already exists', () async {
      var loginRequestModel = CheckExistingUserRequestModel(phoneNumber: '11999999999');

      when(() => requestService.get(endpoint: '/userExists', queryParams: loginRequestModel.toMap()))
          .thenAnswer((_) async => Response('{"userExists": true}', 200));

      var response = await datasource.userExists(loginRequestModel);

      expect(response, CheckExistingUserResponseModel(userExists: true));
    });

    test('Should return status code 200 if user doesn\'t exist', () async {
      var loginRequestModel = CheckExistingUserRequestModel(phoneNumber: '11999999999');

      when(() => requestService.get(endpoint: '/userExists', queryParams: loginRequestModel.toMap()))
          .thenAnswer((_) async => Response('{"userExists": false}', 200));

      var response = await datasource.userExists(loginRequestModel);

      expect(response, CheckExistingUserResponseModel(userExists: false));
    });

    test('Should return an error if status code is different than 200', () async {
      var loginRequestModel = CheckExistingUserRequestModel(phoneNumber: '11999999999');

      when(() => requestService.get(endpoint: '/userExists', queryParams: loginRequestModel.toMap()))
          .thenAnswer((_) async => Response('{"message": "aaa"}', 401));

      var response = datasource.userExists(loginRequestModel);

      expect(response, throwsA(isA<RegisterDatasourceError>()));
    });
  });


  group('Register User - ', () {
    test('Should return status code 201 if backend register the user', () async {
      var loginRequestModel = RegisterUserRequestModel();

      when(() => requestService.post(endpoint: '/users', body: loginRequestModel.toJson()))
          .thenAnswer((_) async => Response('{"success": true}', 201));

      var response = await datasource.register(loginRequestModel);

      expect(response, RegisterUserResponseModel(success: true));
    });

    test('Should throw an error if status code is different than 201', () async {
      var loginRequestModel = RegisterUserRequestModel();

      when(() => requestService.post(endpoint: '/users', body: loginRequestModel.toJson()))
          .thenAnswer((_) async => Response('{"message": "aaa"}', 401));

      var response = datasource.register(loginRequestModel);

      expect(response, throwsA(isA<RegisterDatasourceError>()));
    });
  });
}
