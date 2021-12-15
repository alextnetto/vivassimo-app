import 'package:mobx/mobx.dart';
part 'delete_delivery_address_store.g.dart';

class DeleteDeliveryAddressStore = _DeleteDeliveryAddressStoreBase with _$DeleteDeliveryAddressStore;

abstract class _DeleteDeliveryAddressStoreBase with Store {
  @observable
  int deliveryAddressId = 1;

  @action
  setDeliveryAddressId(int value) {
    if (value != deliveryAddressId) return deliveryAddressId = value;
  }
}
