import 'package:mobx/mobx.dart';
import 'package:my_app/features/products_purchase/domain/entities/payment_method_entity.dart';
part 'payment_method_store.g.dart';

class PaymentMethodStore = _PaymentMethodStoreBase with _$PaymentMethodStore;

abstract class _PaymentMethodStoreBase with Store {
  _PaymentMethodStoreBase() {
    creditCardEntities.add(PaymentMethodEntity(id: 0, name: 'Selecione um cartão'));
    creditCardEntities.add(PaymentMethodEntity(id: 1, image: 'assets/icon/mastercard.png', name: '1234'));
    creditCardEntities.add(PaymentMethodEntity(id: 2, image: 'assets/icon/mastercard.png', name: '5678'));
  }

  @observable
  PaymentMethodEntity? creditCardSelected;

  ObservableList<PaymentMethodEntity> creditCardEntities = ObservableList<PaymentMethodEntity>();

  List<String> creditCards = ['Selecione um cartão', 'Cartão final 6545'];

  @observable
  num purchaseValue = 0.0;

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
  // CreditCardEntity paymentMethod = CreditCardEntity(name: 'Selecione um cartão', id: 0);

  @action
  setPaymentMethod(String value) {
    return paymentMethod = value;
  }

  @computed
  bool get enableButton => paymentMethod != 'Selecione um cartão';

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
