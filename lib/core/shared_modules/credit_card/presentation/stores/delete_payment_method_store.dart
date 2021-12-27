import 'package:mobx/mobx.dart';
part 'delete_payment_method_store.g.dart';

class DeletePaymentMethodStore = _DeletePaymentMethodStoreBase with _$DeletePaymentMethodStore;

abstract class _DeletePaymentMethodStoreBase with Store {
  @observable
  int paymentMethodId = 1;

  @action
  setPaymentMethodId(int value) {
    if (value != paymentMethodId) return paymentMethodId = value;
  }
}
