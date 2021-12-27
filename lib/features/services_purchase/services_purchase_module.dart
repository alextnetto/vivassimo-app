import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/delete_payment_method_store.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/new_credit_card_store.dart';
import 'package:my_app/core/shared_modules/credit_card/presentation/stores/payment_method_store.dart';
import 'package:my_app/features/services_purchase/presentation/stores/service_select_section_amount_store.dart';
import 'presentation/stores/new_credit_card_cvv_store.dart';

class ServicesPurchaseModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.factory((i) => ServiceSelectSectionAmountStore()),
      Bind.factory((i) => PaymentMethodStore()),
      Bind.factory((i) => NewCreditCardStore()),
      Bind.factory((i) => NewCreditCardCvvStore()),
      Bind.factory((i) => DeletePaymentMethodStore()),
    ];
  }
}
