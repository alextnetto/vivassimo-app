import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/formatters/app_formatter.dart';
part 'product_announcement_review_store.g.dart';

class ProductAnnouncementReviewStore = _ProductAnnouncementReviewStoreBase with _$ProductAnnouncementReviewStore;

abstract class _ProductAnnouncementReviewStoreBase with Store {
  String calculateContributionText(num value) {
    var val = value / 100 * 10;

    return '${AppFormatter.displayValueFormatter(val)} (10%)';
  }

  String formatToReal(num valor) {
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    String newText = formatter.format(valor);

    return newText;
  }
}
