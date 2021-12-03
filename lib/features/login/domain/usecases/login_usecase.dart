import 'package:dartz/dartz.dart';
import 'package:my_app/features/login/domain/entities/login_entity.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/domain/repositories/i_login_repository.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

abstract class ILoginUsecase {
  Future<Either<LoginError, LoginEntity>> login(
      LoginRequestModel loginRequestModel);
}

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository loginRepository;

  LoginUsecase(this.loginRepository);
  @override
  Future<Either<LoginError, LoginEntity>> login(
      LoginRequestModel loginRequestModel) async {
    return loginRepository.login(loginRequestModel);
  }
}
