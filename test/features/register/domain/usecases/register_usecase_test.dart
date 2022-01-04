import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:my_app/features/register/domain/repositories/i_register_repository.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';

class IRegisterRepositoryMock extends Mock implements IRegisterRepository {}

void main() {
  var repository = IRegisterRepositoryMock();
  var usecase = RegisterUsecase(repository);

  group('Check User Exists - ', () {
    test('Should return false when user doesn\'t exist in database', () async {
      CheckExistingUserRequestModel requestModel = CheckExistingUserRequestModel(phoneNumber: '11999999999');

      var response = CheckExistingUserResponseModel(success: true, userExists: false);

      when(() => repository.userExists(requestModel))
          .thenAnswer((_) async => Right(CheckExistingUserResponseModel(success: true, userExists: false)));

      final result = await usecase.userExists(requestModel);

      expect(result, response);
      expect(result.success, true);
      expect(result.userExists, false);
    });

    test('Should return true when user exists in database', () async {
      CheckExistingUserRequestModel requestModel = CheckExistingUserRequestModel(phoneNumber: '11999999999');

      var response = CheckExistingUserResponseModel(success: true, userExists: true);

      when(() => repository.userExists(requestModel)).thenAnswer((_) async => Right(response));

      final result = await usecase.userExists(requestModel);

      expect(result, response);
      expect(result.success, true);
      expect(result.userExists, true);
    });

    test('Should return success equals false and some message when some exception occurs', () async {
      CheckExistingUserRequestModel requestModel = CheckExistingUserRequestModel(phoneNumber: '11999999999');

      var response = CheckExistingUserResponseModel(success: false, message: 'fsdhu');

      when(() => repository.userExists(requestModel))
          .thenAnswer((_) async => Left(RegisterDatasourceError(message: 'fsdhu')));

      final result = await usecase.userExists(requestModel);

      expect(result, response);
      expect(result.success, false);
      expect(result.message.isNotEmpty, true);
    });
  });

  group('User Registration -', () {
    test('Should return success equals true when user is registered', () async {
      RegisterUserRequestModel requestModel = RegisterUserRequestModel();

      var response = RegisterUserResponseModel(success: true);

      when(() => repository.register(requestModel))
          .thenAnswer((_) async => Right(RegisterUserResponseModel(success: true)));

      final result = await usecase.register(requestModel);

      expect(result, response);
      expect(result.success, true);
    });

    test('Should return success equals false when backend can\'t registrate user', () async {
      RegisterUserRequestModel requestModel = RegisterUserRequestModel();

      var response = RegisterUserResponseModel(success: false, message: 'fff');

      when(() => repository.register(requestModel))
          .thenAnswer((_) async => Left(RegisterDatasourceError(message: 'fff')));

      final result = await usecase.register(requestModel);

      expect(result, response);
      expect(result.success, false);
    });
  });
}
