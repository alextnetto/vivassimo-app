import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/infra/datasources/i_login_datasource.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';
import 'package:my_app/features/login/infra/repositories/login_repository.dart';

class LoginDatasourceMock extends Mock implements ILoginDatasource {}

void main() {
  var datasource = LoginDatasourceMock();
  var repository = LoginRepository(datasource);

  test('Should return success if datasource returns a LoginResponseModel', () async {
    var requestModel = LoginRequestModel(phoneNumber: '11988888888', password: '123456');

    when(() => datasource.login(requestModel))
        .thenAnswer((_) async => LoginResponseModel(success: true, token: 'aaaaaa'));

    var result = await repository.login(requestModel);

    expect(result.fold(id, id), LoginResponseModel(token: 'aaaaaa', success: true));
  });

  test('Should return LoginNotFoundError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => datasource.login(requestModel)).thenThrow(LoginNotFoundError());

    final result = await repository.login(requestModel);

    expect(result.fold(id, id), isA<LoginNotFoundError>());
    // expect(result.isLeft(), true);
  });

  test('Should return LoginNotAuthorizedError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => datasource.login(requestModel)).thenThrow(LoginNotAuthorizedError());

    final result = await repository.login(requestModel);

    expect(result.fold(id, id), isA<LoginNotAuthorizedError>());
    expect(result.isLeft(), true);
  });

  test('Should return LoginTimeoutError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => datasource.login(requestModel)).thenThrow(LoginTimeoutError());

    final result = await repository.login(requestModel);

    expect(result.fold(id, id), isA<LoginTimeoutError>());
    expect(result.isLeft(), true);
  });

  test('Should return LoginDatasourceError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => datasource.login(requestModel)).thenThrow(LoginDatasourceError());

    final result = await repository.login(requestModel);

    expect(result.fold(id, id), isA<LoginDatasourceError>());
    expect(result.isLeft(), true);
  });
}
