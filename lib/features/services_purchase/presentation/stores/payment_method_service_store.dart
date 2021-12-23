import 'package:mobx/mobx.dart';
import 'package:my_app/core/entities/credit_card_entity.dart';
import 'package:my_app/features/products_purchase/domain/entities/payment_method_entity.dart';
part 'payment_method_service_store.g.dart';

class PaymentMethodServiceStore = _PaymentMethodServiceStoreBase with _$PaymentMethodServiceStore;

abstract class _PaymentMethodServiceStoreBase with Store {
  _PaymentMethodServiceStoreBase() {
    creditCardEntities.add(CreditCardEntity(id: 0, number: 'Selecione um cartão'));
    creditCardEntities.add(CreditCardEntity(id: 1, imagePath: 'assets/icon/mastercard.png', number: '1234'));
    creditCardEntities.add(CreditCardEntity(id: 2, imagePath: 'assets/icon/mastercard.png', number: '5678'));
  }

  int maxInstallments = 0;

  @observable
  PaymentMethodEntity? creditCardSelected;

  ObservableList<CreditCardEntity> creditCardEntities = ObservableList<CreditCardEntity>();

  @action
  addCreditCard(CreditCardEntity creditCard) {
    creditCards
        .add('Cartão final ${creditCard.number!.substring(creditCard.number!.length - 4, creditCard.number!.length)}');
    creditCardEntities.add(creditCard);
  }

  @action
  removeCreditCard(CreditCardEntity creditCard) {
    var index = creditCardEntities.indexOf(creditCard);

    creditCards.removeAt(index);
    creditCardEntities.remove(creditCard);
  }

  List<String> creditCards = ['Selecione um cartão', 'Cartão final 1234', 'Cartão final 5678'];

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
