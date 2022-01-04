import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:my_app/features/register/infra/datasources/i_register_datasource.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';
import 'package:my_app/features/register/infra/repositories/register_repository.dart';

class RegisterDatasourceMock extends Mock implements IRegisterDatasource {}

void main() {
  var datasource = RegisterDatasourceMock();
  var repository = RegisterRepository(datasource);
  group('Check User Exists - ', () {
    test('Should return success if datasource returns a CheckExistingUserRequestModel', () async {
      CheckExistingUserRequestModel requestModel = CheckExistingUserRequestModel(phoneNumber: '11988888888');

      when(() => datasource.userExists(requestModel))
          .thenAnswer((_) async => CheckExistingUserResponseModel(success: true, userExists: false));

      var result = await repository.userExists(requestModel);

      expect(result.fold(id, id), CheckExistingUserResponseModel(success: true, userExists: false));
    });

    test('Should return success equals false if user already exists', () async {
      CheckExistingUserRequestModel requestModel = CheckExistingUserRequestModel(phoneNumber: '11988888888');

      when(() => datasource.userExists(requestModel))
          .thenAnswer((_) async => CheckExistingUserResponseModel(success: false, userExists: true));

      var result = await repository.userExists(requestModel);

      expect(result.fold(id, id), CheckExistingUserResponseModel(success: false, userExists: true));
    });

    test('Should return LoginNotFoundError when user doesn\'t exist', () async {
      CheckExistingUserRequestModel requestModel = CheckExistingUserRequestModel(phoneNumber: '11988888888');

      when(() => datasource.userExists(requestModel)).thenThrow(RegisterDatasourceError());

      final result = await repository.userExists(requestModel);

      expect(result.fold(id, id), isA<RegisterDatasourceError>());
      // expect(result.isLeft(), true);
    });
  });


  group('Register User - ', () {
    test('Should return success if user is registered successfully', () async {
      RegisterUserRequestModel requestModel = RegisterUserRequestModel();

      when(() => datasource.register(requestModel)).thenAnswer((_) async => RegisterUserResponseModel(success: true));

      var result = await repository.register(requestModel);

      expect(result.fold(id, id), RegisterUserResponseModel(success: true));
    });

    test('Should return an error is user is not registered', () async {
      RegisterUserRequestModel requestModel = RegisterUserRequestModel();

      when(() => datasource.register(requestModel)).thenThrow(RegisterDatasourceError(message: 'fff'));

      var result = await repository.register(requestModel);

      expect(result.fold(id, id), isA<RegisterDatasourceError>());
    });
  });
}
