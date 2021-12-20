import 'package:mobx/mobx.dart';
part 'product_announcement_delivery_store.g.dart';

class ProductAnnouncementDeliveryStore = _ProductAnnouncementDeliveryStoreBase with _$ProductAnnouncementDeliveryStore;

abstract class _ProductAnnouncementDeliveryStoreBase with Store {
  @observable
  int deliveryTypeId = 1;

  @action
  setDeliveryTypeId(int value) {
    if (value != deliveryTypeId) return deliveryTypeId = value;
  }
}
