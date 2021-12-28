import 'package:mobx/mobx.dart';
part 'product_announcement_delivery_store.g.dart';

class ProductAnnouncementDeliveryStore = _ProductAnnouncementDeliveryStoreBase with _$ProductAnnouncementDeliveryStore;

abstract class _ProductAnnouncementDeliveryStoreBase with Store {
  String deliveryTypeDescription = 'Enviar pelos Correios';

  @observable
  int deliveryTypeId = 1;

  @action
  setDeliveryTypeId(int value, String description) {
    // if (value != deliveryTypeId) {
    deliveryTypeDescription = description;
    deliveryTypeId = value;
    // }
  }

  @observable
  bool isToSendByCorreios = false;

  @action
  setIsToSendByCorreios(bool value) => isToSendByCorreios = value;

  @observable
  bool isToNegotiateWithBuyer = false;

  @action
  setIsToNegotiateWithBuyer(bool value) => isToNegotiateWithBuyer = value;

  @computed
  bool get enableButton => isToSendByCorreios || isToNegotiateWithBuyer;
}
