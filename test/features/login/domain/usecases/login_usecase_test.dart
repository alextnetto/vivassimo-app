import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/features/login/domain/entities/login_entity.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/domain/repositories/i_login_repository.dart';
import 'package:my_app/features/login/domain/usecases/login_usecase.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

class ILoginRepositoryMock extends Mock implements ILoginRepository {}

void main() {
  var repository = ILoginRepositoryMock();
  var usecase = LoginUsecase(repository);

  test('Should return succes when repository return a token', () async {
    LoginRequestModel requestModel = LoginRequestModel(
        phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    var response = LoginResponseModel(token: '123456');

    when(() => repository.login(requestModel))
        .thenAnswer((_) async => Right(LoginResponseModel(token: '123456')));

    final result = await usecase.login(requestModel);

    expect(result, Right(response));
    expect(result.isRight(), true);
  });

  test('Should return LoginNotFoundError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(
        phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => repository.login(requestModel))
        .thenAnswer((_) async => Left(LoginNotFoundError()));

    final result = await usecase.login(requestModel);

    expect(result.fold(id, id), isA<LoginNotFoundError>());
    expect(result.isLeft(), true);
  });

  test('Should return LoginNotAuthorizedError when user doesn\'t exist',
      () async {
    LoginRequestModel requestModel = LoginRequestModel(
        phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => repository.login(requestModel))
        .thenAnswer((_) async => Left(LoginNotAuthorizedError()));

    final result = await usecase.login(requestModel);

    expect(result.fold(id, id), isA<LoginNotAuthorizedError>());
    expect(result.isLeft(), true);
  });

  test('Should return LoginTimeoutError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(
        phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => repository.login(requestModel))
        .thenAnswer((_) async => Left(LoginTimeoutError()));

    final result = await usecase.login(requestModel);

    expect(result.fold(id, id), isA<LoginTimeoutError>());
    expect(result.isLeft(), true);
  });

  test('Should return LoginDatasourceError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(
        phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => repository.login(requestModel))
        .thenAnswer((_) async => Left(LoginDatasourceError()));

    final result = await usecase.login(requestModel);

    expect(result.fold(id, id), isA<LoginDatasourceError>());
    expect(result.isLeft(), true);
  });
}
