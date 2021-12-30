import 'package:mobx/mobx.dart';
import 'package:my_app/core/entities/delivery_address_entity.dart';
part 'delivery_address_store.g.dart';

class DeliveryAddressStore = _DeliveryAddressStoreBase with _$DeliveryAddressStore;

abstract class _DeliveryAddressStoreBase with Store {
  _DeliveryAddressStoreBase() {
    addDeliveryAddress(AddressEntity(
      id: 1,
      zipCode: '06455-555',
      city: 'São Paulo',
      neighborhood: 'Centro',
      number: '930',
      street: 'Av. Paulista',
      state: 'SP',
    ));

    deliveryAddressEntity = AddressEntity(
      id: 1,
      zipCode: '06455-555',
      city: 'São Paulo',
      neighborhood: 'Centro',
      number: '930',
      street: 'Av. Paulista',
      state: 'SP',
    );
  }

  @observable
  int selectedDeliveryAddressId = 1;

  @observable
  AddressEntity? deliveryAddressEntity;

  @action
  setSelectedDeliveryAddressId(int value) {
    if (value != selectedDeliveryAddressId) return selectedDeliveryAddressId = value;
  }

  @action
  setSelectedDeliveryAddress(int value) {
    deliveryAddressEntity = deliveryAddresses.where((element) => element.id == value).first;
  }

  ObservableList<AddressEntity> deliveryAddresses = ObservableList<AddressEntity>();

  @action
  addDeliveryAddress(AddressEntity addressEntity) {
    deliveryAddresses.add(addressEntity);
  }

  @action
  removeDeliveryAddress(AddressEntity addressEntity) {
    deliveryAddresses.remove(addressEntity);
  }
}
