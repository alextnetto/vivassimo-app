import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/constants/constants.dart';
import 'package:my_app/features/login/domain/usecases/login_usecase.dart';
import 'package:my_app/features/login/infra/models/request/login_request_model.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
import 'package:my_app/features/login/infra/models/response/login_response_model.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginUsecase loginUseCase;

  _LoginStoreBase(this.loginUseCase);

  var phoneNumberFormatter = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @observable
  bool isPasswordVisible = true;

  @action
  changePasswordVisibity() {
    return isPasswordVisible = !isPasswordVisible;
  }

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
    } else if (phoneNumber.length < IntConstants.phoneNumberValidLength) {
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

  Future<LoginResponseModel> login() async {
    LoginRequestModel loginRequestModel = LoginRequestModel(
      password: password,
      phoneNumber: phoneNumberFormatter.getUnmaskedText(),
    );

    return await loginUseCase.login(loginRequestModel);

    // return resultUsecase.fold((l) {
    //   if (l is LoginNotFoundError || l is LoginNotAuthorizedError) {
    //     return l.message.isNotEmpty ? l.message : 'Não foi possível realizar o login. Tente novamente mais tarde.';
    //   } else {
    //     print(l.toString());
    //     return 'Não foi possível realizar o login. Tente novamente mais tarde.';
    //   }
    // }, (r) => 'Success');

    // if (resultUsecase.isRight()) {
    //   return 'Success';
    // } else {
    //   resultUsecase.fold((l) {
    //     if(l )
    //   }, (r) => null) ;
    // }
  }
}
