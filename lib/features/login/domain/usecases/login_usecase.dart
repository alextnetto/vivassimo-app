import 'package:my_app/core/shared_modules/cache/domain/usecases/cache_usecase.dart';
import 'package:my_app/features/login/domain/repositories/i_login_repository.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';

abstract class ILoginUsecase {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel);
}

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository loginRepository;
  final ICacheUsecase cacheUsecase;

  LoginUsecase(this.loginRepository, this.cacheUsecase);

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    var resultModel = await loginRepository.login(loginRequestModel);

    return resultModel.fold((left) {
      // if (l is LoginTimeoutError || l is LoginTimeoutError) {
      return LoginResponseModel(success: false, message: left.message);
    }, (right) {
      cacheUsecase.setCache("user_token", right.token);

      return LoginResponseModel(token: right.token, success: true);
    });
  }
}
