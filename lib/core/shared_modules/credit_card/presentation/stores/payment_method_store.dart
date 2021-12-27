import 'package:mobx/mobx.dart';
import 'package:my_app/core/entities/credit_card_entity.dart';
import 'package:my_app/core/utils/enums/credit_card_enum.dart';
part 'payment_method_store.g.dart';

class PaymentMethodStore = _PaymentMethodStoreBase with _$PaymentMethodStore;

abstract class _PaymentMethodStoreBase with Store {
  _PaymentMethodStoreBase() {
    creditCardEntities.add(CreditCardEntity(id: 0, number: 'Selecione um cartão'));
    creditCardEntities.add(CreditCardEntity(
      id: 1,
      imagePath: 'assets/icon/mastercard.png',
      number: '1234',
      brand: CardBrand.mastercard,
      brandName: 'Mastercard',
    ));

    creditCardEntities.add(CreditCardEntity(
      id: 2,
      imagePath: 'assets/icon/mastercard.png',
      number: '5678',
      brand: CardBrand.mastercard,
      brandName: 'Mastercard',
    ));
  }

  int maxInstallments = 0;

  ObservableList<CreditCardEntity> creditCardEntities = ObservableList<CreditCardEntity>();

  @action
  addCreditCard(CreditCardEntity creditCard) {
    creditCardEntities.add(creditCard);
  }

  @action
  removeCreditCard(CreditCardEntity creditCard) {
    creditCardEntities.remove(creditCard);
  }

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
    if (installment < maxInstallments) return installment++;
  }

  @action
  decreaseInstallment() {
    if (installment > 1) return installment--;
  }

  @observable
  // CreditCardEntity paymentMethod = CreditCardEntity(id: 0, number: 'Selecione um cartão');
  CreditCardEntity paymentMethod = CreditCardEntity(id: 0, number: 'Selecione um cartão');

  @action
  setPaymentMethod(CreditCardEntity value) {
    return paymentMethod = value;
  }

  @computed
  bool get enableButton => paymentMethod.number != 'Selecione um cartão';

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
