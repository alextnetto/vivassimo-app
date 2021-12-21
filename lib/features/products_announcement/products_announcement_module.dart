import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_announcement_delivery_store.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_photo_confirmation_store.dart';

class ProductsAnnouncementModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.factory((i) => ProductPhotoConfirmationStore()),
      Bind.factory((i) => ProductAnnouncementDeliveryStore()),
    ];
  }
}
