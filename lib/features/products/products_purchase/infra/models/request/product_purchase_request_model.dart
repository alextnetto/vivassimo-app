import 'package:my_app/core/entities/delivery_address_entity.dart';
import 'package:my_app/core/entities/product_entity.dart';
import 'package:my_app/features/products/products_purchase/domain/entities/payment_method_entity.dart';
import 'package:my_app/features/products/products_purchase/domain/entities/shipping_method_entity.dart';

class ProductPurchaseRequestModel {
  ProductEntity? productEntity;
  DeliveryAddressEntity? deliveryAddressEntity;
  ShippingMethodEntity? shippingMethodEntity;
  PaymentMethodEntity? paymentMethodEntity;
  num? totalPurchase;

  ProductPurchaseRequestModel({
    this.productEntity,
    this.deliveryAddressEntity,
    this.shippingMethodEntity,
    this.paymentMethodEntity,
    this.totalPurchase,
  });
}
