import 'package:mobx/mobx.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
part 'password_store.g.dart';

class PasswordStore = _PasswordStoreBase with _$PasswordStore;

abstract class _PasswordStoreBase with Store {
  final IRegisterUsecase registerUsecase;

  _PasswordStoreBase(this.registerUsecase);

  @observable
  bool isPasswordVisible = true;

  @action
  changePasswordVisibity() {
    return isPasswordVisible = !isPasswordVisible;
  }

  @observable
  String password = '';

  @observable
  bool hasChangedPassword = false;

  @observable
  String passwordConfirmation = '';

  @observable
  bool hasChangedPasswordConfirmation = false;

  @action
  setPassword(String value) {
    hasChangedPassword = true;
    return password = value;
  }

  @action
  setPasswordConfirmation(String value) {
    hasChangedPasswordConfirmation = true;
    return passwordConfirmation = value;
  }

  @computed
  bool get enableButton {
    return getPasswordError == null &&
        getPasswordConfirmationError == null &&
        hasChangedPassword &&
        hasChangedPasswordConfirmation;
  }

  @computed
  String? get getPasswordError {
    if (!hasChangedPassword) {
      return null;
    } else if (password.isEmpty) {
      return 'Esse campo é obrigatório';
    }

    return null;
  }

  @computed
  String? get getPasswordConfirmationError {
    if (!hasChangedPasswordConfirmation) {
      return null;
    } else if (passwordConfirmation.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (passwordConfirmation != password) {
      return 'As senhas não conferem';
    }

    return null;
  }
}
