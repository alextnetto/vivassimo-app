import 'package:mobx/mobx.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/domain/usecases/login_usecase.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginUsecase loginUseCase;

  _LoginStoreBase(this.loginUseCase);

  Future<String> login(String phoneNumber, String password) async {
    LoginRequestModel loginRequestModel =
        LoginRequestModel(password: password, phoneNumber: phoneNumber);

    var resultUsecase = await loginUseCase.login(loginRequestModel);

    return resultUsecase.fold((l) {
      if (l is LoginNotFoundError || l is LoginNotAuthorizedError) {
        return l.message.isNotEmpty
            ? l.message
            : 'Não foi possível realizar o login. Tente novamente mais tarde.';
      } else {
        print(l.toString());
        return 'Não foi possível realizar o login. Tente novamente mais tarde.';
      }
    }, (r) => 'Success');

    // if (resultUsecase.isRight()) {
    //   return 'Success';
    // } else {
    //   resultUsecase.fold((l) {
    //     if(l )
    //   }, (r) => null) ;
    // }
  }
}
