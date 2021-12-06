import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/constants/constants.dart';
import 'package:my_app/features/login/domain/errors/login_errors.dart';
import 'package:my_app/features/login/domain/usecases/login_usecase.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginUsecase loginUseCase;

  _LoginStoreBase(this.loginUseCase);

  @observable
  String phoneNumber = "";

  @observable
  bool hasChangedPhoneNumber = false;

  @action
  setPhoneNumber(String value) {
    hasChangedPhoneNumber = true;
    return phoneNumber = value;
  }

  @observable
  String password = "";

  @observable
  bool hasChangedPassword = false;

  @action
  setPassword(String value) {
    hasChangedPassword = true;
    return password = value;
  }

  @computed
  String? get getPhoneNumberError {
    if (!hasChangedPhoneNumber) {
      return null;
    } else if (phoneNumber.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (phoneNumber.length < Constants.phoneNumberValidLength) {
      return 'Telefone inválido';
    }

    return null;
  }

  @computed
  String? get getPasswordError {
    if (!hasChangedPassword) {
      return null;
    } else if (password.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (!password.isStrongPassword) {
      return 'Senha inválida';
    }

    return null;
  }

  @computed
  bool get enableButton {
    return getPhoneNumberError == null &&
        getPasswordError == null &&
        hasChangedPhoneNumber &&
        hasChangedPassword;
  }

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
