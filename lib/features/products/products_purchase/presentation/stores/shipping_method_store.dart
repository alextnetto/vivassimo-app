import 'package:mobx/mobx.dart';
import 'package:my_app/features/products/products_purchase/domain/entities/shipping_method_entity.dart';
part 'shipping_method_store.g.dart';

class ShippingMethodStore = _ShippingMethodStoreBase with _$ShippingMethodStore;

abstract class _ShippingMethodStoreBase with Store {
  _ShippingMethodStoreBase() {
    shippingMethods.add(ShippingMethodEntity(id: 1, name: 'PAC', deliveryTime: '2 Dias Úteis', value: 0.0));
    shippingMethods.add(ShippingMethodEntity(id: 2, name: 'Sedex', deliveryTime: '1 Dias Útil', value: 14.00));

    shippingMethodEntity = ShippingMethodEntity(id: 1, name: 'PAC', deliveryTime: '2 Dias Úteis', value: 0.0);
  }

  ObservableList<ShippingMethodEntity> shippingMethods = ObservableList<ShippingMethodEntity>();
  num totalPurchaseProduct = 0.0;

  @observable
  String shippingMethodType = 'PAC';

  @observable
  ShippingMethodEntity? shippingMethodEntity;

  @observable
  num totalPurchase = 0.0;

  @action
  setTotalPurchase(num value) {
    totalPurchase = value;
  }

  @action
  calculateShippingPrice(num price) {
    if (price > 0) {
      totalPurchase += price;
    } else {
      totalPurchase = totalPurchaseProduct;
    }
  }

  @action
  setShippingMethodEntity(int value) {
    shippingMethodEntity = shippingMethods.where((element) => element.id == value).first;
  }

  @action
  setShippingMethodType(String value) {
    shippingMethodEntity = shippingMethods.where((element) => element.name == value).first;

    if (shippingMethodType != value) {
      shippingMethodType = value;
      calculateShippingPrice(shippingMethodEntity!.value!);
    }
  }
}
