import 'package:mobx/mobx.dart';
part 'payment_method_store.g.dart';

class PaymentMethodStore = _PaymentMethodStoreBase with _$PaymentMethodStore;

abstract class _PaymentMethodStoreBase with Store {
  List<String> creditCards = ['Selecione um cartão', 'Cartão final 6545'];

  @observable
  num purchaseValue = 29.9;

  @action
  setPurchaseValue(num value) => purchaseValue = value;

  @computed
  num get getInstallmentAmount => purchaseValue / installment;

  @observable
  int installment = 1;

  @action
  increaseInstallment() {
    if (installment < 9) return installment++;
  }

  @action
  decreaseInstallment() {
    if (installment > 1) return installment--;
  }

  @observable
  String paymentMethod = 'Selecione um cartão';

  @action
  setPaymentMethod(String value) => paymentMethod = value;

  String formatInstallment() {
    if (installment < 10) {
      return '0 $installment';
    }

    return installment.toString();
  }

  String setInstallmentTextInPlural() {
    if (installment > 1) {
      return '$installment parcelas de';
    } else {
      return '$installment parcela de';
    }
  }
}
