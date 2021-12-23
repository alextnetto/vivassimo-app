import 'package:mobx/mobx.dart';
part 'new_credit_card_store.g.dart';

class NewCreditCardStore = _NewCreditCardStoreBase with _$NewCreditCardStore;

abstract class _NewCreditCardStoreBase with Store {
  @observable
  String number = '';

  @observable
  bool hasChangedNumber = false;

  @action
  setNumber(String value) {
    hasChangedNumber = true;
    return number = value;
  }

  @computed
  String? get getNumberError {
    if (!hasChangedNumber) {
      return null;
    } else if (number.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (number.length < 16) {
      return 'Número inválido';
    }

    return null;
  }

  @observable
  String name = '';

  @observable
  bool hasChangedName = false;

  @action
  setName(String value) {
    hasChangedName = true;
    return name = value;
  }

  @computed
  String? get getNameError {
    if (!hasChangedName) {
      return null;
    } else if (name.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (name.length < 5) {
      return 'Nome inválido';
    }

    return null;
  }

  @observable
  String expireDate = '';

  @observable
  bool hasChangedExpireDate = false;

  @action
  setExpireDate(String value) {
    hasChangedExpireDate = true;
    return expireDate = value;
  }

  @computed
  String? get getExpireDateError {
    if (!hasChangedExpireDate) {
      return null;
    } else if (expireDate.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (expireDate.length < 6) {
      return 'Nome inválido';
    }

    return null;
  }

  @computed
  bool get enableButton =>
      getNumberError == null &&
      getNameError == null &&
      getExpireDateError == null &&
      hasChangedNumber &&
      hasChangedName &&
      hasChangedExpireDate;
}
