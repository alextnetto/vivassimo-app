import 'package:my_app/features/register/domain/errors/register_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:my_app/features/register/domain/repositories/i_register_repository.dart';
import 'package:my_app/features/register/infra/datasources/i_register_datasource.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';

class RegisterRepository implements IRegisterRepository {
  final IRegisterDatasource registerDatasource;

  RegisterRepository(this.registerDatasource);

  @override
  Future<Either<RegisterError, CheckExistingUserResponseModel>> userExists(
      CheckExistingUserRequestModel userExistsRequestModel) async {
    try {
      var resultDatasource =
          await registerDatasource.userExists(userExistsRequestModel);

      return Right(resultDatasource);
    } on UserNotExistsError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(RegisterDatasourceError(message: e.toString()));
    }
  }

  @override
  sendOtp() {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }

  @override
  verifyOtp() {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}

class UserExistsResponseModel {}
