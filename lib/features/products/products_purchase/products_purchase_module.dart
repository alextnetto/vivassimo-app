import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/products/products_purchase/presentation/stores/new_delivery_address_store.dart';

class ProductsPurchaseModule extends Module {
  @override
  List<Bind> get binds {
    return [
      // Bind.factory((i) => HttpService()),
      // Bind.factory((i) => LoginDatasource(i())),
      // Bind.factory((i) => LoginRepository(i())),
      // Bind.factory((i) => LoginUsecase(i(), i())),
      Bind.factory((i) => NewDeliveryAddressStore()),
    ];
  }
}
