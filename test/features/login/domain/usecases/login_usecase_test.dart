import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/shared_modules/cache/domain/usecases/cache_usecase.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/domain/repositories/i_login_repository.dart';
import 'package:my_app/features/login/domain/usecases/login_usecase.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

class ILoginRepositoryMock extends Mock implements ILoginRepository {}

class ICacheUsecaseMock extends Mock implements ICacheUsecase {}

void main() {
  var repository = ILoginRepositoryMock();
  var cache = ICacheUsecaseMock();
  var usecase = LoginUsecase(repository, cache);

  test('Should return success when repository return a token', () async {
    LoginRequestModel requestModel = LoginRequestModel(phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    var response = LoginResponseModel(token: '123456');

    when(() => cache.setCache('user_token', '123456')).thenAnswer((_) async => Right(true));
    when(() => repository.login(requestModel))
        .thenAnswer((_) async => Right(LoginResponseModel(token: '123456', success: true)));

    final result = await usecase.login(requestModel);

    expect(result, response);
    expect(result.success, true);
  });

  test('Should return LoginNotFoundError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => cache.setCache('user_token', '123456')).thenAnswer((_) async => Right(true));
    when(() => repository.login(requestModel)).thenAnswer((_) async => Left(LoginNotFoundError()));

    final result = await usecase.login(requestModel);

    expect(result.success, false);
    // expect(result.isLeft(), true);
  });

  test('Should return LoginNotAuthorizedError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => cache.setCache('user_token', '123456')).thenAnswer((_) async => Right(true));
    when(() => repository.login(requestModel)).thenAnswer((_) async => Left(LoginNotAuthorizedError()));

    final result = await usecase.login(requestModel);

    expect(result.success, false);
    // expect(result.isLeft(), true);
  });

  test('Should return LoginTimeoutError when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => cache.setCache('user_token', '123456')).thenAnswer((_) async => Right(true));
    when(() => repository.login(requestModel)).thenAnswer((_) async => Left(LoginTimeoutError()));

    final result = await usecase.login(requestModel);

    expect(result.success, false);
    // expect(result.isLeft(), true);
    // expect(result.fold(id, id), isA<LoginTimeoutError>());
    // expect(result.isLeft(), true);
  });

  test('Should return error when user doesn\'t exist', () async {
    LoginRequestModel requestModel = LoginRequestModel(phoneNumber: 'fsdfas@fgdsgji.com', password: '123456');

    when(() => cache.setCache('user_token', '123456')).thenAnswer((_) async => Right(true));
    when(() => repository.login(requestModel))
        .thenAnswer((_) async => Left(LoginDatasourceError(message: 'Usuário ou password inválido')));

    final result = await usecase.login(requestModel);

    expect(result.success, false);
    expect(result.message, 'Usuário ou password inválido');
  });
}
