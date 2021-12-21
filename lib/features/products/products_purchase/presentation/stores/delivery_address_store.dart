import 'package:mobx/mobx.dart';
import 'package:my_app/core/entities/delivery_address_entity.dart';
part 'delivery_address_store.g.dart';

class DeliveryAddressStore = _DeliveryAddressStoreBase with _$DeliveryAddressStore;

abstract class _DeliveryAddressStoreBase with Store {
  _DeliveryAddressStoreBase() {
    addDeliveryAddress(DeliveryAddressEntity(
      id: 1,
      cep: '06455-555',
      city: 'São Paulo',
      neighborhood: 'Centro',
      number: '930',
      street: 'Av. Paulista',
      uf: 'SP',
    ));

    deliveryAddressEntity = DeliveryAddressEntity(
      id: 1,
      cep: '06455-555',
      city: 'São Paulo',
      neighborhood: 'Centro',
      number: '930',
      street: 'Av. Paulista',
      uf: 'SP',
    );
  }

  @observable
  int selectedDeliveryAddressId = 1;

  @observable
  DeliveryAddressEntity? deliveryAddressEntity;

  @action
  setSelectedDeliveryAddressId(int value) {
    if (value != selectedDeliveryAddressId) return selectedDeliveryAddressId = value;
  }

  @action
  setSelectedDeliveryAddress(int value) {
    deliveryAddressEntity = deliveryAddresses.where((element) => element.id == value).first;
  }

  ObservableList<DeliveryAddressEntity> deliveryAddresses = ObservableList<DeliveryAddressEntity>();

  @action
  addDeliveryAddress(DeliveryAddressEntity addressEntity) {
    deliveryAddresses.add(addressEntity);
  }
}
