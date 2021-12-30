import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/datasource_services/remote_datasource_service/request_service/http_service.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/external/datasources/login_datasource.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

class RequestServiceMock extends Mock implements HttpService {}

void main() {
  var requestService = RequestServiceMock();
  var datasource = LoginDatasource(requestService);

  test('Should return status code 200 if endpoint returns a token', () async {
    var loginRequestModel = LoginRequestModel(phoneNumber: '11988888888', password: '123456');

    when(() => requestService.post(endpoint: '/login', body: loginRequestModel.toJson()))
        .thenAnswer((_) async => Response('{"token": "aaaaaa"}', 200));

    var response = await datasource.login(loginRequestModel);

    expect(response, LoginResponseModel(token: 'aaaaaa'));
  });

  test('Should return an error if token is expired', () async {
    var loginRequestModel = LoginRequestModel(phoneNumber: '11988888888', password: '123456');

    when(() => requestService.post(endpoint: '/login', body: loginRequestModel.toJson()))
        .thenAnswer((_) async => Response('aaa', 401));

    var response = datasource.login(loginRequestModel);

    expect(response, throwsA(isA<LoginNotAuthorizedError>()));
  });

  test('Should return if user doesn\'t exist', () async {
    var loginRequestModel = LoginRequestModel(phoneNumber: '11988888888', password: '123456');

    when(() => requestService.post(endpoint: '/login', body: loginRequestModel.toJson()))
        .thenAnswer((_) async => Response('aaa', 404));

    var response = datasource.login(loginRequestModel);

    expect(response, throwsA(isA<LoginNotFoundError>()));
  });

  test('Should return if user doesn\'t exist', () async {
    var loginRequestModel = LoginRequestModel(phoneNumber: '11988888888', password: '123456');

    when(() => requestService.post(endpoint: '/login', body: loginRequestModel.toJson()))
        .thenAnswer((_) async => Response('aaa', 404));

    var response = datasource.login(loginRequestModel);

    expect(response, throwsA(isA<LoginNotFoundError>()));
  });

  test('Should return Datasource error if status code is different than 401, 404', () async {
    var loginRequestModel = LoginRequestModel(phoneNumber: '11988888888', password: '123456');

    when(() => requestService.post(endpoint: '/login', body: loginRequestModel.toJson()))
        .thenAnswer((_) async => Response('aaa', 500));

    var response = datasource.login(loginRequestModel);

    expect(response, throwsA(isA<LoginDatasourceError>()));
  });

  test('Should return timeout exception if endpoint takes too much time to execute', () async {
    var loginRequestModel = LoginRequestModel(phoneNumber: '11988888888', password: '123456');

    when(() => requestService
        .post(endpoint: '/login', body: loginRequestModel.toJson())
        .timeout(Duration(microseconds: 1))).thenThrow(LoginTimeoutError(message: 'Timeout'));

    var response = datasource.login(loginRequestModel);

    expect(response, throwsA(isA<LoginTimeoutError>()));
  });
}
