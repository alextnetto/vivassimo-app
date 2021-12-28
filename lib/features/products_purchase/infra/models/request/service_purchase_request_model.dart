import 'package:my_app/core/entities/service_entity.dart';
import 'package:my_app/features/products_purchase/domain/entities/payment_method_entity.dart';

class ServicePurchaseRequestModel {
  ServiceEntity? serviceEntity;
  PaymentMethodEntity? paymentMethodEntity;
  num? totalPurchase;
  int? amountSessions;
  int? maxInstallments;

  ServicePurchaseRequestModel({
    this.serviceEntity,
    this.paymentMethodEntity,
    this.totalPurchase,
    this.amountSessions,
    this.maxInstallments,
  });
}
