import 'package:mobx/mobx.dart';
part 'shipping_method_store.g.dart';

class ShippingMethodStore = _ShippingMethodStoreBase with _$ShippingMethodStore;

abstract class _ShippingMethodStoreBase with Store {
  @observable
  String shippingMethodType = 'PAC';

  @action
  setShippingMethodType(String value) {
    if (shippingMethodType != value) return shippingMethodType = value;
  }
}
