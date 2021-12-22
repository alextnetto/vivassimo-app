import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_announcement_delivery_store.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_announcement_info_store.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_announcement_review_store.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_description_store.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_photo_confirmation_store.dart';
import 'package:my_app/features/products_announcement/presentation/stores/product_value_store.dart';

class ProductAnnouncementModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.factory((i) => ProductPhotoConfirmationStore()),
      Bind.factory((i) => ProductAnnouncementDeliveryStore()),
      Bind.factory((i) => ProducAnnouncementInfoStore()),
      Bind.factory((i) => ProductDescriptionStore()),
      Bind.factory((i) => ProductValueStore()),
      Bind.factory((i) => ProductAnnouncementReviewStore()),
    ];
  }
}
