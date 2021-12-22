import 'package:mobx/mobx.dart';
part 'product_announcement_delivery_store.g.dart';

class ProductAnnouncementDeliveryStore = _ProductAnnouncementDeliveryStoreBase with _$ProductAnnouncementDeliveryStore;

abstract class _ProductAnnouncementDeliveryStoreBase with Store {
  String deliveryTypeDescription = 'Enviar pelos \n Correios';

  @observable
  int deliveryTypeId = 1;

  @action
  setDeliveryTypeId(int value, String description) {
    if (value != deliveryTypeId) {
      deliveryTypeDescription = description;
      deliveryTypeId = value;
    }
  }
}
