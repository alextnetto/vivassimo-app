import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/formatters/display_value_formatter.dart';
part 'service_select_section_amount_store.g.dart';

class ServiceSelectSectionAmountStore = _ServiceSelectSectionAmountStoreBase with _$ServiceSelectSectionAmountStore;

abstract class _ServiceSelectSectionAmountStoreBase with Store {
  @observable
  num serviceValue = 0.0;

  @action
  setServiceValue(num value) => serviceValue = value;

  @observable
  int amountSessions = 1;

  @action
  setSessionsAmount(int value) => amountSessions = value;

  @action
  increaseInstallment() {
    if (amountSessions < 9) return amountSessions++;
  }

  @action
  decreaseInstallment() {
    if (amountSessions > 1) return amountSessions--;
  }

  @computed
  String get getSessionsAmountValue {
    var value = serviceValue * amountSessions;
    return AppFormatter.displayValueFormatter(value);
  }

  @computed
  String get getInstallmentsAmountValue {
    var total = serviceValue * amountSessions;
    var value = total / 3;
    return AppFormatter.displayValueFormatter(value);
  }

  String get formatSessionsAmount {
    if (amountSessions < 10) {
      return '0$amountSessions';
    }

    return amountSessions.toString();
  }
}
