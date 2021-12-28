import 'package:dartz/dartz.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/domain/repositories/i_login_repository.dart';
import 'package:my_app/features/login/infra/datasources/i_login_datasource.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource loginDatasource;

  LoginRepository(this.loginDatasource);

  @override
  Future<Either<LoginError, LoginResponseModel>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      var resultDatasource = await loginDatasource.login(loginRequestModel);

      return Right(resultDatasource);
    } on LoginNotFoundError catch (e) {
      return Left(e);
    } on LoginNotAuthorizedError catch (e) {
      return Left(e);
    } on LoginTimeoutError catch (e) {
      return Left(LoginTimeoutError(message: 'Não foi possível realizar o login. Verifique sua internet e tente novamente.'));
    } catch (e) {
      return Left(LoginDatasourceError(message: e.toString()));
    }
  }
}
