import 'package:dartz/dartz.dart';
import 'package:my_app/features/login/domain/entities/login_entity.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/domain/repositories/i_login_repository.dart';
import 'package:my_app/features/login/infra/datasources/i_login_datasource.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource loginDatasource;

  LoginRepository(this.loginDatasource);
  @override
  Future<Either<LoginError, LoginEntity>> login(LoginRequestModel loginRequestModel) async {
    try {
      var resultDatasource = await loginDatasource.login(loginRequestModel);

      return Right(resultDatasource);
    } on LoginNotFoundError catch (e) {
      return Left(e);
    } on LoginNotAuthorizedError catch (e) {
      return Left(e);
    } on LoginRTimeoutError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(LoginDatasourceError());
    }
  }
}
