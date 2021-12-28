import 'package:mobx/mobx.dart';
part 'new_credit_card_cvv_store.g.dart';

class NewCreditCardCvvStore = _NewCreditCardCvvStoreBase with _$NewCreditCardCvvStore;

abstract class _NewCreditCardCvvStoreBase with Store {
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
    } else if (number.length < 3) {
      return 'CVV inválido';
    }

    return null;
  }

  @computed
  bool get enableButton => getNumberError == null && hasChangedNumber;
}
