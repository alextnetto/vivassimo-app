import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/formatters/display_value_formatter.dart';
part 'product_value_store.g.dart';

class ProductValueStore = _ProductValueStoreBase with _$ProductValueStore;

abstract class _ProductValueStoreBase with Store {
  @observable
  num productValue = 0.0;

  @observable
  String productValueString = '';

  @observable
  bool hasChangedProductValueString = false;

  @action
  setProductValue(num value) => productValue = value;

  @action
  setProductValueString(String value) {
    hasChangedProductValueString = true;
    // formatProductValueStringToDouble(value);
    productValue = AppFormatter.convertStringToDouble(value);

    return productValueString = value;
  }

  @computed
  bool get enableButton => getProductValueError == null && hasChangedProductValueString;

  @computed
  String? get getProductValueError {
    if (!hasChangedProductValueString) {
      return null;
    } else if (productValueString.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (productValueString == '0,00') {
      return 'Valor inválido';
    }

    return null;
  }

  // formatProductValueStringToDouble(String value) {
  //   var valueFormatted =

  //   productValue = double.parse(valueFormatted);
  //   print(valueFormatted);
  // }
}
