import 'package:mobx/mobx.dart';
import 'package:my_app/core/entities/delivery_address_entity.dart';
part 'delivery_address_store.g.dart';

class DeliveryAddressStore = _DeliveryAddressStoreBase with _$DeliveryAddressStore;

abstract class _DeliveryAddressStoreBase with Store {
  _DeliveryAddressStoreBase() {
    addDeliveryAddress(DeliveryAddressEntity(
      cep: '06455-555',
      city: 'São Paulo',
      neighborhood: 'Centro',
      number: '930',
      street: 'Av. Paulista',
      uf: 'SP',
    ));
  }

  ObservableList<DeliveryAddressEntity> deliveryAddresses = ObservableList<DeliveryAddressEntity>();

  List<DeliveryAddressEntity> deliveryTest = [
    DeliveryAddressEntity(
      cep: '06455-555',
      city: 'São Paulo',
      neighborhood: 'Centro',
      number: '930',
      street: 'Av. Paulista',
      uf: 'SP',
    )
  ];

  @action
  addDeliveryAddress(DeliveryAddressEntity addressEntity) {
    // var list = deliveryAddresses;
    // list.add(addressEntity);
    // deliveryAddresses.clear();
    deliveryAddresses.add(addressEntity);
  }
}
